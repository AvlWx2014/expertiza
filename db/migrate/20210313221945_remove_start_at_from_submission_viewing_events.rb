class RemoveStartAtFromSubmissionViewingEvents < ActiveRecord::Migration
  def change
    remove_column :submission_viewing_events, :start_at, :datetime
  end
end
