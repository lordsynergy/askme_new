class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags, source: :hashtag

  validates :body, presence: true, length: { maximum: 280 }

  before_save :find_and_create_hashtags
  after_commit :destroy_unused_tags

  private

  def find_and_create_hashtags
    body_hashtags = self.body.scan(/#[[:word:]-]+/)
    answer_hashtags = self.answer.to_s.scan(/#[[:word:]-]+/)
    question_hashtags = body_hashtags | answer_hashtags

    self.hashtags = question_hashtags.map do |tag|
      Hashtag.find_or_create_by(name: tag)
    end
  end

  def destroy_unused_tags
    Hashtag.left_outer_joins(:questions).where(questions: { id: nil }).destroy_all
  end
end
