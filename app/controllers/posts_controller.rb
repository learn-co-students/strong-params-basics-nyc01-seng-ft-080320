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
	#   @post = Post.new(params["post"])
	#   @post.save
	#   redirect_to post_path(@post)
	#the above is with config.action_controller.permit_all_parameters = true (strong params) turned off. The below is with them turned on
	# 	@post = Post.new(params.require(:post).permit(:title, :description))
	# 	@post.save 
	# 	redirect_to post_path(@post)
	#strong params call is abstracted into a private method. code below is refracted to reflect this
		@post = Post.new(post_params(:title, :description))#calls the post_params private method
		@post.save
		redirect_to post_path(@post)
	
	end

	def update
	#   @post = Post.find(params[:id])
	#   @post.update(params["post"])
	#   redirect_to post_path(@post)
	#the above is with config.action_controller.permit_all_parameters = true (strong params) turned off. The below is with them turned on
	# 	@post = Post.find(params[:id])
	# 	@post.update(params.require(:post).permit(:title))#only the :title is in the .permit() method since this is the only field that we want to give access to be updated.
	# 	redirect_to post_path(@post)
	#strong params call is abstracted into a private method. code below is refracted to reflect this
		@post = Post.find(params[:id])
		@post.update(post_params(:title))#calls the post_params private method
		redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private
#
	def post_params(*args)
		params.require(:post).permit(*args)
	end
end
