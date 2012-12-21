ActiveAdmin.register Video do
  form do |f|
    f.inputs "Details" do
      f.input :description
      f.input :thumbnail
      f.input :title
      f.input :youtube_id
    end
    f.buttons
  end
end
