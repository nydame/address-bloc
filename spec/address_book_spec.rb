require_relative '../models/address_book'

RSpec.describe AddressBook do
    # create object to test
    let(:book) {AddressBook.new}
    # utility method
    def check_entry(entry, expected_name, expected_phone_number, expected_email)
            expect(entry.name).to eq expected_name
            expect(entry.phone_number).to eq expected_phone_number
            expect(entry.email).to eq expected_email
    end

    describe "attributes" do

        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end

        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
    end

    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(1)
        end

        it "adds the correct information to entries" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end

    describe "#import_from_csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries.csv")
            expect(book.entries.size).to eq(5)
        end

        it "imports the first entry from entries" do
            book.import_from_csv("entries.csv")
            entry = book.entries[0]
            check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
        end

        it "imports the second entry from entries" do
            book.import_from_csv("entries.csv")
            entry = book.entries[1]
            check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
        end

        it "imports the third entry from entries" do
            book.import_from_csv("entries.csv")
            entry = book.entries[2]
            check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
        end

        it "imports the fourth entry from entries" do
            book.import_from_csv("entries.csv")
            entry = book.entries[3]
            check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
        end

        it "imports the fifth entry from entries" do
            book.import_from_csv("entries.csv")
            entry = book.entries[4]
            check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end

        it "imports the correct number of entries from entries_2" do
            book.import_from_csv("entries_2.csv")
            expect(book.entries.size).to eq(6)
        end

        it "imports the first entry in alphabetical order from entries_2" do
            book.import_from_csv("entries_2.csv")
            entry = book.entries[3]
            check_entry(entry, "Philomena", "555-555-1111", "philly_girl@blocmail.com")
        end

        it "imports the second entry in alphabetical order from entries_2" do
            book.import_from_csv("entries_2.csv")
            entry = book.entries[0]
            check_entry(entry, "Jared", "555-555-2222", "jaredy@blocmail.com")
        end

        it "imports the third entry in alphabetical order from entries_2" do
            book.import_from_csv("entries_2.csv")
            entry = book.entries[2]
            check_entry(entry, "Meghan", "555-555-3333", "mgj@blocmail.com")
        end

        it "imports the fourth entry in alphabetical order from entries_2" do
            book.import_from_csv("entries_2.csv")
            entry = book.entries[1]
            check_entry(entry, "Jenna", "555-555-4444", "jenna.bentham@blocmail.com")
        end

        it "imports the fifth entry in alphabetical order from entries_2" do
            book.import_from_csv("entries_2.csv")
            entry = book.entries[5]
            check_entry(entry, "Zarathustra", "555-555-5555", "thebigz@blocmail.com")
        end

        it "imports the sixth entry in alphabetical order from entries_2" do
            book.import_from_csv("entries_2.csv")
            entry = book.entries[4]
            check_entry(entry, "Waldomir", "555-555-6666", "wally_boy@blocmail.com")
        end
    end
end
