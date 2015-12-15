require 'cucumber/formatter/html'

module Formatter 
  class HtmlFormatter < Cucumber::Formatter::Html
    def embed(src, mime_type, label)
      case(mime_type)
        when /^image\/(png|gif|jpg|jpeg)/
          super(src, mime_type, label)  
        when /^text\/html/
          embed_link(src, label)
      end
    end
  
    def embed_link(src, label)
      @builder.span(:class => 'embed') do |pre| 
        pre << %{<a href="#{src}" target="_blank">"#{label}"</a> } 
      end
    end 
  end
end
