class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
        t.text :body
        t.references :conversations, index: true
        t.references :user, index: true
        t.boolean :read, :default => false
        t.boolean :notification, :default => false

      t.timestamps

    end

  end
end
