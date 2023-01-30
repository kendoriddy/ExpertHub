class TechniciansController < ApplicationController
  def index
    @technicians = Technician.all
    render json: @technicians, each_serializer: TechnicianSerializer
  end

  def show
    @technician = Technician.find(params[:id])
    render json: @technician, each_serializer: TechnicianSerializer
  end

  def new
    @technician = Technician.new
  end

  def create
    @technician = Technician.new(technician_params)
    if @technician.save
      render json: {
               status: 'success',
               message: ' Techician created successfully'
             },
             status: :created
    else
      render json: {
               status: 'error',
               message: @technician.errors
             },
             status: :unprocessable_entity
    end
  end

  def update
    @technician = Techician.find(params[:id]).update(technician_params)
    if @technician
      render json: {
               status: 'success',
               message: ' Techician Update successfully'
             },
             status: :ok
    else
      render json: {
               status: 'error',
               message: @technician.errors
             },
             status: :unprocessable_entity
    end
  end

  def destroy
    @technician = Technician.find(params[:id])
    @technician.destroy
    render json: {
             status: 'success',
             message: 'Techician deleted successfully'
           },
           status: :ok
  end

  private

  def technician_params
    params.require(:technician).permit(:name, :location, :charges, :image, :spacialiazation)
  end
end
