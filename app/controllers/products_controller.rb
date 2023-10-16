class ProductsController < ApplicationController
  def index
    @products = Product.all

    respond_to do |format|
      format.html
   #  format.json { render json: @products }
   format.json do

     render json: @products.to_json(only: [:id, :name, :description])
   end
    end

  end
end

