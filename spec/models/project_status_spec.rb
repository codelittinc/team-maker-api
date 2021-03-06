require 'rails_helper'

RSpec.describe ProjectStatus, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_uniqueness_of(:name) }

  it { is_expected.to have_many(:projects) }
end