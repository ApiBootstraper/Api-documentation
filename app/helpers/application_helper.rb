module ApplicationHelper

  # Overide markdown
  def markdown string
    string = string.gsub(/%api_hostname%/i, api_hostname)
    super string
  end

end
