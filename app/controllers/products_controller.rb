class ProductsController < ApplicationController
    def index
        unless session[:user_id]
            return redirect_to "/"
        end
        @products = Product.where(buyer_id: nil)
    end

    def new
        @selling = current_user.products.where(buyer_id: nil)
        @sellingsum = @selling.sum(:price)
        @sold = current_user.products.where.not(buyer_id: nil)
        @soldsum = @sold.sum(:price)
        puts "============#{@soldsum}============"
        @bought = Product.where(buyer_id: current_user.id)
        @boughtsum = @bought.sum(:price)
    end

    def create
        product = Product.create(product_params)
        puts product
        return redirect_to "/products/new"
    end

    def update
        product = Product.find(params[:id])
        product.update(buyer_id: current_user.id, seller_id: product.user_id)
        return redirect_to "/products/new"
    end

    def destroy
        product = Product.find(params[:id])
        product.destroy
        return redirect_to "/products/new"
    end

    private
        def product_params
            params.require(:product).permit(:name, :price).merge(user_id: current_user.id)
        end
end
