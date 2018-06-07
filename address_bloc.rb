puts "Welcome to AddressBloc!"

# Display menu after clearing commnad line
require_relative 'controllers/menu_controller'
menu = MenuController.new
system "clear"
puts "Welcome to AddressBloc!"
menu.main_menu
