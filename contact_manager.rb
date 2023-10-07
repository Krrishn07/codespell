class Contact
  attr_accessor :name, :phone

  def initialize(name, phone)
    @name = name
    @phone = phone
  end

  def to_s
    "#{name}: #{phone}"
  end
end

class ContactManager
  def initialize
    @contacts = []
  end

  def add_contact(contact)
    @contacts << contact
  end

  def list_contacts
    @contacts.each_with_index do |contact, index|
      puts "#{index + 1}. #{contact}"
    end
  end

  def search_contact(query)
    results = @contacts.select { |contact| contact.name.downcase.include?(query.downcase) }
    results.each_with_index do |contact, index|
      puts "#{index + 1}. #{contact}"
    end
  end

  def delete_contact(index)
    @contacts.delete_at(index - 1) if index.between?(1, @contacts.length)
  end
end

contact_manager = ContactManager.new

while true
  puts "Options:"
  puts "1. Add contact"
  puts "2. List contacts"
  puts "3. Search contacts"
  puts "4. Delete contact"
  puts "5. Quit"

  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Enter name:"
    name = gets.chomp
    puts "Enter phone number:"
    phone = gets.chomp
    contact = Contact.new(name, phone)
    contact_manager.add_contact(contact)
  when 2
    puts "Contacts:"
    contact_manager.list_contacts
  when 3
    puts "Enter search query:"
    query = gets.chomp
    contact_manager.search_contact(query)
  when 4
    puts "Enter the contact number to delete:"
    index = gets.chomp.to_i
    contact_manager.delete_contact(index)
  when 5
    break
  else
    puts "Invalid option. Please try again."
  end
end
