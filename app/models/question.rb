class Question < ApplicationRecord
  belongs_to :category
  has_many :answers ,dependent: :destroy

  accepts_nested_attributes_for :answers,
                                reject_if: proc { |attributes| attributes['content'].blank? },
                                allow_destroy: true

  validates :answers, presence:true
  validates :content, presence:true
end
