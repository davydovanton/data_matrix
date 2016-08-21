require 'test_helper'
require 'fixtures'

describe DataMatrix::Base do
  let(:user) { User.new }
  let(:user_matrix) { UserMatrix.new(user) }

  describe '::column' do
    it 'creates array of using attributes' do
      UserMatrix.attributes.must_equal %i[name email]
    end
  end

  describe '#compile' do
    it 'generates array of attributes' do
      user_matrix.compile
      user_matrix.data.must_equal [[:name, 'Anton'], [:email, 'test@site.com']]
    end
  end
end
