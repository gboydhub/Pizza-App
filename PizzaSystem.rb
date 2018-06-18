
class PizzaSystem
  def initialize()
    @sauces=[]
    @sizes={}
    @meats=[]
    @toppings=[]
    @total_price = 0

    @crust_string = ""
    @sauce_string = ""
    @extra_cheese = false
    
  end

  def select_size()
    system 'clear' or system 'cls'
    @sizes.each_with_index do |s, i|
        puts "#{i+1}. #{s[0]} is $#{'%.2f'%s[1]}"
    end
    puts "What size pizza would you like?"
    crust = gets.chomp.to_i
    while crust > @sizes.length || crust < 1 do
        puts "Invalid option, enter a number for your selection."
        crust = gets.chomp.to_i
    end
    @total_price += @sizes[@sizes.keys[crust-1]]
    @crust_string = @sizes.keys[crust-1]
  end

  def ask_extra_cheese()
    system 'clear' or system 'cls'

    puts "Would you like extra cheese?"
    @extra_cheese = false
    cheese_key = 'k'
    while cheese_key != 'y' && cheese_key != 'n' do
        print "Please select [y/n]: "
        cheese_key = gets.chomp.downcase
    end
    if cheese_key == 'y'; @extra_cheese = true; @total_price += 1.00 end
  end

  def select_sauce()
    system 'clear' or system 'cls'

    @sauces.each_with_index do |v, i|
        puts "#{i+1}. #{v}"
    end
    puts "\nWhat type of sauce?"
    sauce = gets.chomp.to_i
    while sauce > @sauces.length || sauce < 1 do
        puts "Invalid option, enter a number for your selection."
        sauce = gets.chomp.to_i
    end
    @sauce_string = @sauces[sauce-1]
  end

  def reset_price()
    @total_price = 0.00
  end

  def print_pizza_selection()
    p @crust_string
    p @sauce_string
    p @extra_cheese
  end

  def print_price()
    p @total_price
  end

  attr_accessor :sauces
  attr_accessor :sizes
  attr_accessor :meats
  attr_accessor :toppings
  attr_reader   :total_price
end