require 'multi_mime/adapter'

module MultiMime
  module Adapters
    # Use the Rack::Mime library
    class RackMime < Adapter
      def type_for(mime_type, opts = {})
        type = ::Rack::Mime::MIME_TYPES.key(mime_type) # Rack::Mime actually doesnt allow you to simply verify that a mime type exists
        type ? mime_type : MultiMime::NullType.new
      end

      def type_for_extension(extension, opts = {})
        extension.insert(0, '.') unless extension[0] == '.' # requires the extension with a dot
        ::Rack::Mime.mime_type(extension, MultiMime::NullType.new) # set the fallback to nil
      end

      def type_for_path(path, opts = {})
        type_for_extension(File.extname(path))
      end

      def type_for_file(file, opts = {})
        type_for_extension(File.extname(file))
      end
    end
  end
end
