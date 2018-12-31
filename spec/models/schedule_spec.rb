require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it { is_expected.to have_one(:period).dependent(:destroy) }
  
  it { is_expected.to belong_to(:project) }
  
  it { is_expected.to belong_to(:schedule_type) }
  
  it { is_expected.to belong_to(:resource) }
end