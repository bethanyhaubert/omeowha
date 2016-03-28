class CatsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :view]
  #add before action for if current_user.id == @cat.user_id?

  def index
    @all_cats = Cat.all
    render "pages/index"
  end
  
  def view
    @cat = Cat.find(params['cat_id'])
    render "view"
  end

  def new
    render "new"
  end

  def save
    current_user
    @new_cat = Cat.create({name: params['name'], photo: params['photo'], user_id: params['current_user.id'], likes: 0})
    redirect_to "/cats/#{@new_cat.id}/view"
  end

  def like
    @cat = Cat.find(params['cat_id'])
    if current_user.id == @cat.user_id
    @new_likes =  @cat.likes + 1
    @cat.update_attributes(:likes => @new_likes)
    redirect "cats/#{@cat.id}/view"
    end
  end

  def edit
    @cat = Cat.find(params['cat_id'])
    if current_user.id == @cat.user_id
    render "edit"
    end
  end

  def update
    @cat = Cat.find(params['cat_id'])
    if current_user.id == @cat.user_id
    @cat.update_attributes({name: params['name'], photo: params['photo']})
    redirect "/cats/#{@cat.id}/view"
    end
  end

  def favorite
    @cat = Cat.find(params['cat_id'])
    if current_user.id == @cat.user_id
    render "favorite"
    end
  end

  def add_favorite
    @cat = Cat.find(params['cat_id'])
    if current_user.id == @cat.user_id
    @new_thing = @cat.favorites.create({thing: params['thing']})
    redirect "/cats/#{@cat.id}/view"
    end
  end

end