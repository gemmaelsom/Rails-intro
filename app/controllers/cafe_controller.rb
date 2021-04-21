class CafeController < ApplicationController
    # IMPOTANT ! ! REMOVE FOR PRODUCTION!
    skip_before_action :verify_authenticity_token

    @@menu = {
        latte: 4.00,
        scone: 5.00,
        tea: 3.00
    }

    def index
        @menu = @@menu
        @currency_symbol = '$'
    end

    def about
        render json: @@menu
    end

    def create
        @@menu[params[:name].to_sym] = params [:price].to_f
        json: @@menu
    end

    def show
        @item = { name: [params[:item_name], price: @@menu[params[:item_name].to_sym]]}
    end
end