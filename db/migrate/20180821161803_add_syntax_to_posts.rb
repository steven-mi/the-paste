class AddSyntaxToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :syntax, :string
  end
end
