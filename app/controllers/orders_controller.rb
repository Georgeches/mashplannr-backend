class OrdersController < ApplicationController
    def index
        orders = Order.all
        render json: orders
    end
    
    def show
        order = Order.find_by(id: params[:id])
        if order
            render json: order
        else
            render json: { error: "order not found" }, status:404
        end
    end

    def create
        order =Order.create!(order_params)
        render json: order, status: :created
    end

    def update
        order = Order.find_by(id: params[:id])
        if order.update(order_params)
            render json: order
        else
            render json: order.errors, status: :unprocessable_entity
        end
    end

    def destroy
        order = Order.find_by(id: params[:id])
        order.destroy
        head :no_content
    end

    def filter
        duration = params[:duration]
    
        case duration
        when 'today'
          start_date = Date.today
          end_date = Date.today
        when 'this_week'
          start_date = Date.today.beginning_of_week
          end_date = Date.today.end_of_week
        when 'this_month'
          start_date = Date.today.beginning_of_month
          end_date = Date.today.end_of_month
        when 'this_year'
            start_date = Date.today.beginning_of_year
            end_date = Date.today.end_of_year
        else
            start_date = nil
            end_date = nil
        end
        
        filtered_orders = Order.where(date: start_date..end_date)

        render json: filtered_orders
    end

    private
    def order_params
        params.permit(:customer_name, :products_ordered, :date, :merchandiser_id, :location)
    end
end
