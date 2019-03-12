require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe 'GET #index' do
    before do
      create(:tag)

      get :index
    end

    let(:tags) { Tag.all }

    it { expect(response.body).to look_like_json }

    it 'Every object on response should have the own attributes as keys' do
      body_as_json.each { |tag| expect(tag.keys).to match_array(%w[id name]) }
    end

    it { expect(body_as_json).to match(tags.as_json) }
  end

  describe 'GET #show/:id' do
    let(:tag) { create(:tag) }

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
    let(:tag) { attributes_for(:tag) }

    let(:reference_hash) do
      { id: Tag.last.id,
        name: Tag.last.name }
    end

    before do
      get :create, params: { tag: tag }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'DELETE #destroy' do
    let(:tag) { create(:tag) }
    let(:destroy_action) { delete :destroy, params: { id: tag.id } }

    before do
      tag
    end

    it { expect { destroy_action }. to change(Tag, :count).by(-1) }
  end

  describe 'PATCH #update' do
    let(:tag) { create(:tag) }
    let(:tag_updated) do
      { id: Tag.last.id,
        name: Faker::ProgrammingLanguage.name }
    end

    before do
      tag

      patch :update, params: { id: tag.id, tag: tag_updated }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(tag_updated.as_json) }

    it { expect(body_as_json).to_not match(tag.as_json) }
  end
end
