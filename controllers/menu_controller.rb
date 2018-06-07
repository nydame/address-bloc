require_relative '../models/address_book'

class MenuController
    attr_reader :address_book

    def initialize
        @address_book = AddressBook.new
    end

    def main_menu
        # display menu options in command line
        puts "Main menu - #{address_book.entries.count} entries"
        puts "\# - View entry by number"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - Exit"
        print "Enter your selection: "
        # accept standard input from the command line
        selection = gets.chomp
        selection = selection.to_i if selection.to_i != 0
        # handle input
        case selection
            when "\#"
                system "clear"
                # puts " You choose #{selection}"
                view_entry_by_index
                main_menu
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
            else
                system "clear"
                puts "Sorry, that is not a valid input\n\n"
                main_menu
        end
    end

    def view_entry_by_index
        print "Enter the number of the entry: "
        entry_num = gets.to_i
        system "clear"
        # validate: expect counting numbers from 1 up
        if entry_num > 0 && entry_num <= address_book.entries.length
            puts address_book.entries[entry_num - 1].to_s + "\n\n"
        else
            ordinal_suffix = "th"
            last_digit = entry_num%10
            case last_digit
                when 1
                    ordinal_suffix = "st"
                when 2
                    ordinal_suffix = "nd"
                when 3
                    ordinal_suffix = "rd"
            end
            puts "Sorry, there is no #{entry_num}#{ordinal_suffix} entry.\n\n"
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
            #
        when "d"
            #
        when "e"
            #
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
    end

    def read_csv
    end
end
