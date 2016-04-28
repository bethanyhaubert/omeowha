class CatsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :view]
  # protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token  

  def current_cat
    @cat = Cat.find(params['cat_id'])
  end

  def owner?
     if current_user.id == @cat.user_id
      return true
    end
  end

  def index
    @all_cats = Cat.all
    render "pages/index"
  end
  
  def view
    current_cat
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
    current_cat
    @new_likes =  @cat.likes + 1
    @cat.update_attributes(:likes => @new_likes)
    redirect_to "cats/#{@cat.id}/view"
  end

  def edit
    current_cat
    if owner? == true
    render "edit"
    end
  end

  def update
    current_cat
    if owner? == true
    @cat.update_attributes({name: params['name'], photo: params['photo']})
    redirect_to "/cats/#{@cat.id}/view"
    end
  end

  def favorite
    current_cat
    if owner? == true
    render "favorite"
    end
  end

  def add_favorite
    current_cat
    if owner? == true
    @new_thing = @cat.favorites.create({thing: params['thing']})
    redirect_to "/cats/#{@cat.id}/view"
    end
  end

  def delete
    current_cat
    if owner? == true
    Cat.destroy(@cat)
    redirect_to "/pages/index"
   end
  end

end