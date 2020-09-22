class BloggersController < ApplicationController
    before_action :find_bloggers, only: [:show, :edit]

    def index
        @bloggers = Bloggers.all
    end

    def show
    end

    def edit
    end

    def new
        @blogger = Blogger.new
    end

    def create
        blogger = Blogger.create(blogger_params)
        if blogger.valid?
            redirect_to blogger_path(blogger)
        else
            flash[:my_errors] = blogger.errors.full_messages
        redirect_to new_blogger_path
        end
    end

    def update
        @blogger.update
        redirect_to blogger_path(@blogger)
    end


private

    def find_bloggers
        @blogger = Blogger.find(params[:id])
    end

    def post_params
        params.require(:blogger).permit!
    end
    
    
end
