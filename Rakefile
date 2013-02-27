task :default => [:import_wiki]


def collect_between(first, last)
  first == last ? [first] : [first, *collect_between(first.next, last)]
end

task :test do

  

end

task :import_wiki do

  require 'nokogiri'
  require 'open-uri'

  url = "http://www.cooperativahormigon.com.ar/wiki/index.php?title=Especial:Todas"
  doc = Nokogiri::HTML(open(url))


  doc.css(".mw-allpages-table-chunk a").each do |link|
    title = link.text
    slug = title.downcase.strip.gsub(' ', '-').gsub('.', '-').gsub(/[^\w-]/, '')
    url = "http://www.cooperativahormigon.com.ar" +link['href']

    doc = Nokogiri::HTML(open(url))

    str = doc.at_css('#lastmod').text.match(/vez el(.*),/m)[1].strip
    
    map = {'ene' => 'jan', 'abr'=>'apr', 'dic'=>'dec'}
    map.each {|k,v| str.sub!(k,v)}
    date =  Date.parse str
    
    
    nodes = collect_between(doc.at_css('#jump-to-nav').next, doc.at_css('.printfooter').previous)

    html = nodes.map {|n| n.to_html}.join('')

    require 'tempfile'

    tmp = Tempfile.new('in')
    tmp2 = Tempfile.new('out')
    begin
      tmp.write(html)
      tmp.flush
      system "pandoc -f html -t markdown -s #{tmp.path}  -o #{tmp2.path}"
      tmp2.flush

      out =  "#{File.dirname(__FILE__)}/source/blog/#{date.to_s}-#{slug}.md"
      File.open(out, 'w') do |f|
        f << "---\n"
        f << "title: #{title}\n"
        f << "tags: wiki\n"
        f << "---\n"
        f << "\n"
        f << tmp2.read
      end
      
      puts "#{out} creado."
    ensure
      tmp.close
      tmp.unlink
      tmp2.close
      tmp2.unlink
    end

  end


end


