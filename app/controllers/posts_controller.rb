class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, except: [:index, :show] unless Rails.env.development?

  def index
    @posts = Post.order(published_at: :desc)  
  end

  def new 
    @post = Post.new(published_at: DateTime.now.change(offset: "-3000"))
  end

  def create
    @post = Post.new post_params
    
    if @post.save
      redirect_to @post, notice: "Yeah, Michael! Done!"
    else
      render 'new', notice: "Emmmm... not really... can't do it..."
    end
  end

  def show
  end

  def edit
  end

  def update    
    if @post.update post_params
      redirect_to @post, notice: "Yay! Article::SAVED"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :published_at) 
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
