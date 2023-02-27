class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.order(created_at: :desc)
  end

  def new
    @project = current_user.projects.new
  end

  def show; end

  def edit; end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      flash[:notice] = 'Project Created'
      redirect_to @project
    else
      flash[:alert] = 'Could not create project'
      render 'new'
    end
  end

  def update
    @project.attributes = project_params
    @project.paper_trail_event = "#{current_user.email} updated #{project_params.keys.join(', ')}"
    if @project.save
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

    if @project.nil?
      flash[:alert] = 'Project not found'
      redirect_to root
    end
  end

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end
end
