class Hashtag < ApplicationRecord
  REGEXP = /#[[:word:]-]+/

  scope :with_questions, -> { where_exists(:question_hashtags) }

  has_many :question_hashtags, dependent: :destroy
  has_many :questions, through: :question_hashtags

  validates :name, presence: true
end
