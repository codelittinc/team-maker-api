require 'swagger_helper'

describe 'Roles API' do
  path '/roles' do

    get 'Retrieves all roles' do
      tags 'Roles'
      produces 'application/json'

      response '200', 'OK' do
        Role.create(name: 'Designer')

        schema type: :json,
          properties: {
            id: { type: :integer, },
            name: { type: :string }
          },
          required: [ 'id', 'name' ]

        run_test!
      end
    end
  end
end