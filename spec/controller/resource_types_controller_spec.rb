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
end
