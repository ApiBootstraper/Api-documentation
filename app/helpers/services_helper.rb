module ServicesHelper

  def http_method_color http_method
    http_method = http_method.downcase
    {
        "post"       => "success",
        "put"        => "warning",
        "delete"     => "error",
        "get"        => "info",
    }[http_method]
  end

  def http_method_btn_color http_method
    http_method = http_method.downcase
    {
        "post"       => "success",
        "put"        => "warning",
        "delete"     => "danger",
        "get"        => "info",
    }[http_method]
  end

  def nl2br string
    string.gsub(/(<.*?>)/, '').gsub(/\n/, '<br />').html_safe
  end

end
