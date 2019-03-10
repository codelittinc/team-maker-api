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

  path '/schedules/{id}' do
    get 'Retrieves a schedule' do
      tags 'Schedules'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 project_id: { type: :integer },
                 resource_id: { type: :integer },
                 schedule_type_id: { type: :integer }
               },
               required: %w[id project_id resource_id schedule_type_id]

        let(:id) { create(:schedule).id }

        run_test!
      end

      response '200', "Couldn't find Schedule with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/schedules' do
    post 'Creates a schedule' do
      tags 'Schedules'
      consumes 'application/json'
      parameter name: :schedule, in: :body, schema: {
        type: :object,
        properties: {
          project_id: { type: :integer },
          resource_id: { type: :integer },
          schedule_type_id: { type: :integer }
        },
        required: %w[project_id resource_id schedule_type_id]
      }

      response '201', 'Created' do
        let(:project) { create(:project) }
        let(:resource) { create(:resource) }
        let(:schedule_type) { create(:schedule_type) }
        let(:schedule) do
          attributes_for(:schedule,
                         project_id: project.id,
                         resource_id: resource.id,
                         schedule_type_id: schedule_type.id)
        end

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:schedule) do
          attributes_for(:schedule,
                         project_id: '',
                         resource_id: '',
                         schedule_type_id: '')
        end
        run_test!
      end
    end
  end

  path '/schedules/{id}' do
    delete 'Deletes a schedule' do
      tags 'Schedules'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'No Content' do
        let(:id) { create(:schedule).id }

        run_test!
      end

      response '200', "Couldn't find Schedule with 'id'=#{id}" do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/schedules/{id}' do
    patch 'Updates a schedule' do
      tags 'Schedules'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :schedule, in: :body, schema: {
        type: :object,
        properties: {
          project_id: { type: :integer },
          resource_id: { type: :integer },
          schedule_type_id: { type: :integer }
        },
        required: %w[project_id resource_id schedule_type_id]
      }

      response '200', 'OK' do
        let(:id) { create(:schedule).id }
        let(:project) { create(:project) }
        let(:resource) { create(:resource) }
        let(:schedule_type) { create(:schedule_type) }
        let(:schedule) do
          attributes_for(:schedule,
                         project_id: project.id,
                         resource_id: resource.id,
                         schedule_type_id: schedule_type.id)
        end

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:id) { create(:schedule).id }
        let(:schedule) do
          attributes_for(:schedule,
                         project_id: '',
                         resource_id: '',
                         schedule_type_id: '')
        end
        run_test!
      end
    end
  end
end
