require 'swagger_helper'

describe 'Tags API' do
  path '/tags' do

    post 'Creates a tag' do
      tags 'Tags'
      consumes 'application/json'
      parameter name: :tag, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: [ 'name' ]
      }

      response '201', 'Created' do
        let(:tag) { attributes_for(:tag) }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:tag) { { name: '' } }
        run_test!
      end
    end
  end

  path '/tags/{id}' do

    get 'Retrieves a tag' do
      tags 'Tags'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string }
          },
          required: [ 'id', 'name' ]

        let(:id) { create(:tag).id }
        run_test!
      end

      response '200', "Couldn't find Tag with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/tags' do

    get 'Retrieves all tags' do
      tags 'Tags'
      produces 'application/json'

      response '200', 'OK' do
        before do
          create(:tag)
        end

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

  path '/tags/{id}' do

    delete 'Deletes a tag' do
      tags 'Tags'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'No Content' do
        let(:id) { create(:tag).id }
        run_test!
      end

      response '200', "Couldn't find Tag with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/tags/{id}' do
    patch 'Updates a tag' do
      tags 'Tags'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :tag, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: %w[name]
      }

      response '200', 'OK' do
        let(:id) { create(:tag).id }
        let(:tag) { attributes_for(:tag) }

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:id) { create(:tag).id }
        let(:tag) { { name: '' } }
        run_test!
      end
    end
  end
end
