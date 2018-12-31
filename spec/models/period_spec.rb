require 'rails_helper'

RSpec.describe Period, type: :model do
  it { is_expected.to belong_to(:schedule) }

  it { is_expected.to validate_presence_of(:starts_at) }

  it { is_expected.to validate_presence_of(:ends_at) }
end
