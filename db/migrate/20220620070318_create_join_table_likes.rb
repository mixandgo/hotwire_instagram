class CreateJoinTableLikes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :users, table_name: "likes" do |t|
      t.index %i[post_id user_id]
      t.index %i[user_id post_id]
    end
  end
end
