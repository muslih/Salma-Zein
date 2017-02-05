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

  def pesan_error(objek)
    if objek.present? && objek.try(:errors).try(:any?) 
      data = ["<div class=\'alert alert-danger alert-dismissible\' role=\'alert\'><button type=\'button\' class=\'close\' data-dismiss=\'alert\' aria-label=\'Close\'><span aria-hidden=\'true\'>&times;</span></button><h4>Ups! Ada #{objek.errors.count} kesalahan yang membuat data anda tidak bisa didaftarkan</h4><ul> "]

      objek.errors.each do |attr,message| 
        data.push("<li>"+ message +"</li>")
      end
      data.push("</ul></div>")

      return data.join(" ").html_safe
    end
  end

end
