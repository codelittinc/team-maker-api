require 'swagger_helper'

describe 'Resource Types API' do
  path '/resource_types' do
    get 'Retrieves all resource_types' do
      tags 'Resource Types'
      produces 'application/json'

      response '200', 'OK' do
        before do
          create(:resource_type)
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
