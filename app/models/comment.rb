class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  after_create_commit do
    broadcast_prepend_to "posts_list",
      target: "post-comments-#{post_id}",
      partial: "comments/comment",
      locals: { comment: self }
  end
end
