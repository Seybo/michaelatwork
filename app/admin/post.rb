ActiveAdmin.register Post do

permit_params :title, :body, :image

form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Post Details" do
    f.input :title
    f.input :body
    f.input :image, :as => :file, :hint => f.object.image.present? ? f.template.image_tag(f.object.image.url(:thumb)) : content_tag(:span, "no image yet")
  end
  f.actions
end

show do |ad|
  attributes_table do
    row :title
    row :body
    row :image do
      image_tag(ad.image.url(:thumb))
    end
  end
end

end
