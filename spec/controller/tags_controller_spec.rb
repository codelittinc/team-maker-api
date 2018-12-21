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

  describe 'GET #create' do
    let(:role) { Role.create!(name: 'Engineer') }
    let(:resources_type) { ResourceType.create!(name: 'Employee') }
    let(:resource) { Resource.create!(name: 'Kaio Cristian',
                                      role_id: role.id,
                                      resource_type_id: resources_type.id) }

    let(:tag) { { name: 'Ruby', resource_id: resource.id } }

    let(:reference_hash) do
      { id: Tag.last.id,
        name: 'Ruby',
        resource_id: resource.id }
    end

    before do
      get :create, params: { tag: tag }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name resource_id]) }

    it { expect(body_as_json).to match(reference_hash) }
  end

  describe 'DELETE #destroy' do
    let(:role) { Role.create!(name: 'Engineer') }
    let(:resources_type) { ResourceType.create!(name: 'Employee') }
    let(:resource) { Resource.create!(name: 'Kaio Cristian',
                                   role_id: role.id,
                                   resource_type_id: resources_type.id) }
    let(:tag) { Tag.create!(name: 'Ruby', resource_id: resource.id) }
    let(:destroy_action) { delete :destroy, params: { id: tag.id } }

    before do
      tag
    end

    it { expect { destroy_action }. to change(Tag, :count).by(-1) }
  end

  describe 'PATCH #update' do
    let(:role) { Role.create!(name: 'Engineer') }
    let(:resources_type) { ResourceType.create!(name: 'Employee') }
    let(:resource) { Resource.create!(name: 'Kaio Cristian',
                                   role_id: role.id,
                                   resource_type_id: resources_type.id) }
    let(:tag) { Tag.create!(name: 'Ruby', resource_id: resource.id) }
    let(:tag_updated) do
      { id: Tag.last.id,
        name: 'Rails',
        resource_id: resource.id }
    end

    before do
      tag

      patch :update, params: { id: tag.id, tag: tag_updated }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name resource_id]) }

    it { expect(body_as_json).to match(tag_updated) }

    it { expect(body_as_json).to_not match(tag) }
  end
end
