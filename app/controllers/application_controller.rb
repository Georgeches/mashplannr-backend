class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  include ActionController::Cookies

    def render_unprocessable_entity_response(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end

end
