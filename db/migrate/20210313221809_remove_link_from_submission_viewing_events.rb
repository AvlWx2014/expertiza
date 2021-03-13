class RemoveLinkFromSubmissionViewingEvents < ActiveRecord::Migration
  def change
    remove_column :submission_viewing_events, :link, :string
  end
end
