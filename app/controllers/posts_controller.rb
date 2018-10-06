class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		# raise params.inspect

	end

	def new
		@post = Post.new
	end

	def create
		# binding.pry
	  @post = Post.new
	  @post.title = params[:post][:title]
	  @post.description = params[:post][:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		binding.pry
	  @post = Post.find(params[:id])
	  # @post.update(title: params[:title], description: params[:description])
    # we are updating the above line to below to use form_for
    # @post.update(params.require(:post))
    @post.update(post_params)
	  redirect_to post_path(@post)
	end


	private
	def post_params
		params.require(:post).permit(:title, :description)
	end
end
