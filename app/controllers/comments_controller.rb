class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @cosmetic = Cosmetic.find_by id: params[:cosmetic_id]
    @comment = @cosmetic.comments.build comment_params
    @comment.user_id = current_user.id
    if @comment.save
      render json: {
        status: :success,
        content: render_to_string(partial: "comments/comment", locals:{comment: @comment})
      }
    end
  end

  def destroy
    @cosmetic = Cosmetic.find_by id: params[:cosmetic_id]
    @comment = Comment.find_by id: params[:id]

    unless @comment.destroy
      flash[:danger] = t ".deleted_fail"
    end
    respond_to do |format|
      format.html { redirect_to @cosmetic }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :cosmetic_id, :user_id)
  end
end
