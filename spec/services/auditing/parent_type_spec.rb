require 'rails_helper'

RSpec.describe Auditing::ParentTypeName do
  let(:controller) { ProjectsController.new }
  let(:service) { described_class.new(controller) }

  describe '#call' do
    it 'returns the singularized, humanized, and titleized controller name' do
      expect(service.call).to eq('Project')
    end
  end
end
