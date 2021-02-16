class Api::V1::CommentsController < Api::V1::ApiController
  before_action :set_comment, only: [ :update, :destroy]


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else 
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update
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
    end 
end
