class Public::PostTeasController < ApplicationController
  def new
    @post_tea = PostTea.new
  end

  def create
    @post_teas = PostTea.all
    @post_tea = PostTea.new(post_tea_params)
    @post_tea.customer_id = current_customer.id
    if @post_tea.save
      flash[:notice] = "You have created tea successfully."
      redirect_to post_tea_path(@post_tea.id)
    else
       render :new
    end
  end

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @post_teas = @genre.post_teas.page(params[:page]).per(10).order(created_at: :desc)
    else
      @post_teas = PostTea.where(customer_id: [current_customer.id, *current_customer.following_ids]).page(params[:page]).per(10).order(created_at: :desc)
    end
    @genres = Genre.all
  end

  def show
    @post_tea = PostTea.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post_tea = PostTea.find(params[:id])
    @post_tea.destroy
    redirect_to post_teas_path
  end

  def edit
    @post_tea = PostTea.find(params[:id])
  end

  def update
    @post_tea = PostTea.find(params[:id])
    if @post_tea.update(post_tea_params)
      redirect_to post_tea_path(@post_tea), notice: "You have updated tea successfully."
    else
      render :edit
    end
  end

  private

  def post_tea_params
    params.require(:post_tea).permit(:title, :body, :genre_id, :image)
  end
end
