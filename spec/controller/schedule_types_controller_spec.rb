require 'rails_helper'

RSpec.describe ScheduleTypesController, type: :controller do
  describe 'GET #index' do
    before do
      create(:schedule_type)

      get :index
    end

    let(:schedule_types) { ScheduleType.all }

    it { expect(response.body).to look_like_json }

    it 'Every object on response should have the own attributes as keys'do
      body_as_json.each { |schedule_type| expect(schedule_type.keys).to match_array(%w[id name]) }
    end

    it { expect(body_as_json).to match(schedule_types.as_json) }
  end
end
