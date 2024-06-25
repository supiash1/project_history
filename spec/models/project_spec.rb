require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should belong_to(:status) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:comments).allow_destroy(true) }
  end
end
