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
end
