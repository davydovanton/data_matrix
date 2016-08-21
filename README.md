# DataMatrix
**[this is not implemented gem]**
Simple way for creating grids for any data objects and for any frameworks

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'data_matrix'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install data_matrix

## Usage
Create a Matrix class. Also you can use `:title` option for setting special title:
``` ruby
class UserMatrix < DataMatrix::Base
  column :name, title: 'First name'
  column :email
  column 'address'
end
```

Create matrix object in your controller. Your matrix object takes any data object like virtus, AR, hanami-model, siquel-model or dry-types.
```ruby
# in controller

# ...
@user_matrix = UserMatrix.new(@user)
@user_matrix.compile
```

Call your matrix object in view or terminal.
```ruby
# in view

@user_matrix.to_html
@user_matrix.to_xml
@user_matrix.to_csv
@user_matrix.to_ascii
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/davydovanton/data_matrix. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
