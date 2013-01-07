module ApplicationHelper

  # Overide markdown
  def markdown string
    string = string.gsub(/%host%/i, "#{request.protocol}#{request.host_with_port}")
    super string
  end

end
