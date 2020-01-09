class LoginController < ApplicationController
    
    before_action :authenticate_user, only: [:auth]

    def index
        render json: {service: 'auth-api', satus:200}
    end

    def auth
        render json: {status: 200, msg: "you are in #{current_user.first_name}"}
    end
end
