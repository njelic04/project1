//
//  RouletteCalculator.swift
//  RouletteApplication
//
//  Created by imac21 on 9/2/16.
//  Copyright © 2016 imac21. All rights reserved.
//

import Foundation

final class RouletteCalculator {
    
    class var Engine: RouletteCalculator {
        struct singleton {
            static let instance = RouletteCalculator()
        }
        return singleton.instance
    }
    
    //var chipValue = 1
    var money = 0.0
    
    struct BetItem {
        var type: BetTypes
        var amount: Double
        var num: Int?
    }
    
    let rouletteBar = [0,32,15,19, 4, 21,2,25,17,34,6,27,13,36,11,30,8,23, 10,5,24,16,33,1,20,14,31,9,22,18,29,12,35,3,26]
    var currentBets = [BetItem]()
    
    enum Coeficient: Int {
        case none = 0
        case number = 36
        case twoInterval = 2
        case threeInterval = 3
    }
    
    enum BetTypes {
        case none
        case number
        case red
        case black
        case even
        case odd
        case part1to12
        case part13to24
        case part25to36
        case part1to18
        case part19to36
        case firstColumn
        case secondColumn
        case thirdColumn
        case voisinsDuZero
        case jeuZero
        case tierDuCylindre
        case orphelins
        case neighbours
        
    }
    
    func bet(type betType: BetTypes, bet amountOfBet: Double, target number: Int) {
        print("Bet")
        currentBets.append(BetItem(type: betType, amount: amountOfBet, num: number))
        print("count current bets: \(currentBets.count)")
    }
    
    func calculateWin(winNumber number:Int) -> Double {
        print("CALC")
        print("income number:\(number)")
        print("current bets: \(currentBets.count)")
        var final = 0.0
        for test in currentBets {
            print("Amount: \(test.amount), type: \(test.type), number:\(test.num)")
        }
        for current in currentBets {
            switch current.type {
            case BetTypes.number:
                final +=  current.num == number ? Double(Coeficient.number.rawValue) * current.amount : 0.0
            case BetTypes.neighbours:
                if let index = rouletteBar.indexOf(current.num!) {
                    // Check 4 edge cases first
                    if index == 0 {
                        if number == rouletteBar[rouletteBar.count] || number == rouletteBar[rouletteBar.count-1] || number == rouletteBar[index+1] || number == rouletteBar[index+2] {
                            final += current.amount/4 * Double(Coeficient.number.rawValue)
                        }
                    }
                    else if index == 1 {
                        if number == rouletteBar[index-1] || number == rouletteBar[rouletteBar.count] || number == rouletteBar[index+1] || number == rouletteBar[index+2] {
                            final += current.amount/4 * Double(Coeficient.number.rawValue)
                        }
                    }
                    else if index == rouletteBar.count-1 {
                        if number == rouletteBar[index-2] || number == rouletteBar[index-1] || number == rouletteBar[index+1] || number == rouletteBar[0] {
                            final += current.amount/4 * Double(Coeficient.number.rawValue)
                        }
                    }
                    else if index == rouletteBar.count {
                        if number == rouletteBar[index-2] || number == rouletteBar[index-1] || number == rouletteBar[0] || number == rouletteBar[1] {
                            final += current.amount/4 * Double(Coeficient.number.rawValue)
                        }
                    }
                    else if index > 1 && index < rouletteBar.count-1 {
                        if number == rouletteBar[index-2] || number == rouletteBar[index-1] || number == rouletteBar[index+1] || number == rouletteBar[index+2] {
                            final += current.amount/4 * Double(Coeficient.number.rawValue)
                        }
                    }
                    else {
                        final += 0.0
                    }
                }
                
            
            case BetTypes.red, BetTypes.black, BetTypes.even, BetTypes.odd, BetTypes.part1to18, BetTypes.part19to36:
                if BetTypes.isIn(current.type, number: number) {
                    final += current.amount * Double(Coeficient.twoInterval.rawValue)
                }
            case BetTypes.part1to12, BetTypes.part13to24, BetTypes.part25to36, BetTypes.firstColumn, BetTypes.secondColumn, BetTypes.thirdColumn:
                if BetTypes.isIn(current.type, number: number) {
                    final += current.amount * Double(Coeficient.threeInterval.rawValue)
                }
            case BetTypes.voisinsDuZero:
                if BetTypes.isIn(current.type, number: number) {
                    if [0,2,3].contains(number) {
                        final += current.amount*2/27 * Double(Coeficient.number.rawValue)
                    }
                    else {
                        final += current.amount/18 * Double(Coeficient.number.rawValue)
                    }
                }
            case BetTypes.jeuZero:
                if BetTypes.isIn(current.type, number: number) {
                    final += current.amount/8 * Double(Coeficient.number.rawValue)
                }
                
            case BetTypes.tierDuCylindre:
                if BetTypes.isIn(current.type, number: number) {
                    final += current.amount/12 * Double(Coeficient.number.rawValue)
                }
            case BetTypes.orphelins:
                if BetTypes.isIn(current.type, number: number) {
                    if number == 1 {
                        final += current.amount/5 * Double(Coeficient.number.rawValue)
                    }
                    else {
                        final += current.amount/10 * Double(Coeficient.number.rawValue)
                    }
                }
            default:
                final += 0.0
            }
            
        
        }
        
        currentBets.removeAll()
        return final
    }
    
    func RouletteReset() {
        currentBets.removeAll()
        print("resetovao se rulet")
    }
    
}

extension RouletteCalculator.BetTypes {
    static func isIn(betType: RouletteCalculator.BetTypes, number: Int) -> Bool {
        if betType == red{
            return [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36].contains(number)
        }
        if betType == black{
            return [2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35].contains(number)
        }
        if betType == even{
            return [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36].contains(number)
        }
        if betType == odd{
            return [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35].contains(number)
        }
        if betType == part1to12 {
            return [1,2,3,4,5,6,7,8,9,10,11,12].contains(number)
        }
        if betType == part13to24 {
            return [13,14,15,16,17,18,19,20,21,22,23,24].contains(number)
        }
        if betType == part25to36 {
            return [25,26,27,28,29,30,31,32,33,34,35,36].contains(number)
        }
        if betType == part1to18 {
            return [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18].contains(number)
        }
        if betType == part19to36 {
            return [19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36].contains(number)
        }
        if betType == firstColumn {
            return [1,4,7,10,13,16,19,22,25,28,31,34].contains(number)
        }
        if betType == secondColumn {
            return [2,5,8,11,14,17,20,23,26,29,32,35].contains(number)
        }
        if betType == thirdColumn {
            return [3,6,9,12,15,18,21,24,27,30,33,36].contains(number)
        }
        if betType == voisinsDuZero {
            return [22,18,29,7,28,12,35,3,26,0,32,15,19,4,21,2,25].contains(number)
        }
        if betType == jeuZero {
            return [15,35,3,26,0,32,15].contains(number)
        }
        if betType == tierDuCylindre {
            return [27,13,36,11,30,8,23,10,5,24,16,33].contains(number)
        }
        if betType == orphelins {
            return [17,34,6,1,20,14,31,9].contains(number)
        }
        
        return false
    }

    

}