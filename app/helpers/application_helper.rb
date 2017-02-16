module ApplicationHelper
  def yatidak(status)
    return "<span class='label label-success'>Ya</span>".html_safe if status == true
    return "<span class='label label-danger'>Tidak</span>".html_safe if status != true
  end

  def cekproses(status)
    return "<span class='label label-warning'>Proses</span>".html_safe if status == nil
    return "<span class='label label-success'>Diterima</span>".html_safe if status == true
    return "<span class='label label-danger'>Ditolak</span>".html_safe if status == false
  end

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

  def link_to_add_fields(name, f, association)  
   new_object = f.object.send(association).klass.new  
   id = new_object.object_id  
   fields = f.fields_for(association, new_object, child_index: id) do |builder|  
    render(association.to_s.singularize + "_fields", f: builder)  
   end  
   link_to(name, '#', class: "btn btn-sm btn-primary add_fields", data: {id: id, fields: fields.gsub("\n", "")})  
  end 
end
