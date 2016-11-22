class Entry < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :body, presence: true
  validates :title, presence: true

  	
  def feed
    	Comment.where("entry_id = ?", id)
  end
end
