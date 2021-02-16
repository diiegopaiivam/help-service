class Api::V1::CommentsController < Api::V1::ApiController
  before_action :set_comment, only: [ :update, :destroy]


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else 
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else 
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private 
    def comment_params
      params.require(:comment).permit(:description, :employee_id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }, status: :not_found
    end 
end
