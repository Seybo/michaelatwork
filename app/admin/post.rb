ActiveAdmin.register Post do
  permit_params :title, :body, :image, :published_at, :category_id

  action_item :view, only: :show do
    link_to 'View on site', post_path(post) if post.published_at?
  end

  index do
    selectable_column
    id_column
    column :title
    column :category_id
    column :published_at
    column :created_at
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.object.published_at = DateTime.now.change(offset: "-3000") if f.object.published_at.blank?
    f.inputs "Post Details" do
      f.input :category_id, label: 'Category', as: :select, collection: Category.all.map{|c| ["#{c.name}", c.id]}
      f.input :title
      f.input :body
      f.input :published_at
      f.input :image, as: :file, hint: f.object.image.present? ? f.image_tag(f.object.image.url(:thumb)) : content_tag(:span, "no image yet")
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :category_id
      row :title
      row :body
      row :published_at
      row :image do
        image_tag(ad.image.url(:thumb))
      end
    end
  end
end
