class RenameCategoryToCategoryId < ActiveRecord::Migration[6.0]
  def change
    change_table :products do |t|
      t.rename :categgory, :categgory_id
    end
  end
end
