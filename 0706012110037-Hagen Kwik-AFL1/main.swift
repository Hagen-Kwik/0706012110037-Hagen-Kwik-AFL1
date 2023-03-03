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



var shops : Array<KeyValuePairs<String, Int>> = Array()
shops.append(tukutuku)
shops.append(gotri)
shops.append(madamlie)
shops.append(kopte)

var shopnames: Array<String> = ["Tuku-Tuku","Gotri", "Madam Lie", "Kopte"]

var cart : Array<KeyValuePairs<String, Int>> = Array()

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
        if Int(userInput) ?? -1 > 0 && Int(userInput) ?? -1 > 0{
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
        
        if cart.count == 0  {
            print("")
            print("Your Cart is empty")
            print("")
        } else {
            //print cart
            print("""
            Press [B] to go back
            Press [P] to pay / checkout
            Your choice?
            """)
            
            //calculate price
            for itemsInCart in cart {
                var tempSHOP = shops[itemsInCart["resNameIndex"]]
                total_price = tempSHOP[itemsInCart["food"]].value * itemsInCart["totalItems"]
            }
            
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
        printFoods(Menu: shops[Int(userInput)!], shopNameIndex: Int(userInput)!, shopName: shopnames[Int(userInput)!])
    }
    
} while(userInput != "Q")
