class TechniciansController < ApplicationController
  def index
    @technicians = Technician.all
    render json: @technicians, each_serializer: TechnicianSerializer
  end

  def show
    @technician = Technician.find(params[:id])
    render json: @technician, each_serializer: TechnicianSerializer
  end
end
