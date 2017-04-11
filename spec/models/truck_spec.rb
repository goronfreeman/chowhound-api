require 'rails_helper'

RSpec.describe Truck, type: :model do
  it { should belong_to(:business) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
