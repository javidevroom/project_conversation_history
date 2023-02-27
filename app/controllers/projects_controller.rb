class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy approve]

  def index
    @projects = Project.order(created_at: :desc)
  end

  def new
    @post = current_user.projects.new
  end

  def show; end

  def edit; end

  def create
    @project = current_user.projects.new(project_params)
    authorize @project
    if @project.save
      flash[:notice] = 'Project Created'
      redirect_to @project
    else
      flash[:alert] = 'Could not create project'
      render 'new'
    end
  end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project Updated'
      redirect_to @project
    else
      flash[:alert] = 'Not Updated.'
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:alert] = 'Successfully Deleted.'
      redirect_to posts_path
    else
      flash[:alert] = 'Not Deleted.'
      render 'show'
    end
  end

  private

  def set_project
    @project = Project.includes(:comments).find_by(id: params[:id])

    flash[:alert] = 'Project not found' unless @project
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end