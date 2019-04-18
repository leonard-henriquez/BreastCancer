class CreateDetections < ActiveRecord::Migration[6.0]
  def change
    create_table :detections do |t|
      t.boolean :cancer

      t.timestamps
    end
  end
end
