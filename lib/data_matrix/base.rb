module DataMatrix
  class Base
    class << self
      attr_reader :attributes

      def column(attribute)
        @attributes ||= []
        @attributes << attribute.to_sym
      end
    end

    attr_reader :object, :data

    def initialize(object)
      @data = []
      @object = object
    end

    def compile
      self.class.attributes.each do |attr|
        data << [attr, call_attribute(attr)]
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
