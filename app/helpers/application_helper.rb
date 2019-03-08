module ApplicationHelper
  def public_page?(action_name)
    action_name == 'home'
  end

  def index?(action_name)
    action_name == 'index'
  end
end
