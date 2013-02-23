require 'mimemagic' unless defined?(::Mimemagic)
require 'multi_mime/adapter'

module MultiMime
  module Adapters
    # Use the Mimemagic library to look_up_extension
    class Mimemagic < Adapter
      def foo
        "mimemagic"
      end
    end
  end
end