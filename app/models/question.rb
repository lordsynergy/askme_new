class Question < ApplicationRecord
  REGEXP_TAGS = /#[[:word:]-]+/

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  validates :body, presence: true, length: { maximum: 280 }

  after_save_commit :find_and_create_hashtags

  private

  def find_and_create_hashtags
    "#{body} #{answer}".scan(REGEXP_TAGS).uniq.map do |tag|
      Hashtag.create_or_find_by(name: tag)
    end
  end

end
