class RemovePasswordFromInstructors < ActiveRecord::Migration

  def change




    remove_column :instructors, :password, :string



  end

end
