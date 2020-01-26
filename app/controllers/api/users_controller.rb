module Api
  class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      user.save
      event = UserCreated.new(data: { user: user })
      $event_store.publish(event)
      render json: { email: user.email }
    end

    def show
      user = User.find_by(id: params[:id])
      render json: { email: user.email, status: user.status }
    end

    private 

    def user_params
      params.require(:user).permit(:email)
    end
  end
end