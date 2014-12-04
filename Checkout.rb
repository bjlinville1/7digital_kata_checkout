#checkout program

class Item
  
  # Set Attributes
  attr_accessor :sku
  attr_accessor :price

  # Set defaults
  def initialize
    puts "A new item was created!"
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
    puts "a new item was skud!"
    item.price = item_attributes[1]
    puts "a new item was priced!"
    @items.push item
    puts "a new item was pushed!"
  end


  Item.add_item("a", 50)
  Item.add_item("b", 30)
  puts "items were added successfully"
  #Accept a list of items to be purchased
  # items = gets.to_a
  p @items

end
