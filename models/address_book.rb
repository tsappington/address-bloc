require_relative 'entry'
require "csv"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end


   def add_entry(name, phone_number, email)
     index = 0
     entries.each do |entry|

       if name < entry.name
         break
       end

       index += 1

     end
     entries.insert(index, Entry.new(name, phone_number, email))
   end

   def import_from_csv(file_name)
      csv_text = File.read(file_name)
      csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
      csv.each do |row|
        row_hash = row.to_hash
        add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
      end
   end

   def iterative_search(name)

     lower = 0
     upper = entries.length - 1
     while lower <= upper

       check_name = entries[lower].name
       if name == check_name
         return entries[lower]
       else
         lower += 1
       end

     end

     return nil
   end

end
