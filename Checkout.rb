#checkout program
class Item
  
  # Set Attributes
  attr_accessor :sku
  attr_accessor :price
  attr_accessor :quantity
  attr_accessor :sale

  # Set defaults
  def initialize
    # puts "A new item was created!"
    self.sku = nil
    self.price = nil
    self.quantity = 0
    self.sale = "none"
  end

  # Create your items available for purchase
   # To make this more re-usbale, lets make a method for adding items
    #I begin with an empty array of item hashes, and use the "@" symbol to make it an instance variable so it won't fall out of scope anywhere in the program.
    
    @items = [] 
   
  def self.add_item(*item_attributes)
    item = Item.new
    item.sku = item_attributes[0]
    item.price = item_attributes[1]
    item.quantity = item_attributes[2]
    item.sale = item_attributes[3]
    @items.push item
  end


  Item.add_item("a", 50, 0, "Summer")
  Item.add_item("b", 30, 0, "Fall")
  Item.add_item("c", 20, 0)
  Item.add_item("d", 15, 0)

  p @items

  # Get user input

  puts "Please enter the items you want, for example: 'abc'.
   If you want more than one of any item, please re-enter it, until you reach your desired quantity. For example: 'abbbbbc'. And please, don't do anything mean, like wipe people's hard drives. Enjoy!"  

  user_items = gets.chomp

  # After checking my initial solution, I've found that the code on 7 digital's Readme is making use of a regular expression named .scan as well as .split. They are slightly cleaner, but using .chars to push the string to an array works just fine here, and actually executes faster. 

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

#We can now more easily check for special pricing and then solve for our subtotal when sales are involved. I want to be able to quickly and easily update each sale's attributes, as well as add new sales to existing items. A good way to that would be to make a new Sale class, but just for the sake of the exercise, I'll keep things local to this class. 
  
  @sales = [
  {name:"Summer", quantity: 3, percentage_discount: 13}, {name: "Fall", quantity: 2, percentage_discount: 25}]

# We don't want stacking discounts, so we'll only accept one sale per item for now. I've added another attribute to our items to accomodate this flexibility, and written the following logic to check items to see if items are on sale, and if so apply the appropriate discounts, and finally add up the total cost.
  
  subtotal = 0

  #Check each item for sales
  @items.each do |x|
    if x.sale 

      @sales.each do |y|
           
        #When a sale is possible for an item, identify which sale it is.
        if y[:name] == x.sale

          #Solve for the sale price
          #To Do: all integers to_floats
          sale_price = y[:quantity] * ((100*x.price - 100*y[:percentage_discount]/100*x.price)/100) 

          #Solve for the number of times it will be applied
          #Ruby truncates this so anything less 1 = 0.
          number_of_sale_groups = x.quantity/y[:quantity] 

          #subtotal it
          subtotal += number_of_sale_groups * sale_price

          #and account for all leftovers & items who have possible discounts, but who's sale conditions have not been met. 
          subtotal += (x.quantity % y[:quantity]) * x.price
  
        end

        p "'#{x.sku}', #{subtotal}"

      end  

    #If there are no sale prices for an item just multiply price by quantity and subtotal it.
    else 
      subtotal += x.quantity * x.price
      p "'#{x.sku}', #{subtotal}"
    end
  end
  p "Total #{subtotal}" 
      
end
