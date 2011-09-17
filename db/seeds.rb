# Loads seed data out of default dir
#Rake::Task["db:load_dir"].invoke( "default" )
#puts "Default data has been loaded"

User.create(
    :username => "admin",
    :name => "admin",
    :password => "admin123",
    :password_confirmation => "admin123",
    :email => "admin@example.com",
    :roles_mask => 1
)