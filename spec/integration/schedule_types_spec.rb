require 'swagger_helper'

describe 'Schedule Types API' do
  path '/schedule_types' do
    get 'Retrieves all schedule types' do
      tags 'Schedule Types'
      produces 'application/json'

      response '200', 'OK' do
        before do
          create(:schedule_type)
        end

        schema type: :json,
               properties: {
                 id: { type: :integer },
                 name: { type: :string }
               },
               required: %w[name]

        run_test!
      end
    end
  end
end
