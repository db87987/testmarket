module ApplicationHelper
  
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''
    link_to link_text, link_path, :class => class_name
  end
  
  def span_link(link_text, link_path)
    if current_page?(link_path)
      content_tag(:span, link_text)
    else
      link_to link_text, link_path
    end
  end
end
