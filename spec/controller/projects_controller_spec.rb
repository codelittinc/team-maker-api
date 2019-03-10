require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'GET #index' do
    before do
      create(:project)

      get :index
    end

    let(:projects) { Project.all }

    it { expect(response.body).to look_like_json }

    it 'Every object on response should have the own attributes as keys'do
      body_as_json.each { |resource| expect(resource.keys).to match_array(%w[id name project_status_id]) }
    end

    it { expect(body_as_json).to match(projects.as_json) }
  end
end
