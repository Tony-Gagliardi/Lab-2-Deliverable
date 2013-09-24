# Anthony Gagliardi <anthony.gagliardi@colorado.edu>
# Assignment 2 -- Working more with Ruby
# Last Modified -- 13 September 2013
# Github repository -- https://github.com/Tony-Gagliardi/Lab-2-Deliverable

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

class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s
        attr_reader attr_name
        attr_reader attr_name+"_history"
        class_eval %Q"
                    def #{attr_name}=value
                        if !defined? @#{attr_name}_history
                            @#{attr_name}_history = [@#{attr_name}]
                        end
                        @#{attr_name} = value
                        @#{attr_name}_history << value
                    end
                    "
                end
            end
            

class Foo
    attr_accessor_with_history :bar
end

# Part 2 Test Cases
f = Foo.new
f.bar = 1
f.bar = 2
f = Foo.new
f.bar = 4
p "What is f's history?"
p f.bar_history

# Part 3: More Object Oriented Programming

 class Numeric
    @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
    def method_missing(method_id)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end
    
    def dollar
        self
    end
    def yen
        self * @@currencies["yen"]
    end
    def euro
        self * @@currencies["euro"]
    end
    def rupee
        self * @@currencies["rupee"]
    end
    def in(currency)
        method_missing(currency)
    end
end

# Part 3 (a) test cases
p (125.euro.in(:dollar))
p (270.rupees.in(:euro))
p (199.yen.in(:rupees))

# Part 3.b
class String
    def palindrome?()
        string = self.upcase.gsub(/[^A-Z]/, "")
        pal = string.reverse
        if (string == pal)
            true
        else
            false
        end
    end
end

# Part 3 (b) test cases
p ("A man, a plan, a canal -- Panama".palindrome?)
p ("Bob's Burgers".palindrome?)

# Part 3.c
module Enumerable
    def palindrome?()
        string = self
        pal = []
        string.reverse_each {|i| pal << i}
        if(string == pal)
            true
        else
            false
        end
    end
end

# Part 3 (c) test cases
p ([1, 2, 3, 2, 1].palindrome?)

# Part 4: Blocks

class CartesianProduct
    include Enumerable
    # code
end
