//
//  restaurant.swift
//  0706012110037-Hagen Kwik-AFL1
//
//  Created by MacBook Pro on 01/03/23.
//

import Foundation


func printFoods(shops: KeyValuePairs<String, KeyValuePairs<String, Int> >, userInput: Int){
    var userInputForFood = " "
    
    print("Hi, welcome back to \(shops[userInput].key)!")
    print("What would you like to order?")
    
    while true{
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
        
    //CHOOSINF CHECKER LOGIC
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
    
    switch(userInputForFood){
        case "B":
            break
        default:
        
            print(shops[userInput].value[Int(userInputForFood)!].key + " @ \( shops[userInput].value[Int(userInputForFood)!].value )")
        
            print("How many \(shops[userInput].value[Int(userInputForFood)!].key) do you want to buy ?")
            
            var userInputForBuying = " "

            while true {
                userInputForBuying = readLine()?.uppercased() ?? " "
                if Int(userInputForBuying) ?? -1 > 0{
                    break
                }
                print("Please Enter a valid number")
            }
        
    addFoodtoCart(name: shops[userInput].value[Int(userInputForFood)!].key, price: shops[userInput].value[Int(userInputForFood)!].value , quantity: Int(userInputForBuying)!, StoreName: shops[userInput].key )

            print("Thank You for Ordering")
        }
    
    break
    }
}

func addFoodtoCart(name: String, price: Int, quantity: Int, StoreName: String) {
    var temp: [String: Any] = ["Name": name, "Price": price, "Quantity": quantity]
    
    //check if restaurant is present
    if carts[StoreName] != nil {
        //check so no double food if no double input new
        if !checkdoublePay(StoreName: StoreName, name: name, quantity: quantity) {
            carts[StoreName]!.append(temp)
        }
    } else {
        var TempArray = [Dictionary<String, Any>] ()

        carts[StoreName] = TempArray
        carts[StoreName]!.append(temp)

    }
    print(carts)
}

func checkdoublePay(StoreName: String, name: String, quantity: Int) -> Bool {
    var numTEMP = 0
    
    for items in carts[StoreName]! {
        if items["Name"] as! String == name {
            carts[StoreName]![numTEMP]["Quantity"] = items["Quantity"] as! Int + quantity
            return true
        }
        numTEMP += 1
    }
    
    return false
}
    
//    carts[StoreName]!.append(temp)
//}


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
    
//    carts["Tuku-Tuku"].removeAll()
    
    var returnBool = "A"

    while true{
        print("Press [return] to go back to main screen")
        returnBool = readLine() ?? "A"
        if returnBool == "" {
            break
        }
    }
}
