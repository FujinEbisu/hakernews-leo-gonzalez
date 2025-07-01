class RemoveUserIdAddByToPosts < ActiveRecord::Migration[7.1]
  def change

    remove_reference :posts, :user, index: true
    add_column :posts, :by, :string

  end
end
