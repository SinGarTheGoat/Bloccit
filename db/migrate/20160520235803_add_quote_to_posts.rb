class AddQuoteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :quote, :string
  end
end
