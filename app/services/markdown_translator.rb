require 'kramdown'

module MarkdownTranslator
  def self.convert(markdown_text)
    html_output = Kramdown::Document.new(markdown_text).to_html
    return html_output
  end
end