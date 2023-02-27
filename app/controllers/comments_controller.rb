class CommentsController < ApplicationController
  before_action :set_project, only: [:create]
  before_action :set_comment, only: [:destroy]


  def create
    @comment = @project.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment created.'
    else
      flash[:alert] = 'Comment not created.'
    end
    redirect_to project_path(@project)
  end

  def destroy
    @comment.destroy!
    flash[:alert] = 'Comment Deleted.'
    redirect_to project_path(@project)
  end

  private

  def set_project
    @project = Project.find_by(id: params[:project_id])

    if @project.nil?
      flash[:alert] = 'Project not found'
      redirect_to root
    end
  end

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])

    if @comment.nil?
      flash[:alert] = 'Comment not found'
      redirect_to root
    end
  end
end
