module ApplicationHelper
  def flash_class(type)
    case type.to_sym
      when :success
        "border-green-500"
      when :notice
        "border-blue-500"
      when :alert, :error
        "border-red-500"
    end
  end
end
