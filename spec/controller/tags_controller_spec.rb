require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe 'GET #index' do
    before do
      role = Role.create!(name: 'Engineer')
      resources_type = ResourceType.create!(name: 'Employee')
      resource = Resource.create!(name: 'Kaio Cristian',
                                  role_id: role.id,
                                  resource_type_id: resources_type.id)
      Tag.create!(name: 'Ruby', resource_id: resource.id)

      get :index
    end

    let(:tag) { Tag.first }

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name resource_id]) }

    it { expect(body_as_json).to match(tag.attributes) }
  end
end
