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
end
