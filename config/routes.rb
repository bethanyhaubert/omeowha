Rails.application.routes.draw do

  devise_for :users
  root to: "cats#index"

  get "cats/:cat_id/view" => 'cats#view'

  get "cats/new" => 'cats#new'

  post "cats/save" => 'cats#save'

  get "cats/:cat_id/like" => 'cats#like'

  get "cats/:cat_id/edit" => 'cats#edit'

  post "cats/:cat_id/update" => 'cats#update'

  get "cats/:cat_id/favorite" => 'cats#favorite'

  post "cats/:cat_id/add_favorite" => 'cats#add_favorite'

  post "cats/:cat_id/delete" => 'cats#delete'
end
