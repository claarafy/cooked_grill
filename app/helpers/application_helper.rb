module ApplicationHelper
  def resource_name
    :cook
  end

  def resource
    @resource ||= Cook.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:cook]
  end
end
