class UsersController < ApplicationController
    # Makes sure whoever requests this page has a valid JWT
    before_action :authenticate_user, only: [:index, :current, :update]
    # before_action :set_user, only: [:show]

    # Should work if the current_user is authenticated.
    def index
        # users = User.all 
        # render json: users
        render json: {status: 200, msg: 'Logged in'}
    end

    def current

        current_user.update!(last_login: Time.now)
        render json: current_user
    end

    def user_params
        params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
    end

    def create
        user = User.new(user_params)
        if user.save 
            render json: {status: 200, msg: 'created'}
        else
            render json: {status: 400, msg: 'failed'}
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: { status: 200, msg: 'User details have been updated.' }
        end
    end

      def destroy
        user = User.find(params[:id])
        if user.destroy
          render json: { status: 200, msg: 'User has been deleted.' }
        end
      end
end
