class Api::V1::ConnectionsController < ApplicationController
    def index
        @connections = Conection.count_connections(params[:employee_id])
        render json: @connections
    end

    def create
        @conection = Conection.new(connection_params)
        if @conection.save
            render json: @conection
        else 
            render json: @conection.errors, status: :unprocessable_entity
        end
    end

    private
        def connection_params
            params.require(:conection).permit(:employee_id)
        end
end
