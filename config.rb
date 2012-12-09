require 'stylus'
require 'pygments'
require 'pry'

###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
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

#Shit to do to have pygments working
Pygments.rubypython_options = {:python_exe => 'python2.7'}

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def highlight_code(language=nil, options={}, &block)
    code = capture_haml &block
    if language.class == Hash then
      options = language
      language = nil
    end

    if language then
      Pygments.highlight(code, :lexer => language, :options => { :linenos => 'table', :encoding => 'utf-8' }.merge(options))
    else
      escape = if options[:escape] != nil then options[:escape] else true end
      if !options.include?(:linenos) || options[:linenos] then
        count = code.lines.count
        "<table class=\"highlighttable\">
          <tbody>
            <tr>
              <td class=\"linenos\">
                <div class=\"linenodiv\">
                  <pre>#{(1 .. count).to_a.map{ |n| "% #{Math.log10(count).ceil}d" % n}.join('<br />')}</pre>
                </div>
              </td>
              <td class=\"code\">
                <div class=\"highlight\">
                  <pre>#{escape ? ERB::Util.html_escape(code) : code}</pre>
                </div>
              </td>
            </tr>
          </tbody>
        </table>"
      else
        "<div class=\"highlight\">
          <pre>#{escape ? ERB::Util.html_escape(code) : code}</pre>
        </div>"
      end
    end
  end

  def inline_code(code)
    "<span class=\"inline-code highlight\">#{ERB::Util.html_escape(code)}</span>"
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

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