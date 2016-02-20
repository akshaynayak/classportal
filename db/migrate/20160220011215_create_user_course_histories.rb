class CreateUserCourseHistories < ActiveRecord::Migration
  def change
    create_table :user_course_histories do |t|


      t.boolean :is_teaching
      t.boolean :is_enrolled
      t.boolean :has_requested_enrollment
      t.string :grade
      t.references :user
      t.references :course

      t.timestamps

    end

  end
end
