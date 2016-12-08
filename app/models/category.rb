class Category < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  def search(search)
  if search
      Question.joins("INNER JOIN categories ON categories.id = questions.category_id" ).where("questions.content LIKE ? AND category_id = ?", "%#{search}%", id)
  else
      Question.where("category_id = ?", id)
  end
end

end
