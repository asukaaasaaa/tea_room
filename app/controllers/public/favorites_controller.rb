class Public::FavoritesController < ApplicationController
  def create
    post_tea = PostTea.find(params[:post_tea_id])
    favorite = current_customer.favorites.new(post_tea_id: post_tea.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    post_tea = PostTea.find(params[:post_tea_id])
    favorite = current_customer.favorites.find_by(post_tea_id: post_tea.id)
    favorite.destroy
    redirect_to  request.referer
  end
end
