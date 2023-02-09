class Hashtag < ApplicationRecord
  REGEXP = /#[[:word:]-]+/

  has_many :question_hashtags, dependent: :destroy
  has_many :questions, through: :question_hashtags, source: :question

  validates :name, presence: true

  def to_param
    name
  end
end
