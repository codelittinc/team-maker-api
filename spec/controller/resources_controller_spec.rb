require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  describe 'GET #index' do
    before do
      create(:resource)

      get :index
    end

    let(:resources) { Resource.all }

    it { expect(response.body).to look_like_json }

    it 'Every object on response should have the own attributes as keys'do
      body_as_json.each { |resource| expect(resource.keys).to match_array(%w[id name resource_type_id role_id]) }
    end

    it { expect(body_as_json).to match(resources.as_json) }
  end

  describe 'GET #show/:id' do
    let(:resource) { create(:resource) }

    let(:reference_hash) do
      { id: resource.id,
        name: resource.name,
        role_id: resource.role_id,
        resource_type_id: resource.resource_type_id }
    end

    before do
      get :show, params: { id: resource.id }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name role_id resource_type_id]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'GET #create' do
    let(:role) { create(:role) }
    let(:resources_type) { create(:resource_type) }
    let(:resource) do
      attributes_for(:resource,
                     role_id: role.id,
                     resource_type_id: resources_type.id)
    end

    let(:reference_hash) do
      { id: Resource.last.id,
        name: Resource.last.name,
        role_id: role.id,
        resource_type_id: resources_type.id }
    end

    before do
      get :create, params: { resource: resource }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name role_id resource_type_id]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'DELETE #destroy' do
    let(:resource) { create(:resource) }
    let(:destroy_action) { delete :destroy, params: { id: resource.id } }

    before do
      resource
    end

    it { expect { destroy_action }. to change(Resource, :count).by(-1) }
  end

  describe 'PATCH #update' do
    let(:role) { create(:role) }
    let(:resources_type) { create(:resource_type) }
    let(:resource) { create(:resource) }

    let(:resource_updated) do
      { id: Resource.last.id,
        name: Resource.last.name,
        role_id: role.id,
        resource_type_id: resources_type.id }
    end

    before do
      resource

      patch :update, params: { id: resource.id, resource: resource_updated }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name role_id resource_type_id]) }

    it { expect(body_as_json).to match(resource_updated.as_json) }

    it { expect(body_as_json).to_not match(resource) }
  end
end
