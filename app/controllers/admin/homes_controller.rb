class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all

    @post_teas = PostTea.all
    @today_post_tea =  @post_teas.created_today
    @yesterday_post_tea = @post_teas.created_yesterday
    @this_week_post_tea = @post_teas.created_this_week
    @last_week_post_tea = @post_teas.created_last_week
    @comments = Comment.all

  end
end
