class AddIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :published_at
  end
end