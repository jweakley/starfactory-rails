module ApplicationHelper

  def body_classes
    classes = [
      under_camel(params[:controller]),
      under_camel(params[:action]),
      under_camel("#{params[:controller]}_#{params[:action]}")
    ]
    classes.push 'hasQueryString' unless request.query_string.blank?
    return classes
  end

  def under_camel(string)
    string.gsub(/[^a-z]/i,'_').camelize(:lower)
  end

  def text_to_html(text)
    return sanitize Kramdown::Document.new(text).to_html
  end

  def svg_image(src, options={})
    options[:onerror] = "this.src='#{image_url src+'.png'}';this.onerror=null;"
    image_tag "#{src}.svg", options
  end
end
