require 'test_helper'
require 'fixtures'

describe DataMatrix::Base do
  let(:user) { User.new }
  let(:user_matrix) { UserMatrix.new(user) }

  describe '::column' do
    it 'creates array of using attributes' do
      UserMatrix.attributes.must_equal({ name: nil, email: nil, last_name: nil })
    end

    describe 'with title option' do
      it 'creates array of using attributes' do
        UserTitledMatrix.attributes.must_equal({ name: 'First name', email: nil, last_name: nil })
      end
    end
  end

  describe '#compile' do
    it 'generates array of attributes' do
      user_matrix.compile
      user_matrix.data.must_equal [{ column: :name, value: 'Anton', title: nil },
                                   { column: :email, value: 'test@site.com', title: nil },
                                   { column: :last_name, value: '', title: nil }]
    end

    describe 'with title option' do
      let(:user_matrix) { UserTitledMatrix.new(user) }

      it 'generates array of attributes' do
        user_matrix.compile
        user_matrix.data.must_equal [{ column: :name, value: 'Anton', title: 'First name' },
                                     { column: :email, value: 'test@site.com', title: nil },
                                     { column: :last_name, value: '', title: nil }]
      end
    end
  end
end
