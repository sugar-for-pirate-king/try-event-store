require 'rails_helper'

RSpec.describe "Create new user", type: :request do
  it 'creates expected user' do
    post '/api/users', params: { user: { email: 'pquest@gmail.com' } }
    expect(json_response['email']).to eq 'pquest@gmail.com'
    user = User.find_by(email: 'pquest@gmail.com')
    expect(user).to be_inactive
    log = Log.last
    expect(log.text).to eq 'User with email pquest@gmail.com has been created'
  end

  private 

  def json_response
    JSON.parse(response.body)
  end
end