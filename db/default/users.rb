# see last line where we create an admin if there is none, asking for username and password
def prompt_for_admin_password
  password = ask('Password [admin123]: ', String) do |q|
    q.echo = false
    q.validate = /^(|.{5,40})$/
    q.responses[:not_valid] = "Invalid password. Must be at least 5 characters long."
    q.whitespace = :strip
  end
  password = "admin123" if password.blank?
  password
end

def prompt_for_admin_username
  username = ask('Email [admin]: ', String) do |q|
    q.echo = true
    q.whitespace = :strip
  end
  username = "admin" if username.blank?
  username
end

def create_admin_user
  if ENV['AUTO_ACCEPT']
    password =  "admin123"
    username =  "admin"
  else
    require 'highline/import'
    puts "Create the admin user (press enter for defaults)."
    #name = prompt_for_admin_name unless name
    username = prompt_for_admin_username
    password = prompt_for_admin_password
  end
  attributes = {
    :password => password,
    :password_confirmation => password,
    :username => username,
    :name => username,
    :roles_mask => 1

  }

  load 'user.rb'

  if User.find_by_username(username)
    say "\nWARNING: There is already a user with the username: #{username}, so no account changes were made.  If you wish to create an additional admin user, please run rake db:admin:create again with a different username.\n\n"
  else
    admin = User.create(attributes)
    # create an admin role and and assign the admin user to that role
    #role = Role.find_or_create_by_name "admin"
    #admin.roles << role
    admin.save
  end
end

#create_admin_user if User.where("roles.name" => 'admin').includes(:roles).empty?