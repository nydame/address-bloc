require_relative 'entry'

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

    def find_entry(name, phone_number, email)
        @entries.each_with_index do |entry, index|
            if (name == entry.name && phone_number == entry.phone_number && email == entry.email)
                # return position of entry when complete match is found
                return index
            end
        end
        -1 # return -1 if no match is found
    end

    def remove_entry(name, phone_number, email)
        position = self.find_entry(name, phone_number, email)
        @entries.delete_at(position) if position > -1
    end

end
