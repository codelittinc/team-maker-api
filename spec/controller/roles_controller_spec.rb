require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  describe 'GET #index' do
    before do
      Role.create(name: 'Engineer')

      get :index
    end

    let(:role) { Role.all }

    it { expect(response.body).to look_like_json }

    it { expect{
          body_as_json.each { |a| expect(a.keys).to match_array(%w[id name]) }
                }
        }

    it { expect(body_as_json).to match(role.as_json) }
  end
end
