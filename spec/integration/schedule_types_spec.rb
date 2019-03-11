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

  path '/schedule_types/{id}' do
    get 'Retrieves a schedule type' do
      tags 'Schedule Types'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 name: { type: :string }
               },
               required: %w[name]

        let(:id) { create(:schedule_type).id }

        run_test!
      end

      response '200', "Couldn't find Schedule Type with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
