class Public::CustomersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
    @post_teas = @customer.post_teas
  end

  def likes
    @customer = Customer.find(params[:id])
    likes = Favorite.where(customer_id: @customer.id).pluck(:post_tea_id)
    @like_posts  = PostTea.find(likes)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
     redirect_to customer_path(@customer.id)
  end

  def confirm
    @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理を実行しました。またのご利用を心よりお待ちしております。"
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to post_teas_path
    end
  end

  def ensure_guest_user
    @customer = Customer.find(params[:id])
    if @customer.email == "guest@example.com"
      redirect_to customer_path(current_customer) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end
