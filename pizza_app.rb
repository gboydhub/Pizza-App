def get_sauce()
    ["Red", "White", "Garlic"]
end

def get_sizes()
    {"Small" => 5.00, "Medium" => 8.00, "Large" => 11.00}
end

def get_meat()
    ["Pepperoni", "Sausage", "Ham", "Chicken", "Bacon"]
end

def get_topping()
    ["Olives", "Pineapple", "Peppers"]
end

def get_order()
    system 'clear' or system 'cls'
    totalprice = 0
    get_sizes.each_with_index do |s, i|
        puts "#{i+1}. #{s[0]} is #{s[1]}"
    end
    puts "What size pizza would you like?"
    crust = gets.chomp.to_i
    while crust > get_sizes.length || crust < 1 do
        puts "Invalid option, enter a number for your selection."
        crust = gets.chomp.to_i
    end
    totalprice += get_sizes[get_sizes.keys[crust-1]]

    system 'clear' or system 'cls'

    get_sauce.each_with_index do |v, i|
        puts "#{i+1}. #{v}"
    end
    puts "\nWhat type of sauce?"
    sauce = gets.chomp.to_i
    while sauce > get_sauce.length || sauce < 1 do
        puts "Invalid option, enter a number for your selection."
        sauce = gets.chomp.to_i
    end

    puts "Would you like extra cheese?"
    extra_cheese = false
    cheese_key = 'k'
    while cheese_key.downcase != 'y' && cheese_key.downcase != 'n' do
        print "Please select [y/n]: "
        cheese_key = gets.chomp
    end
    if cheese_key == 'y'; extra_cheese = true; totalprice += 1.00 end
    
    get_meat.each_with_index do |v, i|
        puts "#{i+1}. #{v}"
    end
    puts "Please select meat items, seperated by a comma.\nType the same meat twice to get extra.\nExample: 1, 1, 4    Would be Bacon and Extra Pepperoni"
    meats_check = false
    while !meats_check do
        meats = gets.chomp
        meats = meats.split(', ')
        meats_check = true
        meats.each do |v|
            if v.to_i.to_s != v
                puts "Invalid selection"
                meats_check = false
                break
            end
        end
    end

    meats_string = ""
    meats.each_with_index do |v, i|
        v = get_meat[v.to_i - 1]
        if meats_string.include?(v)
            unless meats_string.include?("Extra #{v}"); meats_string = meats_string.sub(v, "Extra #{v}")
            else next end
        else
            if i > 0; meats_string += ", " end
            meats_string += v
        end
        totalprice += 0.75
    end

    puts "You selected: #{meats_string}"
    p totalprice
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