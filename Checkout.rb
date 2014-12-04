#checkout program

class Item
  
  # Set Attributes
  attr_accessor :sku
  attr_accessor :price
  attr_accessor :quantity

  # Set defaults
  def initialize
    # puts "A new item was created!"
    self.sku = nil
    self.price = nil
    self.quantity = 0
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

  cart = user_items.chars
  p cart

  #I decided it would be easier to add a quantity attribute with a default of 0, then loop through the user input and add 1 to it each time it found a matching item for sale. We have to do this individually for each possible item, so I used z to represent the number of items available by using @items.each and incrementing 1 each iteration. 

  z = 0

  @items.each do |item|
    cart.each do |x| 
      if @items[z].sku == x
        @items[z].quantity += 1
      end
    end
    z += 1
  end


end