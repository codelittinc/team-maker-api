require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  describe 'GET #index' do
    before do
      Role.create(name: 'Engineer')

      get :index
    end

    let(:role) { Role.first }

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(role.attributes) }
  end
end
