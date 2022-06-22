class Like < ApplicationRecord
  include ActionView::Helpers::TextHelper

  belongs_to :user
  belongs_to :post

  after_create_commit do
    broadcast_update_to "posts_list",
      target: "likes-post-count-#{post_id}",
      partial: "posts/likes_count",
      locals: { count: post.likes.count }
  end

  after_destroy_commit do
    broadcast_update_to "posts_list",
      target: "likes-post-count-#{post_id}",
      partial: "posts/likes_count",
      locals: { count: post.likes.count }
  end
end
