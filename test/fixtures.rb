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
end
