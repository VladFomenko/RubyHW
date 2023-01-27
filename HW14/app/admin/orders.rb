ActiveAdmin.register Order do
  permit_params :cart_id, :user_id, :status
end
