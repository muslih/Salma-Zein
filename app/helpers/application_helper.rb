module ApplicationHelper

  def active_class(link)
    current_page?(link) ? 'active': ""
  end

  def sidemenu(link, text)
    output = "<li class=\""+active_class(link)+"\">"
    output += "<a href=\""+link+"\">"
    output += "<i class=\"pe-7s-graph\"></i>"
    output +="<p>"+text+"</p></a></li>"
    output.html_safe
  end
  def head_title
    @title || request.original_fullpath.humanize.titleize
  end

  def panel_heading(title)
    "<div class=\"panel-heading\">#{title}</div>".html_safe
  end

end
