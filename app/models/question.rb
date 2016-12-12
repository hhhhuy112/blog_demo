class Question < ApplicationRecord
  belongs_to :category
  has_many :answers ,dependent: :destroy

  accepts_nested_attributes_for :answers,
                                reject_if: proc { |attributes| attributes['content'].blank? },
                                allow_destroy: true

  validates :answers, presence:true
  validates :content, presence:true

  def self.filter(category_id,search)
    query="1"
    if category_id
      query += " AND category_id = " + category_id
    end

    if search
      query += " AND content LIKE '%#{search}%' "
    end
    where( query)
  end
end
