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

  path '/resource_types/{id}' do
    get 'Retrieves a resource type' do
      tags 'Resource Types'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 name: { type: :string }
               },
               required: %w[name]

        let(:id) { create(:resource_type).id }

        run_test!
      end

      response '200', "Couldn't find Resource Type with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/resource_types' do
    post 'Creates a resource type' do
      tags 'Resource Types'
      consumes 'application/json'
      parameter name: :resource_type, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: %w[name]
      }

      response '201', 'Created' do
        let(:resource_type) { attributes_for(:resource_type) }

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:resource_type) { { name: '' } }
        run_test!
      end
    end
  end

  path '/resource_types/{id}' do
    delete 'Deletes a resource type' do
      tags 'Resource Types'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'No Content' do
        let(:id) { create(:resource_type).id }

        run_test!
      end

      response '200', "Couldn't find Resource Type with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
