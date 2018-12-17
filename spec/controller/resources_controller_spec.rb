require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  describe 'GET #index' do
    before do
      role = Role.create!(name: 'Engineer')
      resources_type = ResourceType.create!(name: 'Employee')
      Resource.create!(name: 'Kaio Cristian',
                       role_id: role.id,
                       resource_type_id: resources_type.id)

      get :index
    end

    let(:resources) { Resource.first }

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name role_id resource_type_id]) }

    it { expect(body_as_json).to match(resources.attributes) }
  end
end
