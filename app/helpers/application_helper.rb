module ApplicationHelper

require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class HTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def block_code(code, language)
    Rouge.highlight(code, language || 'text', 'html')
  end
end

  def markdown(text)
    render_options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" }
    }
    renderer = HTML.new(render_options)

    extensions = {
      fenced_code_blocks: true,
      space_after_headers: true,
      autolink:           true,
      no_intra_emphasis: true,
      highlight: true,
      strikethrough: true,
      quote: true,
      no_images: false,
      superscript: true,
      footnotes: true,
      tables: true,
      with_toc_data: true,
      lax_spacing: true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

end