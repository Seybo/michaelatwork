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
      link_attributes: { rel: 'nofollow', target: "_blank" },
  		space_after_headers: true, 
  		fenced_code_blocks: true
    }
    renderer = HTML.new(render_options)

    extensions = {
      autolink:           true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true,
     	disable_indented_code_blocks: true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

end