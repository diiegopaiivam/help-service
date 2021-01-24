class Api::V1::RatingsController < Api::V1::ApiController
    
    def show
        @rating = Rating.calculate_avg_employee(params[:employee_id])
        render json: @rating
    end
    
    def create
        @rating = Rating.new(rating_params)
        if @rating.save
            render json: @rating
        else 
            render json: @rating.errors, status: :unprocessable_entity
        end
    end

    private 
        def rating_params
            params.require(:rating).permit(:classification, :employee_id)
        end

end
