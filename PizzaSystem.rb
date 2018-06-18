
class PizzaSystem
  def initialize()
    @sauces=[]
    @sizes={}
    @meats=[]
    @toppings=[]
    @total_price = 0

    @crust_string = ""
    @sauce_string = ""
    @toppings_string = ""
    @meats_string = ""
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

  def select_meat_toppings()
    system 'clear' or system 'cls'

    @meats.each_with_index do |v, i|
        puts "#{i+1}. #{v}"
    end
    puts "Please select meat items for $0.75 each, seperated by a comma.\nType the same meat twice to get extra.\nExample: 1, 1, 4    Would be Bacon and Extra Pepperoni"
    meats_check = false
    while !meats_check do
        meat_input = gets.chomp
        meat_input = meat_input.split(', ')
        meats_check = true
        meat_input.each do |v|
            if v.to_i.to_s != v || v.to_i < 1 || v.to_i > @meats.length
                puts "Invalid selection"
                meats_check = false
                break
            end
        end
    end

    @meats_string = ""
    meat_input.each_with_index do |v, i|
        v = @meats[v.to_i - 1]
        if @meats_string.include?(v)
            unless @meats_string.include?("Extra #{v}"); @meats_string = @meats_string.sub(v, "Extra #{v}")
            else next end
        else
            if i > 0; @meats_string += ", " end
            @meats_string += v
        end
        @total_price += 0.75
    end
  end

  def select_veggie_toppings()
    system 'clear' or system 'cls'

    @toppings.each_with_index do |v, i|
        puts "#{i+1}. #{v}"
    end
    puts "Please select additional toppings for $0.50 each, seperated by a comma.\nType the same topping twice to get extra.\nExample: 2, 2, 5    Would be Onions and Extra Pineapple"
    toppings_check = false
    while !toppings_check do
        topping_input = gets.chomp
        topping_input = topping_input.split(', ')
        toppings_check = true
        topping_input.each do |v|
            if v.to_i.to_s != v || v.to_i < 1 || v.to_i > @toppings.length
                puts "Invalid selection"
                toppings_check = false
                break
            end
        end
    end

    @toppings_string = ""
    topping_input.each_with_index do |v, i|
        v = @toppings[v.to_i - 1]
        if @toppings_string.include?(v)
            unless @toppings_string.include?("Extra #{v}"); @toppings_string = @toppings_string.sub(v, "Extra #{v}")
            else next end
        else
            if i > 0; @toppings_string += ", " end
            @toppings_string += v
        end
        @total_price += 0.50
    end
  end

  def reset_price()
    @total_price = 0.00
  end

  def print_pizza_selection()
    system 'clear' or system 'cls'

    puts "You selected a #{@crust_string} pizza with #{@sauce_string} sauce."
    if @meats_string != "" || @toppings_string != "" || @extra_cheese == true
        print "You wanted "
        if @meats_string != ""; print @meats_string end
        if @toppings_string != ""; print ", #{@toppings_string}" end
        if @extra_cheese; print " and Extra Cheese\n" end
    end
  end

  def print_price()
    puts "Your total is: $#{'%.2f'% @total_price}"
  end

  attr_accessor :sauces
  attr_accessor :sizes
  attr_accessor :meats
  attr_accessor :toppings
  attr_reader   :total_price
end