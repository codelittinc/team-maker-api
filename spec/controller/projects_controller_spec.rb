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
      body_as_json.each { |project| expect(project.keys).to match_array(%w[id name project_status_id]) }
    end

    it { expect(body_as_json).to match(projects.as_json) }
  end

  describe 'GET #show/:id' do
    let(:project) { create(:project) }

    let(:reference_hash) do
      { id: project.id,
        name: project.name,
        project_status_id: project.project_status_id }
    end

    before do
      get :show, params: { id: project.id }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name project_status_id]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'GET #create' do
    let(:project_status) { create(:project_status) }
    let(:project) do
      attributes_for(:project,
                     project_status_id: project_status.id)
    end

    let(:reference_hash) do
      { id: Project.last.id,
        name: Project.last.name,
        project_status_id: project_status.id }
    end

    before do
      get :create, params: { project: project }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name project_status_id]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end
end
