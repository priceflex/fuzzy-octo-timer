module ApplicationHelper
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error, :alert].each do |type|
      if flash[type]
        messages += content_tag :div, flash[type], :class => "#{type}", :id => "alert"
      end
    end 
    messages.html_safe
  end
  def clocked_in_class
    if current_user
      if current_user.clocked_in?
        "clocked_in"
      else
        "clocked_out"
      end
    end
  end
end
