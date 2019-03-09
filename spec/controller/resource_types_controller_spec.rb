require 'rails_helper'

RSpec.describe ResourceTypesController, type: :controller do
  describe 'GET #index' do
    before do
      create(:resource_type)

      get :index
    end

    let(:resource_types) { ResourceType.all }

    it { expect(response.body).to look_like_json }

    it 'Every object on response should have the own attributes as keys'do
      body_as_json.each { |resource_type| expect(resource_type.keys).to match_array(%w[id name]) }
    end

    it { expect(body_as_json).to match(resource_types.as_json) }
  end

  describe 'GET #show/:id' do
    let(:resource_type) { create(:resource_type) }

    let(:reference_hash) do
      { id: resource_type.id,
        name: resource_type.name }
    end

    before do
      get :show, params: { id: resource_type.id }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'GET #create' do
    let(:resource_type) { attributes_for(:resource_type) }

    let(:reference_hash) do
      { id: ResourceType.last.id,
        name: ResourceType.last.name }
    end

    before do
      get :create, params: { resource_type: resource_type }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'DELETE #destroy' do
    let(:resource_type) { create(:resource_type) }
    let(:destroy_action) { delete :destroy, params: { id: resource_type.id } }

    before do
      resource_type
    end

    it { expect { destroy_action }. to change(ResourceType, :count).by(-1) }
  end

  describe 'PATCH #update' do
    let(:resource_type) { create(:resource_type) }

    let(:resource_type_updated) do
      { id: ResourceType.last.id,
        name: Faker::HitchhikersGuideToTheGalaxy.character }
    end

    before do
      resource_type

      patch :update, params: { id: resource_type.id, resource_type: resource_type_updated }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(resource_type_updated.as_json) }

    it { expect(body_as_json).to_not match(resource_type.as_json) }
  end
end
