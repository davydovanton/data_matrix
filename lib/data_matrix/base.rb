module DataMatrix
  class Base
    class << self
      attr_reader :attributes

      def column(attribute)
        @attributes ||= []
        @attributes << attribute
      end
    end

    attr_reader :object, :data

    def initialize(object)
      @data = []
      @object = object
    end

    def compile
      self.class.attributes.each do |attr|
        data << [attr, object.send(attr)]
      end
    end
  end
end
