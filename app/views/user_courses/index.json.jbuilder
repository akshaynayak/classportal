json.array!(@user_courses) do |user_course|
  json.extract! user_course, :id, :is_teaching, :is_enrolled, :has_requested_enrollment, :grade
  json.url user_course_url(user_course, format: :json)
end
