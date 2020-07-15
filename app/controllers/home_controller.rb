class HomeController < ApplicationController
  def top
    @museums = Museum.order(id: "DESC").first(3)
    @posts = Post.order(id: "DESC").first(3)
  end
end
