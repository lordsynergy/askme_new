class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags, dependent: :destroy

  validates :body, presence: true, length: { maximum: 280 }

  before_save :downcase_hashtags_body_and_answer

  after_save_commit :find_and_create_hashtags

  private

  def downcase_hashtags_body_and_answer
    body.gsub!(/#[[:word:]-]+/) { |tag| tag&.downcase }
    answer&.gsub!(/#[[:word:]-]+/) { |tag| tag&.downcase }
  end

  def find_and_create_hashtags
    question_hashtags = "#{body} + #{answer}".scan(/#[[:word:]-]+/)

    self.hashtags = question_hashtags.uniq.map do |tag|
      Hashtag.find_or_create_by(name: tag.downcase)
    end
  end
end
