ActiveAdmin.register Product do
  permit_params :name, :description, :price, :image, :category_id

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, as: :file
      f.input :category_id
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
