class AddPublishDateToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :publish_date, :datetime
  end
end
