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
end
