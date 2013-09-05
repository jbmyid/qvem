Rails.application.config.to_prepare do
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    att_name = instance.method_name.capitalize.gsub(/_/," ")
    msges = instance.error_message.uniq.map do |e|
      "#{att_name}  #{e}"
    end.join(". ")
    "<span class=\"field_with_error\" data-error=\"#{msges}\" >#{html_tag}</span>".html_safe
  end
end

