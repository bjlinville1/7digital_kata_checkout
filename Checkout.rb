#checkout program

class Item
  
  # Set Attributes
  attr_accessor :sku
  attr_accessor :price

  # Set defaults
  def initialize
    # puts "A new item was created!"
    self.sku = nil
    self.price = nil
  end

  # Create your items available for purchase
   # To make this more re-usbale, lets make a method for adding items
    #I begin with an empty array of item hashes, and use the "@" symbol to make it an instance variable so it won't fall out of scope anywhere in the program.
    
    @items = [] 
   
  def self.add_item(*item_attributes)
    item = Item.new
    item.sku = item_attributes[0]
    # puts "a new item was skud!"
    item.price = item_attributes[1]
    # puts "a new item was priced!"
    @items.push item
    # puts "a new item was pushed!"
  end


  Item.add_item("a", 50)
  Item.add_item("b", 30)
  Item.add_item("c", 20)
  Item.add_item("d", 15)
  # puts "items were added successfully"
  #Accept a list of items to be purchased
  # items = gets.to_a
  p @items


puts "Please enter the items you want, with no spaces, or separation of any kind. For example: 'abc'.
 If you want more than one of any item, please re-enter it, until you reach your desired quantity. For example: 'aaaaabc'."  

user_items = gets.chomp

# After checking my initial solution, I've found that the code on 7 digital's Readme is making use of a regular expression named .scan as well as .split. They are slightly cleaner, but using .chars to push the string to an array works just fine here. 

user_items_characters = user_items.chars
p user_items_characters

#To Do: Build this array dynamically, so the number of elements is == to the number of items for sale, and elements both default and reset to 0 each time the program runs.

subtotal = 0
z = 0

user_items_characters.each do |x| 
  if @items[z].sku == x
    @items[z].price += subtotal
    p subtotal
    z += 1
  end
end

p subtotal
# subtotal = 0
# user_items_characters.each do |x|
#   quantities[x]*user_items_characters[x[:price]] += subtotal
# end

end