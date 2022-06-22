class CreateJoinTableLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.index %i[post_id user_id]
      t.index %i[user_id post_id]
    end
  end
end
