###
# Blog settings
###

# Time.zone = "UTC"

#Markdown
#set :markdown_engine, :redcarpet

activate :livereload

activate :directory_indexes

activate :asset_hash , :exts =>  %w(.js .css)



activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = ":year/:month/:day/:title"
  #blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "layouts/blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "blog/tag.html"
  blog.calendar_template = "blog/calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

page "blog/feed.xml", :layout => false

#page "*", :layout => 'layouts/layout'

### 
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

data.sites.each do |k,v|
  proxy "/portfolio/#{k}.html", "/portfolio.html", :locals => { :site => v }, :ignore => true
end
        


###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do


  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendors/*'

  activate :favicon_maker


  # For example, change the Compass output style for deployment
  #activate :minify_css
  
  # Minify Javascript on build
  #activate :minify_javascript

  activate :gzip  , :exts =>  %w(.js .css)

  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
