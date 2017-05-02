class RemoveLastFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :last, :string
  end
end
