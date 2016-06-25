require 'frest/directory_store/version'
require 'frest/directory_store/loaders'

module Frest
  module DirectoryStore
    def get(
        path:,
        id:,
        loaders: Frest::DirectoryStore::loaders,
        types: (loaders.flat_map { |l| l.types[:file_types] })
    )

      Dir.chdir(path) do
        result = Dir.glob("#{id}.{#{types * ','}}")&.first

        if result
          parts  = result.split('.')
          f      = File.read(result)
          loader = loaders.select { |l| l.types[:file_types].include?(parts.last) }&.first
          loader&.load(content: f, id: parts[0..-2] * '')
        else
          nil
        end
      end
    end

    module_function :get
  end
end
