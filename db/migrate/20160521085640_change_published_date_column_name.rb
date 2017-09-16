class ChangePublishedDateColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :publish_date, :published_at
  end
end
