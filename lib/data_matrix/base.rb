module DataMatrix
  class Base
    class << self
      attr_reader :attributes

      def column(attribute, options = {})
        @attributes ||= {}
        @attributes[attribute.to_sym] = options[:title]
      end
    end

    attr_reader :object, :data

    def initialize(object)
      @data = []
      @object = object
    end

    def compile
      self.class.attributes.each do |attr, title|
        data << { column: attr, value: call_attribute(attr), title: title }
      end
    end

    def call_attribute(attr)
      if object.respond_to?(attr)
        object.send(attr)
      else
        ''
      end
    end
  end
end
