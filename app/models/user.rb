
class User < ActiveRecord::Base

  has_many :user_courses
  has_many :courses, through: :user_courses


  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, :presence => true

  #validates :is_admin
  #validates :is_instructor
  def self.search(search)
    if search
      self.where('name LIKE ?', "%#{search}%" )
    else
      self.all
    end
  end

end

