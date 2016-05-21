ActiveAdmin.register Post do

permit_params :title, :body, :image

form do |f|
  f.inputs "Post Details" do
    f.input :title
    f.input :body
    f.input :image, :as => :file
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
    # Will display the image on show object page
  end
end

end
