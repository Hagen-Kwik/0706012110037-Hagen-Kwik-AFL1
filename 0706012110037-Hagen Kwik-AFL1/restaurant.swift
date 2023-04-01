//
//  restaurant.swift
//  0706012110037-Hagen Kwik-AFL1
//
//  Created by MacBook Pro on 03/03/23.
//
import Foundation

//protocol for restaurant
protocol RestaurantAbstractClass {
    var name: String {get}
    var food: Array<food> {get}
    
    mutating func addFood(food: food)
}

// struct using the protocol, no func needed because all the func is the same
struct Restaurant: RestaurantAbstractClass {
    let name:String
    var food: Array<food> = []
    
    mutating func addFood(food: food){
        self.food.append(food) }
}

//class for food
class food {
    var name: String
    var price: Int
    
    init(name: String, price: Int){
        self.name = name
        self.price = price
    }
}

//inheritance of food
class ShoppingCartItem: food {
    var totalItems: Int
    var restaurantName: String
    
    init(name:String, price:Int, totalItems:Int, resName: String){
        self.totalItems = totalItems
        restaurantName = resName
        super.init(name: name, price: price)
    }
}

//shopping cart struct
struct Cart {
    var cart: Array<ShoppingCartItem>
    var sortedCart: Array<ShoppingCartItem> = []

    var totalPrice = 0
    //function to add item to cart
    mutating func addToCart(item: ShoppingCartItem){
        var tempDoubleItems = false
        
        //check if item is present or no
        for shopcartItem in cart{
            if shopcartItem.name == item.name && shopcartItem.restaurantName == item.restaurantName {
                shopcartItem.totalItems = shopcartItem.totalItems + item.totalItems
                tempDoubleItems = true
                break
            }
        }
        //put in cart if item not present
        if tempDoubleItems == false {
            cart.append(item)
        }
    }
    //function to check whether cart is empty or not
    func cartStatus() -> Bool {
        return cart.isEmpty
    }
    
    //function to reset attributes
    mutating func paid(){
        cart.removeAll()
        totalPrice = 0
    }
    
    //function to print the items in the shopping cart
    mutating func showCart() {
        //sort cart based on their restaurant names
        sortedCart = cart.sorted { $0.restaurantName < $1.restaurantName }
        
        var resNameTemp = ""
        
        for item in cart {
            // if same restaurant no need to print the restaurant name again
            if item.restaurantName != resNameTemp {
                print("Your order from \(item.restaurantName): ")
                resNameTemp = item.restaurantName
            }
            //calculate the price
            totalPrice = totalPrice + (item.price * item.totalItems)
            //print the item
            print("- \(item.name) x \(item.totalItems)")
        }
    }
}

// flow + print menu of the chosen restaurant
func MenuForRestaurant(name: String, foodItem: Array<food>){
    var userInputForFood = ""
    
    //condition for if user want to go back to main screen
    repeat {
        //print food
        print("")
        print("Hi, welcome back to \(name)!")
        print("What would you like to order?")
        var num = 1
        for MenuItems in foodItem {
            print("[\(num)] \(MenuItems.name)")
            num += 1
        }
        print("""
    -
    [B]ack to main Menu?
    Your menu choice?
    """)
        
        //CHOOSINg CHECKER LOGIC
        while true{
            
            userInputForFood = readLine()?.uppercased() ?? " "
            //for shopping cart or quit
            if userInputForFood == "B" {
                break
            }
            //check if number
            if Int(userInputForFood) ?? -1 < foodItem.count+1 && Int(userInputForFood) ?? -1 > 0{
                userInputForFood = String(Int(userInputForFood)!-1)
                break
            }
            
            print("That is not a valid response! Please Try Again.")
        }
        //choosing logic end
        
        let chosenfood = foodItem[Int(userInputForFood) ?? 0]

        //check if input is back or not
        if (userInputForFood != "B"){
            //print food, price and how many you want to buy
            print()
            print("\(chosenfood.name) @ \(chosenfood.price)")
            print("How many \(chosenfood.name) do you want to buy ?")
            var userInputForBuying = " "
            
            //input checker for number or not
            while true {
                userInputForBuying = readLine()?.uppercased() ?? " "
                if Int(userInputForBuying) ?? -1 > 0{
                    break
                }
                print("Please Enter a valid number")
            }
            
            //call function to add to shopping cart
            Carts.addToCart(item: ShoppingCartItem(name: chosenfood.name, price: chosenfood.price, totalItems: Int(userInputForBuying) ?? 0, resName: name))
            print("Thank You for Ordering")
            print("")
        }
        
    } while (userInputForFood != "B")
    //checker if input is b or not
}


//function to pay
func pay(total_price: Int){
    
    print("")
    print("Your total order: \(total_price)")
    print("Enter the amount of your money: ")

    var your_money = " "

    //input checker logic
    while true {
        your_money = readLine() ?? " "
        //check if bigger than pice
        if Int(your_money) ?? -1 >= total_price{
            break
        } else {
            print("Payment not enough, Please enter a valid amount")
        }
    }

    print("You pay \(your_money)  Change:\(Int(your_money)! - total_price)")
    print("Enjoy your meals!")

    //clear shopping cart after
    Carts.paid()

    var returnBool = "A"

    while true{
//      go back
        print("Press [return] to go back to main screen")
        returnBool = readLine() ?? "A"
        if returnBool == "" {
            break
        }
    }
}
