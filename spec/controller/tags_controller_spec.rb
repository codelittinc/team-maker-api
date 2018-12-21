require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe 'GET #show/:id' do
    let(:role) { Role.create!(name: 'Engineer') }
    let(:resources_type) { ResourceType.create!(name: 'Employee') }
    let(:resource) { Resource.create!(name: 'Kaio Cristian',
                                  role_id: role.id,
                                  resource_type_id: resources_type.id) }
    let(:tag) { Tag.create!(name: 'Ruby', resource_id: resource.id) }

    let(:reference_hash) do
      { id: tag.id,
        name: tag.name,
        resource_id: tag.resource_id }
    end

    before do
      get :show, params: { id: tag.id }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name resource_id]) }

    it { expect(body_as_json).to match(reference_hash) }
  end
end
