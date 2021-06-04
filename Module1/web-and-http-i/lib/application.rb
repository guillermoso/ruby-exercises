class Application
  def call(_env)
    [200, headers, body]
  end

  private

  def headers
    {
      "Content-type" => "text/html"
    }
  end

  def body
    [
      img_element
    ]
  end

  def img_element
    "<blockquote class='imgur-embed-pub' lang='en' data-id='qe250DU'><a href='//imgur.com/qe250DU'>Kitty spa after a long day sleeping</a></blockquote><script async src='//s.imgur.com/min/embed.js' charset='utf-8'></script>"
  end
end
