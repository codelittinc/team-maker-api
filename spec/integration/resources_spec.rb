require 'swagger_helper'

describe 'Resources API' do
  path '/resources' do
    post 'Creates a resource' do
      tags 'Resources'
      consumes 'application/json'
      parameter name: :resource, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          role_id: { type: :integer },
          resource_type_id: { type: :integer }
        },
        required: %w[name role_id resource_type_id]
      }

      response '201', 'Created' do
        let(:role) { create(:role) }
        let(:resources_type) { create(:resource_type) }
        let(:resource) do
          attributes_for(:resource,
                         role_id: role.id,
                         resource_type_id: resources_type.id)
        end

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:resource) { { name: '' } }
        run_test!
      end
    end
  end

  path '/resources/{id}' do
    get 'Retrieves a resource' do
      tags 'Resources'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 role_id: { type: :integer },
                 resource_type_id: { type: :integer }
               },
               required: %w[name role_id resource_type_id]

        let(:id) { create(:resource).id }

        run_test!
      end

      response '200', "Couldn't find Tag with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/resources' do
    get 'Retrieves all resources' do
      tags 'Resources'
      produces 'application/json'

      response '200', 'OK' do
        before do
          create(:resource)
        end

        schema type: :json,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 role_id: { type: :integer },
                 resource_type_id: { type: :integer }
               },
               required: %w[name role_id resource_type_id]

        run_test!
      end
    end
  end

  path '/resources/{id}' do
    delete 'Deletes a resource' do
      tags 'Resources'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'No Content' do
        let(:id) { create(:resource).id }

        run_test!
      end

      response '200', "Couldn't find Tag with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/resources/{id}' do
    patch 'Updates a resource' do
      tags 'Resources'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :resource, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          role_id: { type: :integer },
          resource_type_id: { type: :integer }
        },
        required: %w[name role_id resource_type_id]
      }

      response '200', 'OK' do
        let(:id) { create(:resource).id }
        let(:resource) { attributes_for(:resource) }

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:id) { create(:resource).id }
        let(:resource) { { name: '' } }
        run_test!
      end
    end
  end
end
