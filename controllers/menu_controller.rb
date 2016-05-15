require_relative '../models/address_book'


class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "\nMain Menu - #{address_book.entries.count} entries"
    puts "\n1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - View an entry"
    puts "4 - Search from an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "\nEnter your selection: "

    selection = gets.to_i

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
            view_entry
            main_menu
          when 4
            system "clear"
            search_entries
            main_menu
          when 5
            system "clear"
            read_csv
            main_menu
          when 6
            puts "Good-bye!"
            exit(0)
          else
            system "clear"
            puts "Sorry, that is not a valid input"
            main_menu
        end
      end

      def view_all_entries
        address_book.entries.each do |entry|
           system "clear"
           puts entry.to_s
           entry_submenu(entry)
         end

         system "clear"
         puts "End of entries"
      end

      def create_entry
        system "clear"
        puts "New AddressBloc Entry"
        print "\nName: "
        name = gets.chomp
        print "Phone number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp

        address_book.add_entry(name, phone, email)

        system "clear"
        puts "New entry created"
      end

      def search_entries
      end

      def read_csv
      end

      def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"

        selection = gets.chomp

        case selection
          when "n"
          when "d"
          when "e"
          when "m"
            system "clear"
            main_menu
          else
            system "clear"
            puts "#{selection} is not a valid input"
            entry_submenu(entry)
        end
      end

      def view_entry

        system "clear"
        puts "View an entry"
        print "User #: "
        user = gets.chomp
        user = (user.to_i - 1) # add_entry starts with #0

        result = ""
        address_book.entries.each_with_index do |entry, index|
          if user == index
            result = entry
            break
          end
        end

        if result != ""
          system "clear"
          puts "User ##{user + 1}:"
          puts result
        else
          system "clear"
          puts "User ##{user + 1} does not exist!"
          puts "\n1 - Try Again"
          puts "2 - Return to main menu"
          choice = gets.chomp

          case choice
            when "1"
              view_entry
            when "2"
              system "clear"
              main_menu
          end
        end

        puts "\nHit enter to return to main menu"
        gets.chomp
        system "clear"
        main_menu

      end

end
