module V1
  class TrucksController < ApplicationController
    before_action :set_truck, only: [:show, :update, :destroy]

    def index
      @trucks = Truck.all
      json_response(@trucks)
    end

    def create
      @truck = Truck.create!(truck_params)
      json_response(@truck, :created)
    end

    def show
      json_response(@truck)
    end

    def update
      @truck.update(truck_params)
      head :no_content
    end

    def destroy
      @truck.destroy
      head :no_content
    end

    private

    def truck_params
      params.permit(:name, :description, :business_id)
    end

    def set_truck
      @truck = Truck.find(params[:id])
    end
  end
end
