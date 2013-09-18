# Anthony Gagliardi <anthony.gagliardi@colorado.edu>
# Assignment 2 -- Working more with Ruby
# Last Modified -- 13 September 2013

# Part 1: Classes
class Dessert
    def initialize(name, calories)
        @name = name
        @calories = calories
    end
    def healthy?
        if (@calories < 200)
            true
        else
            false
        end
    end
    def delicious?
        true
    end
end

# Part 1 (a) test cases
dessert = Dessert.new("Apple Turnover", 395)
p "Is dessert healthy?"
p dessert.healthy?
p "Is dessert delicious"
p dessert.delicious?
dessert2 = Dessert.new("Ice Cream", 199)
p "Is dessert2 healthy?"
p dessert2.healthy?
p "Is dessert2 delicious?"
p dessert2.delicious?

class JellyBean < Dessert
    def initialize(name, calories, flavor)
    @name = name
    @calories = calories   
    @flavor = flavor     
    end
    def delicious?
        if @flavor == "black licorice"
            false
        else
            true
        end
    end
end

# Part 1 (b) test cases
bean1 = JellyBean.new("Black Bean", 17, "black licorice")
bean2 = JellyBean.new("Yellow Bean", 12, "popcorn")

p "Is bean1 delicious?"
p bean1.delicious?
p "Is bean1 healthy?"
p bean1.healthy?
p "Is bean2 delicious?"
p bean2.delicious?
p "Is bean2 healthy?"
p bean2.healthy?


# Part 2: Object Oriented Programming

# Part 3: More Object Oriented Programming

# Part 4: Blocks