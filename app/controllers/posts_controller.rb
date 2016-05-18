class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit, :destroy, :update]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.order(created_at: :desc)	
	end

	def new 
		@post = Post.new
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
		params.require(:post).permit(:title, :body)	
	end

	def find_post
		@post = Post.find(params[:id])
	end

end
