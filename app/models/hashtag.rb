class Hashtag < ApplicationRecord
  has_many :question_hashtags, dependent: :destroy
  has_many :questions, through: :question_hashtags, source: :question

  validates :name, presence: true
  validates :name, format: { with: /#[[:word:]-]+/ }

  def to_param
    name
  end
end
