require 'rails_helper'

RSpec.describe Resource, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_uniqueness_of(:name) }

  it { is_expected.to belong_to(:resource_type) }

  it { is_expected.to belong_to(:role) }

  it { is_expected.to have_many(:schedules) }
end