  class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  enum role = { user: 'user'}
  def is?(requested_role)
    role == requested_role.to_s
  end
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end