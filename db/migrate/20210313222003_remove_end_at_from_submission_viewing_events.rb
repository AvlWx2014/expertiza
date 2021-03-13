class RemoveEndAtFromSubmissionViewingEvents < ActiveRecord::Migration
  def change
    remove_column :submission_viewing_events, :end_at, :datetime
  end
end
