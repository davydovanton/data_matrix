require 'erb'

module DataMatrix
  class HTMLRender
    TEMPLATE_PATH = './templates/table.erb'

    attr_reader :attributes, :title

    def initialize(attributes, title = [])
      @attributes = attributes
      @title = title
    end

    def call
      result = ERB.new(File.read(TEMPLATE_PATH)).result binding
      p result
      result
    end
  end
end
