require 'test_helper'
require 'fixtures'

describe DataMatrix::HTMLRender do
  let(:attributes) { { name: 'Anton', email: 'test@site.com' } }
  let(:title) { [:attribute, :value] }

  describe '#attributes' do
    it 'returns attributes' do
      html_render = DataMatrix::HTMLRender.new(attributes, title)
      html_render.attributes.must_equal attributes
    end
  end

  describe '#title' do
    it 'returns attributes' do
      html_render = DataMatrix::HTMLRender.new(attributes, title)
      html_render.title.must_equal title
    end
  end

  describe '#call' do
    it 'returns string with html' do
      html = DataMatrix::HTMLRender.new(attributes, title).call
      html.class.must_equal String
    end
  end
end
