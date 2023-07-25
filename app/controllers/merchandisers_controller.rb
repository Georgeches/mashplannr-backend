class MerchandisersController < ApplicationController
    def index
        merchandisers = Merchandiser.all
        render json: merchandisers
    end
    
    def show
        merchandiser = Merchandiser.find_by(id: params[:id])
        if merchandiser
            render json: merchandiser
        else
            render json: { error: "merchandiser not found" }, status:404
        end
    end

    def create
        merchandiser = Merchandiser.create!(merchandiser_params)
        render json: merchandiser, status: :created
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
        params.permit(:name, :id_number, :phone_number, :vehicle_registration, :status, :profile_picture)
    end
end