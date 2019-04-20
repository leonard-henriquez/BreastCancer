class AddIsMammogramToDetections < ActiveRecord::Migration[6.0]
  def change
    add_column :detections, :is_mammogram, :float
  end
end
