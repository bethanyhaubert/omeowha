class ApiController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    render json: Cat.select("id, name, photo")
  end
end
