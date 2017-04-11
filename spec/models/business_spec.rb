require 'rails_helper'

RSpec.describe Business, type: :model do
  it { should have_many(:trucks).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:website) }
end
