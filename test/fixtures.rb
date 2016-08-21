class User
  def name
    'Anton'
  end

  def email
    'test@site.com'
  end
end

class UserMatrix < DataMatrix::Base
  column :name
  column :email
  column 'last_name'
end

class UserTitledMatrix < DataMatrix::Base
  column :name, title: 'First name'
  column :email
  column 'last_name'
end
