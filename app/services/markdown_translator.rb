require 'kramdown'

module MarkdownTranslator
  def self.convert(markdown_text)
    markdown_text.force_encoding('UTF-8')

    html_output = Kramdown::Document.new(markdown_text).to_html

    # Ensure the output has UTF-8 encoding
    html_output.force_encoding('UTF-8')

    html_output
  end
end