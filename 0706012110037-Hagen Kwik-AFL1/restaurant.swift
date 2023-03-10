//
//  restaurant.swift
//  0706012110037-Hagen Kwik-AFL1
//
//  Created by MacBook Pro on 01/03/23.
//

import Foundation

// print menu or each restaurant func
func printFoods(shops: KeyValuePairs<String, KeyValuePairs<String, Int> >, userInput: Int){
    var userInputForFood = " "
    
    //condition for if user want to go back to main screen
    repeat {
        //print food
        print("Hi, welcome back to \(shops[userInput].key)!")
        print("What would you like to order?")
        var num = 1
        for MenuItems in shops[userInput].value {
            print("[\(num)] \(MenuItems.key)")
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
            if Int(userInputForFood) ?? -1 < shops[userInput].value.count+1 && Int(userInputForFood) ?? -1 > 0{
                userInputForFood = String(Int(userInputForFood)!-1)
                break
            }
            
            print("That is not a valid response! Please Try Again.")
        }
//        choosing logic end
        
        //check if input is back or not
        if (userInputForFood != "B"){
            //print food, price and how many you want to buy
            print(shops[userInput].value[Int(userInputForFood)!].key + " @ \( shops[userInput].value[Int(userInputForFood)!].value )")
            print("How many \(shops[userInput].value[Int(userInputForFood)!].key) do you want to buy ?")
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
            addFoodtoCart(name: shops[userInput].value[Int(userInputForFood)!].key, price: shops[userInput].value[Int(userInputForFood)!].value , quantity: Int(userInputForBuying)!, StoreName: shops[userInput].key )
            
            print("Thank You for Ordering")
            print("")
        }
        
    } while (userInputForFood != "B")
    //checker if input is b or not
}

// function add to call
func addFoodtoCart(name: String, price: Int, quantity: Int, StoreName: String) {
    //intitialize dictionary/keyvalue pair to be put in shopping cart
    let temp: [String: Any] = ["Name": name, "Price": price, "Quantity": quantity]
    
    //check if restaurant is present
    if carts[StoreName] != nil {
        //check so no double food, call func
        if !checkdoublePay(StoreName: StoreName, name: name, quantity: quantity) {
            //if no double then push
            carts[StoreName]!.append(temp)
        }
    } else {
        //if no food at all from the restaurant, create array first to be put in the shopping cart then input the food
        //reason to create array first is because the shopping cart is an empty dictionary
        let TempArray = [Dictionary<String, Any>] ()

        carts[StoreName] = TempArray
        carts[StoreName]!.append(temp)

    }
}

//func to check if food is present in shopping cart
func checkdoublePay(StoreName: String, name: String, quantity: Int) -> Bool {
    var numTEMP = 0
    
    //logic for checking if food is present in shopping cart
    for items in carts[StoreName]! {
        if items["Name"] as! String == name {
            carts[StoreName]![numTEMP]["Quantity"] = items["Quantity"] as! Int + quantity
            return true
        }
        numTEMP += 1
    }
    
    return false
}
//function to pay
func pay(total_price: Int){
    
    print("Your total order: \(total_price)")
    print("Enter the amount of your money: ")
    
    var your_money = " "
    
    //input checker logic
    while true {
        your_money = readLine() ?? " "
        //bigger than 0 and is bigger than pice
        if Int(your_money) ?? -1 > 0 && Int(your_money) ?? -1 >= total_price{
            break
        } else {
            print("Payment not enough")
        }
        
        //chcek if number
        if Int(your_money) ?? -1 == -1 || Int(your_money) ?? -1 == 0{
            print("Please enter a valid amount")
        }
    }
    
    print("You pay \(your_money)  Change:\(Int(your_money)! - total_price)")
    print("Enjoy your meals!")
    
    //clear shopping cart after
    carts = [:]
    
    var returnBool = "A"
    
    while true{
//        go back
        print("Press [return] to go back to main screen")
        returnBool = readLine() ?? "A"
        if returnBool == "" {
            break
        }
    }
}
