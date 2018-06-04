require_relative '../models/entry'

RSpec.describe Entry do

  describe "attributes" do
    # define test object
    let(:entry) {Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}
    # test 1
    it "responds to name" do
      expect(entry).to respond_to(:name)
    end
    # test 2
    it "reports its name" do
      expect(entry.name).to eq('Ada Lovelace')

    end
    # test 3
    it "responds to phone number" do
      expect(entry).to respond_to(:phone_number)
    end
    # test 4
    it "reports its phone number" do
      expect(entry.phone_number).to eq('010.012.1815')

    end
    # test 5
    it "responds to email" do
      expect(entry).to respond_to(:email)
    end
    # test 6
    it "reports its email" do
      expect(entry.email).to eq('augusta.king@lovelace.com')

    end

  end

  describe "#to_s" do
      it "prints an entry as a string" do
          entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
          expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
          expect(entry.to_s).to eq(expected_string)
      end
  end

end
