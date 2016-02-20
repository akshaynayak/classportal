class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :status

      t.belongs_to :instructor
      t.timestamps
    end
    add_index :courses, :course_number, :unique => true
  end
end
