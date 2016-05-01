class ApiController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    render json: Cat.select("cats.id, cats.name, cats.photo").includes(:favorites).as_json(:include => {:favorites => {:only => [:thing]}})
  end

  def get_one_cat
    render json: Cat.select("cats.id, cats.name, cats.photo").includes(:favorites).find_by_id(params["cat_id"]).as_json(:include => {:favorites => {:only => [:thing]}})
  end

end
