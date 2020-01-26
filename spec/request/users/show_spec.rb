require 'rails_helper'

RSpec.describe 'Show user information', type: :request do
  it 'returns expected user' do
    user = create(:user, email: 'pquest@gmail.com')
    get "/api/users/#{user.id}"
    expect(json_response['email']).to eq 'pquest@gmail.com'
    expect(json_response['status']).to eq 'inactive'
  end

  private 

  def json_response
    JSON.parse(response.body)
  end  
end