require './PizzaSystem.rb'

PS = PizzaSystem.new
PS.sizes = {"Small" => 5.00, "Medium" => 8.00, "Large" => 11.00}
PS.sauces = ["Red", "White", "Garlic"]
PS.meats = ["Pepperoni", "Sausage", "Ham", "Chicken", "Bacon"]
PS.toppings = ["Olives", "Pineapple", "Peppers", "Mushrooms", "Onions"]

def get_order()
    PS.reset_price()
    PS.select_size()
    PS.select_sauce()
    PS.select_meat_toppings()
    PS.select_veggie_toppings()
    PS.ask_extra_cheese()
    
    system 'clear' or system 'cls'

    PS.print_pizza_selection()
    PS.print_price()
    puts "\nIs this correct? [y/n]"

    correct_key = 'k'
    while correct_key != 'y' && correct_key != 'n'
        correct_key = gets.chomp.downcase
    end

    if correct_key == 'n'; get_order() end
end

get_order()
PS.apply_taxes()
PS.ask_for_tip()
PS.ask_for_delivery()
system 'clear' or system 'cls'
PS.print_reciept()