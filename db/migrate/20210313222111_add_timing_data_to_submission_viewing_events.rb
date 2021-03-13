class AddTimingDataToSubmissionViewingEvents < ActiveRecord::Migration
  def change
    add_column :submission_viewing_events, :timing_data, :string
  end
end
