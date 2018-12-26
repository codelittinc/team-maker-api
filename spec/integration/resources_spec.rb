
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
        let(:role) { Role.create!(name: 'VP') }
        let(:resources_type) { ResourceType.create!(name: 'Full Time') }
        let(:resource) do
          { name: 'Raphael',
            role_id: role.id,
            resource_type_id: resources_type.id }
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

        let(:role) { Role.create!(name: 'Intern') }
        let(:resources_type) { ResourceType.create!(name: 'Freela') }
        let(:id) do
          Resource.create!(name: 'Marcelo',
                           role_id: role.id,
                           resource_type_id: resources_type.id).id
        end
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
        role = Role.create!(name: 'Software Developer')
        resources_type = ResourceType.create!(name: 'Temporary')
        Resource.create!(name: 'Ricardo',
                         role_id: role.id,
                         resource_type_id: resources_type.id)

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
        let(:role) { Role.create!(name: 'CEO') }
        let(:resources_type) { ResourceType.create!(name: 'Intern') }
        let(:id) do
          Resource.create!(name: 'João',
                           role_id: role.id,
                           resource_type_id: resources_type.id).id
        end
        run_test!
      end

      response '200', "Couldn't find Tag with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
