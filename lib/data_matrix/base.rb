module DataMatrix
  class Base
    class << self
      attr_reader :attributes

      def column(attribute, options = {})
        @attributes ||= {}
        @attributes[attribute.to_sym] = options[:title]
      end
    end

    EMPTY_STRING = ''.freeze

    attr_reader :object, :data

    def initialize(object)
      @data = []
      @object = object
    end

    def compile
      @data = self.class.attributes.map do |attr, title|
        { column: attr, value: call_attribute(attr), title: title }
      end
    end

    def call_attribute(attr)
      if object.respond_to?(attr)
        object.send(attr)
      else
        EMPTY_STRING
      end
    end

    def to_html
      HTMLRender.new(data, [])
    end
  end
end
