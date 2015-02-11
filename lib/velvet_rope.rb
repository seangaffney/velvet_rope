require "redcarpet"
require "pygments.rb"
require "gemoji"

module Redcarpet
  module Render
    class VelvetRope < HTML

      def initialize(extensions={})
        @extensions ||= {}
        @extensions[:highlight_syntax] = extensions.delete(:highlight_syntax) || false
        @extensions[:emoji] = extensions.delete(:emoji) || false

        # This is ugly, but is a workaround for Redcarpet not handling `super`
        # as it is a wrapper for the implementation written in C
        if @extensions[:highlight_syntax]
          self.class.send(:define_method, :block_code) do |code, language|
            if Pygments::Lexer.find_by_alias(language)
              Pygments.highlight(code, :lexer => language)
            else
              Pygments.highlight(code)
            end
          end
        end

        # `super` however DOES work in this intializer...
        super(extensions)
      end

      def postprocess(document)
        if @extensions[:emoji]
          document.gsub!(/:([a-z0-9\+\-_]+):/) do |match|
            if emoji = Emoji.find_by_alias($1)
              emoji_template(emoji)
            else
              match
            end
          end
        end
        document
      end

      def emoji_template(emoji)
        %(<img alt="#{emoji.name}" src="images/emoji/#{emoji.image_filename}" style="vertical-align:middle" width="20" height="20" />)
      end

    end
  end
end
