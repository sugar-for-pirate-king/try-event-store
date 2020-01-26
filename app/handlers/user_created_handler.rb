class UserCreatedHandler
  def call(event)
    user = event.data[:user]
    user_email = user.email
    Log.create(text: "User with email #{user_email} has been created")
  end
end