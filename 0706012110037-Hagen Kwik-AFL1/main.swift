//
//  main.swift
//  0706012110037-Hagen Kwik-AFL1
//
//  Created by MacBook Pro on 03/03/23.
//


import Foundation

// create restaurant struct and input food
var Kopte = Restaurant(name: "Kopte")
Kopte.addFood(food: food(name: "Rawon", price: 20_000))
Kopte.addFood(food: food(name: "Nasi Goreng", price: 10_000))
Kopte.addFood(food: food(name: "Sate", price: 15_000))
Kopte.addFood(food: food(name: "Soto", price: 5_000))

var MadamLie = Restaurant(name: "Madam Lie")
MadamLie.addFood(food: food(name: "Jus Jeruk", price: 12_000))
MadamLie.addFood(food: food(name: "Tahu Telor", price: 17_000))
MadamLie.addFood(food: food(name: "Nasi Bakar", price: 10_000))
MadamLie.addFood(food: food(name: "Air Mineral", price: 7_000))

var Gotri = Restaurant(name: "Gotri")
Gotri.addFood(food: food(name: "Kopi Tubruk", price: 7_000))
Gotri.addFood(food: food(name: "Lemper", price: 10_000))
Gotri.addFood(food: food(name: "Nasi Limau", price: 7_000))
Gotri.addFood(food: food(name: "Dadar Jagung", price: 7_000))

var TukuTuku = Restaurant(name: "Tuku Tuku")
TukuTuku.addFood(food: food(name: "Tempe", price: 6_000))
TukuTuku.addFood(food: food(name: "Nasi Padang", price: 50_000))
TukuTuku.addFood(food: food(name: "Jahe", price: 12_000))
TukuTuku.addFood(food: food(name: "Gado", price: 23_000))


// put all restaurant in 1 array
var shops = [Kopte, MadamLie, Gotri, TukuTuku]

//initiate shopping cart struct
var Carts = Cart(cart: [])

//initiate fur user input
var userInput:String = " "

//give do while
repeat{
    // print starting point
    print("Welcome to UC Walk Cafeteria 🧑‍🍳👩‍🍳")
    print("""
    Please choose a cafeteria:
    """)
    var numForPrinting = 1
    for res in shops {
        print("""
    [\(numForPrinting)] \(res.name)
    """)
        numForPrinting += 1
    }
    print("""
    
    -
    [S]hopping Cart
    [Q]uit
    Your cafeteria choice?
    """)
    
    //Logic for choosing
    while(true){
        //input is uppercased
        userInput = readLine()?.uppercased() ?? " "
        //for shopping cart or quit
        if userInput == "S" || userInput == "Q" {
            break
        }
        //check if number and its limimt constraints
        if Int(userInput) ?? -1 > 0 && Int(userInput) ?? -1 < shops.count + 1{
            //user input -1 because index start from 0
            userInput = String(Int(userInput)!-1)
            break
        }
        print("That is not a valid response! Please Try Again.")
    }
    //logic for choosing end
    
    //switch case for user input
    switch(userInput){
        //quit
    case "Q":
        break
        //shopping cart
    case "S":
        //initiate total price for counting later
        
        //check if cart is empty
        if Carts.cartStatus() {
            print("")
            print("Your Cart is empty")
            print("")
        } else {
            Carts.showCart()
        }
            
        //print cart choices
        print("""
        
        Press [B] to go back
        Press [P] to pay / checkout
        Your choice?
        """)
            
        var userPay = " "
            
        //logic for checker either back or pay
        while(true){
            userPay = readLine()?.uppercased() ?? " "
            //for shopping cart or back
            if userPay == "B" || userPay == "P" {
                break
            }
            print("That is not a valid response! Please Try Again.")
        }
        // logic end
        
        //switch for buy or pay
        if(userPay == "B"){
            break
        } else{
            //call pay function
            pay(total_price: Carts.totalPrice)
            break
        }
                
    default:
        //else print each menu of restaurant
        MenuForRestaurant(name: shops[Int(userInput) ?? 0].name, foodItem: shops[Int(userInput) ?? 0].food)
    }
    
} while(userInput != "Q")
//conditional for Q for quit

