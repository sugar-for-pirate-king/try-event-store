module Api
  module Users
    class ActivationsController < ApplicationController
      def create
        user = User.find_by(id: params[:id])
        user.active!
        Log.create(text: "User with email #{user.email} has been activated")
        render json: { email: user.email, status: user.status }
      end
    end
  end
end