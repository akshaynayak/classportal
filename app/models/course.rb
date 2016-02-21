
class Course < ActiveRecord::Base

 validates :course_number, presence:  true, uniqueness: true
  validates :title, presence: true
 validates :description, presence: true
 validates :start_date, presence: true
 validates :end_date, presence: true

  has_many :user_courses
  has_many :users, through: :user_courses

 def self.search(search)
  if search
   self.where('course_number LIKE ? or title LIKE ? or description LIKE ?', "%#{search}%","%#{search}%","%#{search}%" )
  else
   self.all
  end
 end
end

