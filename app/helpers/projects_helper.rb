module ProjectsHelper
  def versions
    PaperTrail::Version.where(item_type: 'Project', item_id: @project.id).order(created_at: :desc)
  end

  def comments
    @project.comments.order(created_at: :desc)
  end
end
