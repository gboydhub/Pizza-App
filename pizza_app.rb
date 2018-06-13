def get_sauce(id)
    sauces = ["Red", "White", "Garlic"]
    if id <= sauces.length
        return sauces[id]
    end
end

def get_size(id)
    sizes = ["Small", "Medium", "Large"]
    if id <= sizes.length
        return sizes[id]
    end
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

def generate_pizza()
    randompizza = Array.new
    randompizza[0] = get_size(rand(0...3))
    randompizza[1] = get_sauce(rand(0...3))
    randompizza[2] = get_meat(rand(0...4))
    randompizza[3] = get_topping(rand(0...3))
    puts "You have a #{randompizza[0]} #{randompizza[2]} & #{randompizza[3]} pizza with #{randompizza[1]} sauce."
end

generate_pizza()