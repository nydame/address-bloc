require_relative '../models/address_book'

class MenuController
    attr_reader :address_book

    def initialize
        @address_book = AddressBook.new
    end

    def main_menu
        # display menu options in command line
        puts "Main menu - #{address_book.entries.count} entries"
        puts "1 - Browse entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - Exit"
        puts "D - NUKE"
        print "Enter your selection: "
        # accept standard input from the command line
        selection = gets.chomp
        if selection != "D"
            selection = selection.to_i
        end
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                system "clear"
                create_entry
                main_menu
            when 3
                system "clear"
                search_entries
                main_menu
            when 4
                system "clear"
                read_csv
                main_menu
            when 5
                system "clear"
                puts "Goodbye!"
                exit(0)
            when "D"
                address_book.entries.clear
                system "clear"
                puts "Address book is empty.\n\n"
                main_menu
            else
                system "clear"
                puts "Sorry, #{selection} is not a valid input\n\n"
                main_menu
        end
    end

    def view_all_entries
        # loop through entire address_book
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            entry_submenu(entry)
        end
        # clear and show message
        system "clear"
        puts "End of entries\n\n"
    end

    def entry_submenu(entry)
        # display submenu
        puts "n - next entry"
        puts "d - delete this entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        # capture input
        selection = gets.chomp
        # handle input
        case selection
        when "n"
            # we implement this feature by doing nothing...cool!
        when "d"
            delete_entry(entry)
            entry_submenu(entry)
        when "e"
            edit_entry(entry)
            entry_submenu(entry)
        when "m"
            system "clear"
            main_menu
        else
            system "clear"
            puts "#{selection} is not valid input"
            entry_submenu(entry)

        end
    end

    def create_entry
        system "clear"
        puts "New AddressBloc Entry\n\n"
        # get input for all 3 fields
        print "Name: "
        name = gets.chomp
        print "Phone: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        # crate new entry, clear screen & show message
        address_book.add_entry(name, phone, email)
        system "clear"
        puts "New entry created\n\n"
    end

    def search_entries
        print "Search for a name: "
        name = gets.chomp
        match = address_book.binary_search(name)
        system "clear"
        if match
            puts match.to_s
            search_submenu(match)
        else
            puts "No match found for #{name}"
        end
    end

    def search_submenu(entry)
        # display submenu
        puts "\nd - delete entry"
        puts "e - edit entry"
        puts "m - return to main menu"
        # capture input
        selection = gets.chomp
        # handle input
        case selection
        when "d"
            system "clear"
            delete_entry(entry)
            main_menu
        when "e"
            edit_entry(entry)
            system "clear"
            main_menu
        when "m"
            system "clear"
            main_menu
        else
            system "clear"
            puts "#{selection} is not a valid input"
            puts entry.to_s
            search_submenu(entry)
        end
    end

    def read_csv
        print "Enter CSV file to import: "
        file_name = gets.chomp

        if file_name.empty?
            system "clear"
            puts "File could not be read.\n\n"
            main_menu
        end

        begin
            entry_count = address_book.import_from_csv(file_name).count
            system "clear"
            puts "#{entry_count} new entries added from #{file_name}\n\n"
        rescue
            puts "#{file_name} could not be read as a CSV file."
            puts "Would you like to try again? (y/n)"
            answer = gets.chomp[0].downcase
            if answer == "y"
                read_csv
            else
                main_menu
            end
        end

    end

    def delete_entry(entry)
        address_book.entries.delete(entry)
        puts "#{entry.name} has been deleted."
    end

    def edit_entry(entry)
        # capture new data
        print "New name (hit \'return\' if no changes): "
        name = gets.chomp
        puts "\n"
        print "New phone number: (hit \'return\' if no changes)"
        phone_number = gets.chomp
        puts "\n"
        print "New email: (hit \'return\' if no changes)"
        puts "\n"
        email = gets.chomp
        # update entry in a way that preserves order of entries
        # and encapsulation of Entry data
        # (as opposed to the way it's done in the lesson!)
        if name.empty?
            # no need for a new entry
            entry.phone_number(phone_number) if !phone_number.empty?
            entry.email(email) if !email.empty?
            puts entry
            puts "Information for #{entry.name} has been updated."
        else
            # delete entry and add new one via add_entry
            original_name = entry.name
            phone_number = entry.phone_number if phone_number.empty?
            email = entry.email if email.empty?
            address_book.entries.delete(entry)
            index = address_book.add_entry(name, phone_number, email)
            puts address_book.entries[index]
            puts "#{original_name} is now #{name}; update is complete."
        end
    end

end
