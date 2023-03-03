//
//  restaurant.swift
//  0706012110037-Hagen Kwik-AFL1
//
//  Created by MacBook Pro on 01/03/23.
//

import Foundation


func printFoods(Menu: KeyValuePairs<String, Int>, shopNameIndex: Int, shopName: String){
    var userInputForFood = " "
    
    print("Hi, welcome back to \(shopName)!")
    print("What would you like to order?")
    
    while true{
        var num = 1
        for MenuItems in Menu{
            print("[\(num)] \(MenuItems.key)")
            num += 1
        }
        print("""
    -
    [B]ack to main Menu?
    Your menu choice?
    """)
        
    //CHOOSINF CHECKER LOGIC
    while true{
        userInputForFood = readLine()?.uppercased() ?? " "
        //for shopping cart or quit
        if userInputForFood == "B" {
            break
        }
        //check if number
        if Int(userInputForFood) ?? -1 < Menu.count+1 && Int(userInputForFood) ?? -1 > 0{
            userInputForFood = String(Int(userInputForFood)!-1)
            break
        }
        
        print("That is not a valid response! Please Try Again.")
    }
    
    switch(userInputForFood){
        case "B":
            break
        default:
            print(Menu[Int(userInputForFood)!].key + "@ \(Menu[Int(userInputForFood)!].value)")
        
            print("How many \(Menu[Int(userInputForFood)!].key) do you want to buy ?")
            
            var userInputForBuying = " "

            while true {
                userInputForBuying = readLine()?.uppercased() ?? " "
                if Int(userInputForBuying) ?? -1 > 0{
                    break
                }
                print("Please Enter a valid number")
            }
        
            addFoodtoCart(resNameIndex: shopNameIndex, food: Int(userInputForFood)!, totalItems: Int(userInputForBuying)!)

            print("Thank You for Ordering")
        }
    
    break
    }
}

func addFoodtoCart(resNameIndex: Int, food: Int, totalItems: Int) {
    var temp: Dictionary<String, Int> = ["resNameIndex": resNameIndex, "food": food, "totalItems": totalItems]
    cart.append(temp)
}


func pay(total_price: Int){
    print("Your total order: \(total_price)")
    print("Enter the amount of your money: ")
    
    var your_money = " "
    
    while true {
        your_money = readLine() ?? " "
        //bigger than 0 and is bigger than pice
        if Int(your_money) ?? -1 > 0 && Int(your_money) ?? -1 >= total_price{
            break
        } else {
            print("Payment not enough")
        }
        
        if Int(your_money) ?? -1 == -1 || Int(your_money) ?? -1 == 0{
            print("Please enter a valid amount")
        }
    }
    
    print("You pay \(your_money)  Change:\(Int(your_money)! - total_price)")
    print("Enjoy your meals!")
    
    cart.removeAll()
    
    var returnBool = "A"

    while true{
        print("Press [return] to go back to main screen")
        returnBool = readLine() ?? "A"
        if returnBool == "" {
            break
        }
    }
}
