Rails.application.routes.draw do

  scope "api" do
    scope "v1" do
      scope "cats" do
        get '/' => 'api#index'
        get '/:cat_id' => "api#get_one_cat"
      end
    end
  end

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

  get "cats/error" => 'cats#error'
end
