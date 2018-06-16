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
    ["Olives", "Pineapple", "Peppers", "Mushrooms", "Onions"]
end

def get_order()
    system 'clear' or system 'cls'
    totalprice = 0
    get_sizes.each_with_index do |s, i|
        puts "#{i+1}. #{s[0]} is $#{'%.2f'%s[1]}"
    end
    puts "What size pizza would you like?"
    crust = gets.chomp.to_i
    while crust > get_sizes.length || crust < 1 do
        puts "Invalid option, enter a number for your selection."
        crust = gets.chomp.to_i
    end
    totalprice += get_sizes[get_sizes.keys[crust-1]]
    crust_string = get_sizes.keys[crust-1]

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
    sauce_string = get_sauce[sauce-1]

    system 'clear' or system 'cls'

    puts "Would you like extra cheese?"
    extra_cheese = false
    cheese_key = 'k'
    while cheese_key.downcase != 'y' && cheese_key.downcase != 'n' do
        print "Please select [y/n]: "
        cheese_key = gets.chomp
    end
    if cheese_key == 'y'; extra_cheese = true; totalprice += 1.00 end
    
    system 'clear' or system 'cls'

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
            if v.to_i.to_s != v || v.to_i < 1 || v.to_i > get_meat.length
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
    
    system 'clear' or system 'cls'

    get_topping.each_with_index do |v, i|
        puts "#{i+1}. #{v}"
    end
    puts "Please select additional toppings, seperated by a comma.\nType the same topping twice to get extra.\nExample: 2, 2, 5    Would be Onions and Extra Pineapple"
    toppings_check = false
    while !toppings_check do
        toppings = gets.chomp
        toppings = toppings.split(', ')
        toppings_check = true
        toppings.each do |v|
            if v.to_i.to_s != v || v.to_i < 1 || v.to_i > get_topping.length
                puts "Invalid selection"
                toppings_check = false
                break
            end
        end
    end

    toppings_string = ""
    toppings.each_with_index do |v, i|
        v = get_topping[v.to_i - 1]
        if toppings_string.include?(v)
            unless toppings_string.include?("Extra #{v}"); toppings_string = toppings_string.sub(v, "Extra #{v}")
            else next end
        else
            if i > 0; toppings_string += ", " end
            toppings_string += v
        end
        totalprice += 0.50
    end

    system 'clear' or system 'cls'

    puts "You selected a #{crust_string} pizza with #{sauce_string} sauce."
    if meats_string != "" || toppings_string != "" || extra_cheese == true
        print "You wanted "
        if meats_string != ""; print meats_string end
        if toppings_string != ""; print ", #{toppings_string}" end
        if extra_cheese; print " and Extra Cheese\n" end
    end
    puts "Your total is: $#{'%.2f'%totalprice}"
    puts "\nIs this correct? [y/n]"

    correct_key = 'k'
    while correct_key != 'y' && correct_key != 'n'
        correct_key = gets.chomp.downcase
    end

    if correct_key == 'n'; get_order() end
end

get_order()