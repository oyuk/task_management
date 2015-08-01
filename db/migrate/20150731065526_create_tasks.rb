class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.string :title, null: false # タイトル
      t.string :description # 内容
      t.boolean :checked, null: false, default: false # 完了フラグ

      t.timestamps null: false
    end
  end
end
