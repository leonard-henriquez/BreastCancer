class CreateDetections < ActiveRecord::Migration[6.0]
  def change
    create_table :detections do |t|
      t.float "cancer"
      t.float "normal"
      t.timestamps
    end
  end
end
