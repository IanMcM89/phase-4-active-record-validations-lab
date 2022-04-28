class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validate :fiction_or_non_fiction, :true_facts_not_allowed

  def fiction_or_non_fiction
    array = ['Fiction', 'Non-Fiction']
    errors.add(:category, "is not included in the list") if !array.include?(category)
  end

  def true_facts_not_allowed
    errors.add(:title, "Title can't be True Facts") if title == "True Facts"
  end
end
