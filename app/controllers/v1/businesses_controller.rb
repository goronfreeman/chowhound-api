module V1
  class BusinessesController < ApplicationController
    before_action :set_business, only: [:show, :update, :destroy]

    def index
      @businesses = Business.all.paginate(page: params[:page], per_page: 20)
      json_response(@businesses)
    end

    def create
      @business = Business.create!(business_params)
      json_response(@business, :created)
    end

    def show
      json_response(@business)
    end

    def update
      @business.update(business_params)
      head :no_content
    end

    def destroy
      @business.destroy
      head :no_content
    end

    private

    def business_params
      params.permit(:name, :email, :phone, :website)
    end

    def set_business
      @business = Business.find(params[:id])
    end
  end
end
