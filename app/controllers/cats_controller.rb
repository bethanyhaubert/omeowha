class CatsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def view
    @cat = Cat.find(params['cat_id'])
    render "view"
  end

  def new
    render "new"
  end

  def save
    @new_cat = Cat.create({name: params['name'], photo: params['photo'], likes: 0})
    redirect_to "/cats/#{@new_cat.id}/view"
  end

  def like
    @cat = Cat.find(params['cat_id'])
    @new_likes =  @cat.likes + 1
    @cat.update_attributes(:likes => @new_likes)
    redirect "cats/#{@cat.id}/view"
  end

  def edit
    @cat = Cat.find(params['cat_id'])
    render "edit"
  end

  def update
    @cat = Cat.find(params['cat_id'])
    @cat.update_attributes({name: params['name'], photo: params['photo']})
    redirect "/cats/#{@cat.id}/view"
  end

  def favorite
    @cat = Cat.find(params['cat_id'])
    render "favorite"
  end

  def add_favorite
    @cat = Cat.find(params['cat_id'])
    @new_thing = @cat.favorites.create({thing: params['thing']})
    redirect "/cats/#{@cat.id}/view"
  end

end