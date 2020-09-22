class PostsController < ApplicationController
    before_action :find_posts, only: [:show, :edit]

    def index
        @posts = Post.all
    end

    def show
    end

    def edit
    end

    def new
        @post = Post.new
        @post.save
    end

    def create
        post = Post.create(post_params)
        if post.valid?
            redirect_to post_path(post)
        else
            flash[:my_errors] = post.errors.full_messages
        redirect_to new_post_path
        end
    end

    def update
        @post.update
        redirect_to post_path(@post)
    end

    def increment_likes
        @post.likes += 1
        @post.update
    end

private

    def find_posts
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit!
    end


end
