class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @post_teas = @customer.post_teas
  end

  def likes
    @customer = Customer.find(params[:id])
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
end
