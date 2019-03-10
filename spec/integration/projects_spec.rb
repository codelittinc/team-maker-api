require 'swagger_helper'

describe 'Projects API' do
  path '/projects' do
    get 'Retrieves all projects' do
      tags 'Projects'
      produces 'application/json'

      response '200', 'OK' do
        before do
          create(:project)
        end

        schema type: :json,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 project_status_id: { type: :integer }
               },
               required: %w[name project_status_id]

        run_test!
      end
    end
  end

  path '/projects/{id}' do
    get 'Retrieves a project' do
      tags 'Projects'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 project_status_id: { type: :integer }
               },
               required: %w[name project_status_id]

        let(:id) { create(:project).id }

        run_test!
      end

      response '200', "Couldn't find Project with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
    path '/projects' do
      post 'Creates a project' do
        tags 'Projects'
        consumes 'application/json'
        parameter name: :project, in: :body, schema: {
          type: :object,
          properties: {
          name: { type: :string },
          project_status_id: { type: :integer }
          },
          required: %w[name project_status_id]
        }

        response '201', 'Created' do
          let(:project_status) { create(:project_status) }
          let(:project) do
            attributes_for(:project,
                           project_status_id: project_status.id)
          end

          run_test!
        end

        response '422', 'Unprocessable Entity' do
          let(:project) { { name: '' } }
          run_test!
        end
      end
    end
end
