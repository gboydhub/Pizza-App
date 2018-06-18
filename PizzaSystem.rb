
class PizzaSystem
  def initialize()
    @sauces=[]
    @sizes={}
    @meats=[]
    @toppings=[]
    @total_price = 0

    @crust_string = ""
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

  def print_pizza_selection()
    p @crust_string
  end

  def print_price()
    p total_price
  end

  attr_accessor :sauces
  attr_accessor :sizes
  attr_accessor :meats
  attr_accessor :toppings
  attr_reader   :total_price
end