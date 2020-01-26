module Api
  module Users
    class ActivationsController < ApplicationController
      def create
        user = User.find_by(id: params[:id])
        user.active!
        event = UserActivated.new(data: { user: user })
        $event_store.publish(event)
        render json: { email: user.email, status: user.status }
      end
    end
  end
end