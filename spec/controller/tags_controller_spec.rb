require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe 'GET #index' do
    before do
      Tag.create!(name: 'Ruby')

      get :index
    end

    let(:tag) { Tag.all }

    it { expect(response.body).to look_like_json }

    it { expect{
          body_as_json.each { |a| expect(a.keys).to match_array(%w[id name]) }
                }
        }

    it { expect(body_as_json).to match(tag.as_json) }
  end

  describe 'GET #show/:id' do
    let(:tag) { Tag.create!(name: 'Ruby') }

    let(:reference_hash) do
      { id: tag.id,
        name: tag.name }
    end

    before do
      get :show, params: { id: tag.id }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'GET #create' do
    let(:tag) { { name: 'Ruby' } }

    let(:reference_hash) do
      { id: Tag.last.id,
        name: 'Ruby' }
    end

    before do
      get :create, params: { tag: tag }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'DELETE #destroy' do
    let(:tag) { Tag.create!(name: 'Ruby') }
    let(:destroy_action) { delete :destroy, params: { id: tag.id } }

    before do
      tag
    end

    it { expect { destroy_action }. to change(Tag, :count).by(-1) }
  end

  describe 'PATCH #update' do
    let(:tag) { Tag.create!(name: 'Ruby') }
    let(:tag_updated) do
      { id: Tag.last.id,
        name: 'Rails' }
    end

    before do
      tag

      patch :update, params: { id: tag.id, tag: tag_updated }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(tag_updated.as_json) }

    it { expect(body_as_json).to_not match(tag) }
  end
end
