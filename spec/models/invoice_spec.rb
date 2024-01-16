require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:status) }
  end

  describe 'associations' do
    it { should have_many(:cart_items) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values([:pending, :completed, :cancelled]) }
  end

end
