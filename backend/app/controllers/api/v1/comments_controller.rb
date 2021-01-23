class Api::V1::CommentsController < Api::V1::ApiController
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private 
    def comment_params
      params.require(:comment).permit(:description, :employee_id)
    end

    def set_comment
      @comment = Comment.find_by([params.id])
    end 
end
