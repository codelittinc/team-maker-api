require 'rails_helper'

RSpec.describe ResourceTag, type: :model do
  it { is_expected.to belong_to(:resource) }

  it { is_expected.to belong_to(:tag) }
end
