require 'rails_helper'

RSpec.describe "User activation", type: :request do
  it 'make user actives' do
    user = create(:user, status: 0)
    expect(user).to be_inactive
    post '/api/users/activations', params: { id: user.id }
    expect(json_response['email']).to eq user.email
    expect(json_response['status']).to eq 'active'
    user.reload
    expect(user).to be_active
    log = Log.last
    expect(log.text).to eq "User with email #{user.email} has been activated"
  end

  private 

  def json_response
    JSON.parse(response.body)
  end
end
