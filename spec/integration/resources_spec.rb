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
        required: [ 'name', 'role_id', 'resource_type_id' ]
      }

      response '201', 'Created' do
        let(:role) { Role.create!(name: 'Engineer') }
        let(:resources_type) { ResourceType.create!(name: 'Contractor') }
        let(:resource) { { name: 'Kaio Cristian',
                           role_id: role.id,
                           resource_type_id: resources_type.id } }
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
          required: [ 'name', 'role_id', 'resource_type_id' ]
        
        let(:role) { Role.create!(name: 'Designer') }
        let(:resources_type) { ResourceType.create!(name: 'Contractor') }
        let(:id) { Resource.create!(name: 'Kaio Cristian',
                                   role_id: role.id,
                                   resource_type_id: resources_type.id).id }
        run_test!
      end

      response '200', "Couldn't find Tag with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end