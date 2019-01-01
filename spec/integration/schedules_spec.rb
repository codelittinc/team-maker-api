require 'swagger_helper'

describe 'Schedules API' do
  path '/schedules' do
    get 'Retrieves all schedules' do
      tags 'Schedules'
      produces 'application/json'

      response '200', 'OK' do
        before do
          create(:schedule)
        end

        schema type: :json,
               properties: {
                 id: { type: :integer },
                 project_id: { type: :integer },
                 resource_id: { type: :integer },
                 schedule_type_id: { type: :integer }
               },
               required: %w[id project_id resource_id schedule_type_id]

        run_test!
      end
    end
  end

  path '/schedules/{id}' do
    get 'Retrieves a schedule' do
      tags 'Schedules'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 project_id: { type: :integer },
                 resource_id: { type: :integer },
                 schedule_type_id: { type: :integer }
               },
               required: %w[id project_id resource_id schedule_type_id]

        let(:id) { create(:schedule).id }

        run_test!
      end

      response '200', "Couldn't find Schedule with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
