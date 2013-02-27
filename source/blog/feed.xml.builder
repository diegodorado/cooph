xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Cooperativa Hormigon"
  xml.subtitle "DISEÑO + PROGRAMACIÓN + SITIOS WEB"
  xml.id "http://cooperativahormigon.com.ar/blog/"
  xml.link "href" => "http://cooperativahormigon.com.ar/blog/"
  xml.link "href" => "http://cooperativahormigon.com.ar/blog/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author do 
    xml.name "Diego Dorado"
    xml.email "diego@cooperativahormigon.com.ar"
  end

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author do 
        xml.name "Diego Dorado"
        xml.email "diego@cooperativahormigon.com.ar"
      end
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
