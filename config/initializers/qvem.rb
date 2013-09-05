Rails.application.config.to_prepare do
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    att_name = instance.method_name.capitalize.gsub(/_/," ")
    msges = instance.error_message.uniq.map do |e|
      "#{att_name}  #{e}"
    end.join(". ")
    "<span class=\"field_with_error\" data-error=\"#{msges}\" >#{html_tag}</span>".html_safe
  end

  ActionView::Helpers::InstanceTag.class_eval do
	  def to_input_field_tag(field_type, options = {})
	    options = options.stringify_keys
	    options["size"] = options["maxlength"] || ActionView::Helpers::InstanceTag::DEFAULT_FIELD_OPTIONS["size"] unless options.key?("size")
	    options = ActionView::Helpers::InstanceTag::DEFAULT_FIELD_OPTIONS.merge(options)
	    if field_type == "hidden"
	      options.delete("size")
	    end
	    options["type"]  ||= field_type
	    options["value"] = options.fetch("value"){ value_before_type_cast(object) } unless field_type == "file"
	    options["value"] &&= ERB::Util.html_escape(options["value"])
	    add_default_name_and_id(options)
	    options.merge!({"data-fieldname"=> @method_name})
	    tag("input", options)
	  end

	  def to_text_area_tag(options = {})
	    options = ActionView::Helpers::InstanceTag::DEFAULT_TEXT_AREA_OPTIONS.merge(options.stringify_keys)
	    add_default_name_and_id(options)
	    if size = options.delete("size")
	      options["cols"], options["rows"] = size.split("x") if size.respond_to?(:split)
	    end
	    options.merge!({"data-fieldname"=> @method_name})
	    content_tag("textarea", options.delete('value') || value_before_type_cast(object), options)
	  end

	end
end

