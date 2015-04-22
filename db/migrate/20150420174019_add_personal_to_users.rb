class AddPersonalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :personal_page, :string
  end
end
