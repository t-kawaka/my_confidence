module ApplicationHelper
  def redirect_root
    redirect_to my_confidence_path unless user_signed_in?
  end
end
