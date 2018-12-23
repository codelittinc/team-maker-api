require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  describe 'GET #index' do
    before do
      Role.create(name: 'Engineer')

      get :index
    end

    let(:roles) { Role.all }

    it { expect(response.body).to look_like_json }

    it 'Every object on response should have the own attributes as keys'do
      expect{
             body_as_json.each { |a| expect(a.keys).to match_array(%w[id name]) }
             }
    end

    it { expect(body_as_json).to match(roles.as_json) }
  end
end
