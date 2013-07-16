  class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :feeds, inverse_of: :user, dependent: :destroy
  has_one :dashboard, dependent: :destroy

  before_save :create_remember_token
  before_save { |user| user.email = email.downcase }

  validates :password, presence: { :on => :create }, length: { minimum: 6, :on => :create }
  validates :password_confirmation, presence: { :on => :create }

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  			uniqueness: { case_sensitive: false }

  # TODO: Only need to do once
  def twitter
    @twitter ||= Twitter::Client.new(
      consumer_key: ENV['TWITTER_CONSUMER_KEY'],
      consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
      oauth_token: twitter_oauth_token, 
      oauth_token_secret: twitter_oauth_secret)
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
