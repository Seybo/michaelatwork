class ChangePublishedDateColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :publish_date, :published_at
  end
end
