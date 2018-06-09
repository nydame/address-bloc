require_relative 'entry'
# in addition, import the CSV class
require "csv"

# AddressBook model

class AddressBook
    attr_reader :entries

    def initialize
        @entries = []
    end

    def add_entry(name, phone_number, email)
        index = 0
        @entries.each do |entry|
            if name < entry.name
                break
            end
            index += 1
        end
        @entries.insert(index, Entry.new(name, phone_number, email))
    end

    def import_from_csv(file_name)
        # read the file from the data folder
        csv_text = File.read(File.expand_path("data") + "/" + file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
        # csv, an object of type CSV::Table, can be iterated over with each
        # add information from each row to the address book
        csv.each do |row|
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end
end
