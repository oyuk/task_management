class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|

      t.string :title, null: false # タイトル

      t.timestamps null: false
    end
  end
end
