class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :verfiy_signed_in

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
    @project.paper_trail_event = "#{current_user.email} created project"

    if @project.save
      flash[:success] = 'Project Created'
      redirect_to @project
    else
      flash[:alert] = 'Could not create project'
      redirect_to new_project_path
    end
  end

  def update
    @project.attributes = project_params
    @project.paper_trail_event = "#{current_user.email} updated #{project_params.keys.join(', ')}"

    if @project.save
      flash[:success] = 'Updated'
      redirect_to @project
    else
      flash[:alert] = 'Could not update.'
      redirect_to edit_project_path(@project)
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = 'Successfully Deleted.'
      redirect_to posts_path
    else
      flash[:alert] = 'Not Deleted.'
      render 'show'
    end
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])

    if @project.nil?
      flash[:alert] = 'Project not found'
      redirect_to root
    end
  end

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end
end
