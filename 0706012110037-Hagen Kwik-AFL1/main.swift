//
//  main.swift
//  0706012110037-Hagen Kwik-AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

let tukutuku: KeyValuePairs<String, Int> = ["Rawon": 20000, "Sate": 15000, "Nasi Goreng": 10000, "Jus Jeruk": 5000]
let gotri: KeyValuePairs<String, Int>  = ["Tahu Telor": 17000, "Soto": 12000, "Nasi Bakar": 10000, "Air Mineral": 2000]
let madamlie: KeyValuePairs<String, Int>  = ["Dadar Jagung": 8000, "Kikil": 30000, "Lemper": 10000, "Kopi Tubruk": 7000]
let kopte: KeyValuePairs<String, Int>  = ["Tempe": 6000, "Nasi Padang": 50000, "Nasi Limau": 100000, "Jahe": 12000]



var shops : KeyValuePairs<String, KeyValuePairs<String, Int> > = ["Tuku-Tuku": tukutuku, "Gotri": gotri, "Madam Lie": madamlie, "Kopte": kopte]

var carts : Dictionary<String, Array< Dictionary<String, Any> > > = [:]


var userInput:String = " "

repeat{
    print("Welcome to UC Walk Cafeteria 🧑‍🍳👩‍🍳")
    print("""
    Please choose a cafeteria:
    [1] Tuku-Tuku
    [2] Gotri
    [3] Madam Lie
    [4] Kopte
    -
    [S]hopping Cart
    [Q]uit
    Your cafeteria choice?
    """)
    
    //Logic for choosing
    while(true){
        userInput = readLine()?.uppercased() ?? " "
        //for shopping cart or quit
        if userInput == "S" || userInput == "Q" {
            break
        }
        //check if number
        if Int(userInput) ?? -1 > 0 && Int(userInput) ?? -1 < shops.count + 1{
            //user input -1 because index start from 0
            userInput = String(Int(userInput)!-1)
            break
        }
        print("That is not a valid response! Please Try Again.")
    }
    
    switch(userInput){
        //quit
    case "Q":
        break
        //shopping cart
    case "S":   
        var total_price = 0
        
        
        if carts.isEmpty {
            print("")
            print("Your Cart is empty")
            print("")
        } else {
            
            //calculate price & print in cart
            for itemsInCart in carts {
                print("Your order from \(itemsInCart.key): ")
    
                for itemsInsideEachShop in itemsInCart.value {
                    var price: Int = itemsInsideEachShop["Price"] as! Int
                    var qty: Int  = itemsInsideEachShop["Quantity"] as! Int
                    total_price = total_price + (price * qty)
                    
                    print("- \(itemsInsideEachShop["Name"] ?? "") x \(itemsInsideEachShop["Quantity"] ?? "")")
                }
            }
            
            
            //print cart
            print("""
            Press [B] to go back
            Press [P] to pay / checkout
            Your choice?
            """)
            
            var userPay = " "
               
            while(true){
                userPay = readLine()?.uppercased() ?? " "
                //for shopping cart or quit
                if userPay == "B" || userPay == "P" {
                    break
                }
                print("That is not a valid response! Please Try Again.")
            }
            if(userPay == "B"){
                break
            } else{
                pay(total_price: total_price)
                break
            }
        }
            	
    default:
        printFoods(shops: shops, userInput: Int(userInput)!)
    }
    
} while(userInput != "Q")


