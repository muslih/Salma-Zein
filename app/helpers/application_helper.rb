module ApplicationHelper
  def yatidak(status)
    return "<span class='label label-success'>Ya</span>".html_safe if status == true
    return "<span class='label label-danger'>Tidak</span>".html_safe if status != true
  end

  def cekproses(status)
    return "<span class='label label-warning'>PR Diproses</span>".html_safe if status != true && status != false
    return "<span class='label label-success'>PR Diterima</span>".html_safe if status == true
    return "<span class='label label-danger'>PR Ditolak</span>".html_safe if status == false
  end

  def cekpo(status)
    return "<span class='label label-warning'>PO Diproses</span>".html_safe if status == ''
    return "<span class='label label-success'>PO Sudah Dibayar</span>".html_safe if status != ''
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

  def ke_rp(nomor)
    @val = number_with_delimiter(nomor, delimiter: ".") 
    "Rp. #{@val}"
  end
  
end
