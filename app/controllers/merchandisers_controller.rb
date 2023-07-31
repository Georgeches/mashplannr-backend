class MerchandisersController < ApplicationController
  before_action :authenticate_merchandisers, only: [:show]

  def index
    merchandisers = Merchandiser.all
    render json: merchandisers
  end

  def show
    merchandiser = Merchandiser.find_by(id: session[:merchandiser_id])
    if merchandiser
      render json: merchandiser
    else
      render json: { error: "merchandiser not found" }, status: 404
    end
  end

  def create
    merchandiser = Merchandiser.new(merchandiser_params)

    if merchandiser.save
      session[:merchandiser_id] = merchandiser.id
      render json: { id: merchandiser.id, name: merchandiser.name }, status: :created
    else
      render json: { error: merchandiser.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    merchandiser = Merchandiser.find_by(id: params[:id])
    if merchandiser.update(merchandiser_params)
      render json: merchandiser
    else
      render json: merchandiser.errors, status: :unprocessable_entity
    end
  end

  def destroy
    merchandiser = Merchandiser.find_by(id: params[:id])
    merchandiser.destroy
    head :no_content
  end

  private

  def merchandiser_params
    params.permit(:name, :password, :id_number, :phone_number, :vehicle_registration, :status, :profile_picture)
  end
end
