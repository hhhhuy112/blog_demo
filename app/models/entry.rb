class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user, presence: true
  validates :body, presence: true
  validates :title, presence: true

  	
  def feed
    	Comment.where("entry_id = ?", id)
  end
end
