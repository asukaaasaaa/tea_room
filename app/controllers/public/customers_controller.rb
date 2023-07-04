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

  def unsubscribe
  end
end
