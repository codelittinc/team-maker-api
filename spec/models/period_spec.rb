require 'rails_helper'

RSpec.describe Period, type: :model do
  it { is_expected.to have_many(:schedules) }
end