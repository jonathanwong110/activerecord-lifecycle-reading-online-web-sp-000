class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params)
	  if @post.valid?
	    @post.save
	    redirect_to post_path(@post)
	   else
	     render :new
	   end
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params)
	  if @post.valid?
	    @post.save
	    redirect_to post_path(@post)
	  else
	    render :edit
	  end
	end

	def edit
	  @post = Post.find(params[:id])
	end
	
	private
	  def post_params
	    params.require(:post).permit(:title, :description)
	  end
	
end