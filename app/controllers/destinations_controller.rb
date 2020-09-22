class DestinationsController < ApplicationController
    before_action :find_destinations, only: [:show, :edit]

    def index
        @destinations = Destination.all
    end

    def show
    end

    def edit
    end

    def new
        @destination = Destination.new
    end

    def create
        destination = Destination.create(destination_params)
        if destination.valid?
            redirect_to destination_path(destination)
        else
            flash[:my_errors] = destination.errors.full_messages
        redirect_to new_destination_path
        end
    end

    def update
        @destination.update
        redirect_to destination_path(@destination)
    end


private

    def find_destinations
        @destination = Destination.find(params[:id])
    end

    def post_params
        params.require(:destination).permit!
    end

end
