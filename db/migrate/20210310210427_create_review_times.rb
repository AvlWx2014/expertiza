class CreateReviewTimes < ActiveRecord::Migration
  def change
    create_table :review_times do |t|
      t.integer :time_data

      t.timestamps null: false
    end
  end
end
