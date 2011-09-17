# CustomFieldError
class << ActiveRecord::Base
  def custom_field_error(html)
    ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
      "<span class=\"field_with_errors\">#{html_tag}</span>".html_safe
    end


  end
end