class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|


      t.string :course_number
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :is_active
      t.text :notifications
      t.text :deadlines

      t.timestamps

    end
   add_index :courses, :course_number, :unique => true
  end
end
