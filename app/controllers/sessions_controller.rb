class SessionsController < ApplicationController
  def login
    merchandiser = Merchandiser.find_by(name: params[:name])
    if merchandiser && merchandiser.authenticate(params[:password])
      session[:merchandisers_id] = merchandiser.id
      render json: merchandiser, status: :created
    else
      render json: { error: 'Unauthorized merchandisersname and password' }, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:merchandisers_id)
    render json: { message: 'Successfully logged out' }
  end
end
