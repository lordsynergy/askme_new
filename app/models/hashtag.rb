class Hashtag < ApplicationRecord
  has_many :question_hashtags, dependent: :destroy
  has_many :questions, through: :question_hashtags, source: :question

  validates :name, presence: true, uniqueness: true
  validates :name, format: { with: /#[[:word:]-]+/ }
end
