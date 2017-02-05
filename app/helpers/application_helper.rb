module ApplicationHelper

  def active_class(link)
    current_page?(link) ? 'active': ""
  end

  def sidemenu(link, text,icon)
    output = "<li class=\""+active_class(link)+"\">"
    output += "<a href=\""+link+"\">"
    output += "<i class=\""+icon+"\"></i>"
    output +="<p>"+text+"</p></a></li>"
    output.html_safe
  end

end
