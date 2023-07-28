class MerchandisersController < ApplicationController
     before_action :authenticate_user, only: [:show]
    def index
        merchandisers = Merchandiser.all
        render json: merchandisers
    end
    
    def show
        merchandiser = Merchandiser.find_by(id: session[:merchandiser_id])
        if merchandiser
            render json: merchandiser
        else
            render json: { error: "merchandiser not found" }, status:404
        end
    end

    def create
        merchandiser = Merchandiser.create!(merchandiser_params)
       
    if user.valid?
      session[:user_id] = merchandiser.id
      render json: { id: user.id, username: user.username, address: user.address, phone: user.phone }, status: :created
    else
        render json: merchandiser, status: :created
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