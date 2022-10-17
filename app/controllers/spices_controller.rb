class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        spices = Spice.all
        render json: spices
    end

    # def show
    #     spice = Spice.find_by(id: params[:id])
    #     render json: spice
    # end

    def create
        spice = Spice.create(permited_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(permited_params)
        render json: spice
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        render json: {}
    end

    private

    def permited_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    # def find_by_spice_id
    #     spice = Spice.find_by(id: params[:id])
    # end

    def render_not_found_response
        render json: { error: "Spice not found" }, status: :not_found
      end
end
