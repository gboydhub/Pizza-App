def get_sauce(id)
    ["Red", "White", "Garlic"]
end

def get_sizes()
    {"Small" => 5.00, "Medium" => 6.50, "Large" => 8.00}
end

def get_meat(id)
    ["Pepperoni", "Sausage", "Ham", "Chicken"]
end

def get_topping(id)
    ["Olives", "Pineapple", "Peppers"]
end

def get_order()
    totalprice = 0
    get_sizes.each_with_index do |s, i|
        puts "#{i+1}. #{s[0]} is #{s[1]}"
    end
    puts "What size pizza would you like?"
    crust = gets.chomp.to_i
    while crust > get_sizes.length do
        puts "Invalid option, enter a number for your selection."
        crust = gets.chomp.to_i
    end

    totalprice += get_sizes[get_sizes.keys[crust-1]]
    
    puts "\nWhat type of sauce?"

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