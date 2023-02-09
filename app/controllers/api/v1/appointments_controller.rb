class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @appointments = current_user.appointments
    render json: current_user.appointments.includes([:technician]).order(id: :desc),
           each_serializer: AppointmentSerializer
  end
  # def index
  #   render json: current_user.bookings.includes([:technician]).order(id: :desc), status: :ok
  # end

  def show
    @appointment = Appointment.find(params[:id])
    render json: @appointment, each_serializer: AppointmentSerializer
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: { status: :success, appointment: @appointment, message: ' Technician created successfully' },
             status: :created
    else
      render json: { status: :error, error: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ArgumentError
    render json: { status: :error, message: 'Invalid date format' }, status: :bad_request
  end

  def destroy
    return render json: { error: 'Appointment not found' }, status: :not_found unless @current_appointment

    render json: { message: 'Appointment deleted succesfully.' } if @current_appointment.destroy
  end

  private

  def set_appointment
    @current_appointment = current_user.appointments.find_by(id: params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:location, :date, :technician_id, :user_id)
  end
end
