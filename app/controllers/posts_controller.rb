class PostsController < ApplicationController
	before_action :set_post, except: [:index, :new, :create]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def edit
	end

	def create
		@post = Post.new(allowed_params)

		if @post.save
			redirect_to posts_path
		else
			renderer 'new'
		end
	end

	def update
		if @post.update_attributes(allowed_params)
			redirect_to posts_path
		else
			renderer 'new'
		end
	end

	private
	def set_post
		@post = Post.find(params[:id])
	end

	def allowed_params
		params.require(:post).permit(:title)
	end

end
