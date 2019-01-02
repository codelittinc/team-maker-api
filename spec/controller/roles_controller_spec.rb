require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  describe 'GET #index' do
    before do
      create(:role)

      get :index
    end

    let(:roles) { Role.all }

    it { expect(response.body).to look_like_json }

    it 'Every object on response should have the own attributes as keys'do
      body_as_json.each { |role| expect(role.keys).to match_array(%w[id name]) }
    end

    it { expect(body_as_json).to match(roles.as_json) }
  end
end
