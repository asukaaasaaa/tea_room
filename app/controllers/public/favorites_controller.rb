class Public::FavoritesController < ApplicationController
  def create
    post_tea = PostTea.find(params[:post_tea_id])
    @favorite = current_customer.favorites.new(post_tea_id: post_tea.id)
    @favorite.save
    render 'replace_btn'
  end

  def destroy
    post_tea = PostTea.find(params[:post_tea_id])
    @favorite = current_customer.favorites.find_by(post_tea_id: post_tea.id)
    @favorite.destroy
    render 'replace_btn'
  end
end
