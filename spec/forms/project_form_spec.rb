require 'rails_helper'

RSpec.describe ProjectForm, type: :model do
  describe 'initialization' do
    it 'initializes with a project and its statuses' do
      project = create(:project) # Assuming you have FactoryBot set up for your models
      form = ProjectForm.new(id: project.id)

      expect(form.project).to eq(project)
      expect(form.statuses).to match_array(Status.all)
    end
  end

  describe '#build_empty_comment' do
    it 'adds a new empty comment to the project' do
      project = create(:project)
      form = ProjectForm.new(id: project.id)

      expect { form.build_empty_comment }.to change { form.project.comments.length }.by(1)
      expect(form.project.comments.last).to be_new_record
    end
  end

  describe '#update' do
    let(:project) { create(:project) }
    let(:form) { ProjectForm.new(id: project.id) }

    context 'with valid attributes' do
      it 'updates the project attributes' do
        new_status = create(:status)
        form.update(status_id: new_status.id)

        expect(project.reload.status_id).to eq(new_status.id)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the project' do
        expect(form.update(name: nil)).to be_falsey
        expect(project.reload.name).not_to be_nil
      end
    end
  end
end
