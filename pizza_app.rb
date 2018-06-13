def get_sauce(id)
    sauces = ["Red", "White", "Garlic"]
    if id <= sauces.length
        return sauces[id]
    end
end

def get_sizes()
    {"Small" => 5.00, "Medium" => 6.50, "Large" => 8.00}
end

def get_meat(id)
    meats = ["Pepperoni", "Sausage", "Ham", "Chicken"]
    if id <= meats.length
        return meats[id]
    end
end

def get_topping(id)
    toppings = ["Olives", "Pineapple", "Peppers"]
    if id <= toppings.length
        return toppings[id]
    end
end

def get_order()
    puts "What size pizza would you like?"
    get_sizes.each do |s|
        puts "#{s[0]} is #{s[1]}"
    end
    
    crust = gets.chomp.to_i
    print "\nWhat type of sauce?\n"
end

def print_menu()
    system 'clear' or system 'cls'
    puts <<-MENU
    ================================================
    ===             
    MENU
end

def generate_pizza()
    randompizza = Array.new
        randompizza[0] = get_size(rand(0...3))
        randompizza[1] = get_sauce(rand(0...3))
        randompizza[2] = get_meat(rand(0...4))
        randompizza[3] = get_topping(rand(0...3))
        #puts "You have a #{randompizza[0]} #{randompizza[2]} & #{randompizza[3]} pizza with #{randompizza[1]} sauce."
end

get_order()