class User < ApplicationRecord
  has_many :questions, dependent: :destroy

  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w\-.]+@[\w\-]+\.[a-z]+\z/i }
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 }, format: { with: /\A\w+\z/ }
  validates :navbar_color, format: { with: /\A#[a-f0-9]{6}\z/i }

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  def to_param
    nickname
  end

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
