//
//  RouletteBoardControl.swift
//  RouletteApplication
//
//  Created by imac21 on 8/28/16.
//  Copyright © 2016 imac21. All rights reserved.
//

import UIKit


class RouletteBoardControl: UIView {
    
    // MARK: Properties
    
    let yellow = UIColor(red: 255, green: 255, blue: 0, alpha: 1)
    let width = 150/5
    let height = 400/14
    var boardButtons = [String : UIButton]() // board buttons
    var boardValues = [String : Double]() //value of bets on each number
    var chip = 1
    var money = 0.0
    var allowedBet = false
    
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        RouletteCalculator.Engine.RouletteReset()
        initRouletteBoard()
        
    }
    
    func initRouletteBoard() {
        
        RouletteCalculator.Engine.RouletteReset()
        
        let boardButtonZero = UIButton(frame: CGRect( x:2*width, y: 0, width: 3*width, height: height))
        print(" width \(width), height \(height)")
        //boardButtonZero.layer.borderColor = yellow.CGColor
        //boardButtonZero.layer.borderWidth = 1
        boardButtonZero.addTarget(self, action: #selector(RouletteBoardControl.boardButtonZeroTapped(_ :)), forControlEvents: .TouchDown)
        let zeroImage = UIImage(named:"number0")
        boardButtonZero.setBackgroundImage(zeroImage, forState: .Normal)
        boardButtons["Zero"] = boardButtonZero
        boardValues["Zero"] = 0.0
        addSubview(boardButtonZero)
        
        
        let boardButton118 = UIButton(frame: CGRect(x:0, y:height, width: width, height: 2*height))
        boardButton118.layer.borderColor = yellow.CGColor
        boardButton118.layer.borderWidth = 1
        boardButton118.addTarget(self, action: #selector(RouletteBoardControl.boardButton118Tapped(_:)), forControlEvents: .TouchDown)
        let image118 = UIImage(named:"image118")
        boardButton118.setBackgroundImage(image118, forState: .Normal)
        boardButtons["118"] = boardButton118
        boardValues["118"] = 0.0
        addSubview(boardButton118)
        
        let boardButton112 = UIButton(frame: CGRect( x: width, y: height, width: width, height: 4*height))
        boardButton112.layer.borderColor = yellow.CGColor
        boardButton112.layer.borderWidth = 1
        boardButton112.addTarget(self, action: #selector( RouletteBoardControl.boardButton112Tapped(_:)), forControlEvents: .TouchDown)
        let image112 = UIImage(named:"image112")
        boardButton112.setBackgroundImage(image112, forState: .Normal)
        boardButtons["112"] = boardButton112
        boardValues["112"] = 0.0
        addSubview(boardButton112)
        
        let boardButton1 = UIButton( frame: CGRect( x: 2*width, y: height, width: width, height: height))
        boardButton1.layer.borderColor = yellow.CGColor
        boardButton1.layer.borderWidth = 1
        boardButton1.addTarget(self, action: #selector( RouletteBoardControl.boardButton1Tapped(_:)), forControlEvents: .TouchDown)
        let number1 = UIImage(named:"number1")
        boardButton1.setBackgroundImage(number1, forState: .Normal)
        boardButtons["1"] = boardButton1
        boardValues["1"] = 0.0
        addSubview(boardButton1)
        
        let boardButton2 = UIButton( frame: CGRect(x: 3*width, y: height, width: width, height: height))
        boardButton2.layer.borderColor = yellow.CGColor
        boardButton2.layer.borderWidth = 1
        boardButton2.addTarget(self, action: #selector(RouletteBoardControl.boardButton2Tapped(_:)), forControlEvents: .TouchDown)
        let number2 = UIImage(named:"number2")
        boardButton2.setBackgroundImage(number2, forState: .Normal)
        boardButtons["2"] = boardButton2
        boardValues["2"] = 0.0
        addSubview(boardButton2)
        
        
        let boardButton3 = UIButton( frame: CGRect(x: 4*width, y: height, width: width, height: height))
        boardButton3.layer.borderColor = yellow.CGColor
        boardButton3.layer.borderWidth = 1
        boardButton3.addTarget(self, action: #selector( RouletteBoardControl.boardButton3Tapped(_:)), forControlEvents: .TouchDown)
        let number3 = UIImage(named:"number3")
        boardButton3.setBackgroundImage(number3, forState: .Normal)
        boardButtons["3"] = boardButton3
        boardValues["3"] = 0.0
        addSubview(boardButton3)
        
        
        let boardButton4 = UIButton( frame: CGRect(x: 2*width, y: 2*height, width: width, height: height))
        boardButton4.layer.borderColor = yellow.CGColor
        boardButton4.layer.borderWidth = 1
        boardButton4.addTarget(self, action: #selector( RouletteBoardControl.boardButton4Tapped(_:)), forControlEvents: .TouchDown)
        let number4 = UIImage(named:"number4")
        boardButton4.setBackgroundImage(number4, forState: .Normal)
        boardButtons["4"] = boardButton4
        boardValues["4"] = 0.0
        addSubview(boardButton4)
        
        let boardButton5 = UIButton( frame: CGRect( x: 3*width, y: 2*height, width: width, height: height))
        boardButton5.layer.borderColor = yellow.CGColor
        boardButton5.layer.borderWidth = 1
        boardButton5.addTarget(self, action: #selector( RouletteBoardControl.boardButton5Tapped(_:)), forControlEvents: .TouchDown)
        let number5 = UIImage(named:"number5")
        boardButton5.setBackgroundImage(number5, forState: .Normal)
        boardButtons["5"] = boardButton5
        boardValues["5"] = 0.0
        addSubview(boardButton5)
        
        let boardButton6 = UIButton( frame: CGRect(x: 4*width, y: 2*height, width: width, height: height))
        boardButton6.layer.borderColor = yellow.CGColor
        boardButton6.layer.borderWidth = 1
        boardButton6.addTarget(self, action: #selector(RouletteBoardControl.boardButton6Tapped(_:)), forControlEvents: .TouchDown)
        let number6 = UIImage(named:"number6")
        boardButton6.setBackgroundImage(number6, forState: .Normal)
        boardButtons["6"] = boardButton6
        boardValues["6"] = 0.0
        addSubview(boardButton6)
        
        
        let boardButtonEven = UIButton(frame: CGRect(x:0, y:3*height, width: width, height: 2*height))
        boardButtonEven.layer.borderColor = yellow.CGColor
        boardButtonEven.layer.borderWidth = 1
        boardButtonEven.addTarget(self, action: #selector(RouletteBoardControl.boardButtonEvenTapped(_:)), forControlEvents: .TouchDown)
        let even = UIImage(named:"even")
        boardButtonEven.setBackgroundImage(even, forState: .Normal)
        boardButtons["Even"] = boardButtonEven
        boardValues["Even"] = 0.0
        addSubview(boardButtonEven)
        
        let boardButton7 = UIButton( frame: CGRect( x: 2*width, y: 3*height, width: width, height: height))
        boardButton7.layer.borderColor = yellow.CGColor
        boardButton7.layer.borderWidth = 1
        boardButton7.addTarget(self, action: #selector( RouletteBoardControl.boardButton7Tapped(_:)), forControlEvents: .TouchDown)
        let number7 = UIImage(named:"number7")
        boardButton7.setBackgroundImage(number7, forState: .Normal)
        boardButtons["7"] = boardButton7
        boardValues["7"] = 0.0
        addSubview(boardButton7)
        
        let boardButton8 = UIButton( frame: CGRect(x: 3*width, y: 3*height, width: width, height: height))
        boardButton8.layer.borderColor = yellow.CGColor
        boardButton8.layer.borderWidth = 1
        boardButton8.addTarget(self, action: #selector(RouletteBoardControl.boardButton8Tapped(_:)), forControlEvents: .TouchDown)
        let number8 = UIImage(named:"number8")
        boardButton8.setBackgroundImage(number8, forState: .Normal)
        boardButtons["8"] = boardButton8
        boardValues["8"] = 0.0
        addSubview(boardButton8)
        
        let boardButton9 = UIButton( frame: CGRect(x: 4*width, y: 3*height, width: width, height: height))
        boardButton9.layer.borderColor = yellow.CGColor
        boardButton9.layer.borderWidth = 1
        boardButton9.addTarget(self, action: #selector( RouletteBoardControl.boardButton9Tapped(_:)), forControlEvents: .TouchDown)
        let number9 = UIImage(named:"number9")
        boardButton9.setBackgroundImage(number9, forState: .Normal)
        boardButtons["9"] = boardButton9
        boardValues["9"] = 0.0
        addSubview(boardButton9)
        
        
        let boardButton10 = UIButton( frame: CGRect(x: 2*width, y: 4*height, width: width, height: height))
        boardButton10.layer.borderColor = yellow.CGColor
        boardButton10.layer.borderWidth = 1
        boardButton10.addTarget(self, action: #selector( RouletteBoardControl.boardButton10Tapped(_:)), forControlEvents: .TouchDown)
        let number10 = UIImage(named:"number10")
        boardButton10.setBackgroundImage(number10, forState: .Normal)
        boardButtons["10"] = boardButton10
        boardValues["10"] = 0.0
        addSubview(boardButton10)
        
        
        let boardButton11 = UIButton( frame: CGRect( x: 3*width, y: 4*height, width: width, height: height))
        boardButton11.layer.borderColor = yellow.CGColor
        boardButton11.layer.borderWidth = 1
        boardButton11.addTarget(self, action: #selector( RouletteBoardControl.boardButton11Tapped(_:)), forControlEvents: .TouchDown)
        let number11 = UIImage(named:"number11")
        boardButton11.setBackgroundImage(number11, forState: .Normal)
        boardButtons["11"] = boardButton11
        boardValues["11"] = 0.0
        addSubview(boardButton11)
        
        let boardButton12 = UIButton( frame: CGRect(x: 4*width, y: 4*height, width: width, height: height))
        boardButton12.layer.borderColor = yellow.CGColor
        boardButton12.layer.borderWidth = 1
        boardButton12.addTarget(self, action: #selector(RouletteBoardControl.boardButton12Tapped(_:)), forControlEvents: .TouchDown)
        let number12 = UIImage(named:"number12")
        boardButton12.setBackgroundImage(number12, forState: .Normal)
        boardButtons["12"] = boardButton12
        boardValues["12"] = 0.0
        addSubview(boardButton12)
        
        //novi ciklus
        
        let boardButtonRed = UIButton(frame: CGRect(x:0, y:5*height, width: width, height: 2*height))
        boardButtonRed.layer.borderColor = yellow.CGColor
        boardButtonRed.layer.borderWidth = 1
        boardButtonRed.addTarget(self, action: #selector(RouletteBoardControl.boardButtonRedTapped(_:)), forControlEvents: .TouchDown)
        let red = UIImage(named:"red")
        boardButtonRed.setBackgroundImage(red, forState: .Normal)
        boardButtons["Red"] = boardButtonRed
        boardValues["Red"] = 0.0
        addSubview(boardButtonRed)
        
        let boardButton1324 = UIButton(frame: CGRect( x: width, y: 5*height, width: width, height: 4*height))
        boardButton1324.layer.borderColor = yellow.CGColor
        boardButton1324.layer.borderWidth = 1
        boardButton1324.addTarget(self, action: #selector( RouletteBoardControl.boardButton1324Tapped(_:)), forControlEvents: .TouchDown)
        let image1324 = UIImage(named:"image1324")
        boardButton1324.setBackgroundImage(image1324, forState: .Normal)
        boardButtons["1324"] = boardButton1324
        boardValues["1234"] = 0.0
        addSubview(boardButton1324)
        
        let boardButton13 = UIButton( frame: CGRect( x: 2*width, y: 5*height, width: width, height: height))
        boardButton13.layer.borderColor = yellow.CGColor
        boardButton13.layer.borderWidth = 1
        boardButton13.addTarget(self, action: #selector( RouletteBoardControl.boardButton13Tapped(_:)), forControlEvents: .TouchDown)
        let number13 = UIImage(named:"number13")
        boardButton13.setBackgroundImage(number13, forState: .Normal)
        boardButtons["13"] = boardButton13
        boardValues["13"] = 0.0
        addSubview(boardButton13)
        
        let boardButton14 = UIButton( frame: CGRect(x: 3*width, y: 5*height, width: width, height: height))
        boardButton14.layer.borderColor = yellow.CGColor
        boardButton14.layer.borderWidth = 1
        boardButton14.addTarget(self, action: #selector(RouletteBoardControl.boardButton14Tapped(_:)), forControlEvents: .TouchDown)
        let number14 = UIImage(named:"number14")
        boardButton14.setBackgroundImage(number14, forState: .Normal)
        boardButtons["14"] = boardButton14
        boardValues["14"] = 0.0
        addSubview(boardButton14)
        
        let boardButton15 = UIButton( frame: CGRect(x: 4*width, y: 5*height, width: width, height: height))
        boardButton15.layer.borderColor = yellow.CGColor
        boardButton15.layer.borderWidth = 1
        boardButton15.addTarget(self, action: #selector( RouletteBoardControl.boardButton15Tapped(_:)), forControlEvents: .TouchDown)
        let number15 = UIImage(named:"number15")
        boardButton15.setBackgroundImage(number15, forState: .Normal)
        boardButtons["15"] = boardButton15
        boardValues["15"] = 0.0
        addSubview(boardButton15)
        
        
        let boardButton16 = UIButton( frame: CGRect(x: 2*width, y: 6*height, width: width, height: height))
        boardButton16.layer.borderColor = yellow.CGColor
        boardButton16.layer.borderWidth = 1
        boardButton16.addTarget(self, action: #selector( RouletteBoardControl.boardButton16Tapped(_:)), forControlEvents: .TouchDown)
        let number16 = UIImage(named:"number16")
        boardButton16.setBackgroundImage(number16, forState: .Normal)
        boardButtons["16"] = boardButton16
        boardValues["16"] = 0.0
        addSubview(boardButton16)
        
        
        let boardButton17 = UIButton( frame: CGRect( x: 3*width, y: 6*height, width: width, height: height))
        boardButton17.layer.borderColor = yellow.CGColor
        boardButton17.layer.borderWidth = 1
        boardButton17.addTarget(self, action: #selector( RouletteBoardControl.boardButton17Tapped(_:)), forControlEvents: .TouchDown)
        let number17 = UIImage(named:"number17")
        boardButton17.setBackgroundImage(number17, forState: .Normal)
        boardButtons["17"] = boardButton17
        boardValues["17"] = 0.0
        addSubview(boardButton17)
        
        let boardButton18 = UIButton( frame: CGRect(x: 4*width, y: 6*height, width: width, height: height))
        boardButton18.layer.borderColor = yellow.CGColor
        boardButton18.layer.borderWidth = 1
        boardButton18.addTarget(self, action: #selector(RouletteBoardControl.boardButton18Tapped(_:)), forControlEvents: .TouchDown)
        let number18 = UIImage(named:"number18")
        boardButton18.setBackgroundImage(number18, forState: .Normal)
        boardButtons["18"] = boardButton18
        boardValues["18"] = 0.0
        addSubview(boardButton18)
        
        let boardButtonBlack = UIButton(frame: CGRect(x:0, y:7*height, width: width, height: 2*height))
        boardButtonBlack.layer.borderColor = yellow.CGColor
        boardButtonBlack.layer.borderWidth = 1
        boardButtonBlack.addTarget(self, action: #selector(RouletteBoardControl.boardButtonBlackTapped(_:)), forControlEvents: .TouchDown)
        let black = UIImage(named:"black")
        boardButtonBlack.setBackgroundImage(black, forState: .Normal)
        boardButtons["Black"] = boardButtonBlack
        boardValues["Black"] = 0.0
        addSubview(boardButtonBlack)
        
        let boardButton19 = UIButton( frame: CGRect( x: 2*width, y: 7*height, width: width, height: height))
        boardButton19.layer.borderColor = yellow.CGColor
        boardButton19.layer.borderWidth = 1
        boardButton19.addTarget(self, action: #selector( RouletteBoardControl.boardButton19Tapped(_:)), forControlEvents: .TouchDown)
        let number19 = UIImage(named:"number19")
        boardButton19.setBackgroundImage(number19, forState: .Normal)
        boardButtons["19"] = boardButton19
        boardValues["19"] = 0.0
        addSubview(boardButton19)
        
        let boardButton20 = UIButton( frame: CGRect(x: 3*width, y: 7*height, width: width, height: height))
        boardButton20.layer.borderColor = yellow.CGColor
        boardButton20.layer.borderWidth = 1
        boardButton20.addTarget(self, action: #selector(RouletteBoardControl.boardButton20Tapped(_:)), forControlEvents: .TouchDown)
        let number20 = UIImage(named:"number20")
        boardButton20.setBackgroundImage(number20, forState: .Normal)
        boardButtons["20"] = boardButton20
        boardValues["20"] = 0.0
        addSubview(boardButton20)
        
        let boardButton21 = UIButton( frame: CGRect(x: 4*width, y: 7*height, width: width, height: height))
        boardButton21.layer.borderColor = yellow.CGColor
        boardButton21.layer.borderWidth = 1
        boardButton21.addTarget(self, action: #selector( RouletteBoardControl.boardButton21Tapped(_:)), forControlEvents: .TouchDown)
        let number21 = UIImage(named:"number21")
        boardButton21.setBackgroundImage(number21, forState: .Normal)
        boardButtons["21"] = boardButton21
        boardValues["21"] = 0.0
        addSubview(boardButton21)
        
        let boardButton22 = UIButton( frame: CGRect(x: 2*width, y: 8*height, width: width, height: height))
        boardButton22.layer.borderColor = yellow.CGColor
        boardButton22.layer.borderWidth = 1
        boardButton22.addTarget(self, action: #selector( RouletteBoardControl.boardButton22Tapped(_:)), forControlEvents: .TouchDown)
        let number22 = UIImage(named:"number22")
        boardButton22.setBackgroundImage(number22, forState: .Normal)
        boardButtons["22"] = boardButton22
        boardValues["22"] = 0.0
        addSubview(boardButton22)
        
        let boardButton23 = UIButton( frame: CGRect( x: 3*width, y: 8*height, width: width, height: height))
        boardButton23.layer.borderColor = yellow.CGColor
        boardButton23.layer.borderWidth = 1
        boardButton23.addTarget(self, action: #selector( RouletteBoardControl.boardButton23Tapped(_:)), forControlEvents: .TouchDown)
        let number23 = UIImage(named:"number23")
        boardButton23.setBackgroundImage(number23, forState: .Normal)
        boardButtons["23"] = boardButton23
        boardValues["23"] = 0.0
        addSubview(boardButton23)
        
        let boardButton24 = UIButton( frame: CGRect(x: 4*width, y: 8*height, width: width, height: height))
        boardButton24.layer.borderColor = yellow.CGColor
        boardButton24.layer.borderWidth = 1
        boardButton24.addTarget(self, action: #selector(RouletteBoardControl.boardButton24Tapped(_:)), forControlEvents: .TouchDown)
        let number24 = UIImage(named:"number24")
        boardButton24.setBackgroundImage(number24, forState: .Normal)
        boardButtons["24"] = boardButton24
        boardValues["24"] = 0.0
        addSubview(boardButton24)
        
        //novi ciklus
        
        let boardButtonOdd = UIButton(frame: CGRect(x:0, y:9*height, width: width, height: 2*height))
        boardButtonOdd.layer.borderColor = yellow.CGColor
        boardButtonOdd.layer.borderWidth = 1
        boardButtonOdd.addTarget(self, action: #selector(RouletteBoardControl.boardButtonOddTapped(_:)), forControlEvents: .TouchDown)
        let odd = UIImage(named:"odd")
        boardButtonOdd.setBackgroundImage(odd, forState: .Normal)
        boardButtons["Odd"] = boardButtonOdd
        boardValues["Odd"] = 0.0
        addSubview(boardButtonOdd)
        
        let boardButton2536 = UIButton(frame: CGRect( x: width, y: 9*height, width: width, height: 4*height))
        boardButton2536.layer.borderColor = yellow.CGColor
        boardButton2536.layer.borderWidth = 1
        boardButton2536.addTarget(self, action: #selector( RouletteBoardControl.boardButton2536Tapped(_:)), forControlEvents: .TouchDown)
        let image2536 = UIImage(named:"image2536")
        boardButton2536.setBackgroundImage(image2536, forState: .Normal)
        boardButtons["2536"] = boardButton2536
        boardValues["2536"] = 0.0
        addSubview(boardButton2536)
        
        let boardButton25 = UIButton( frame: CGRect( x: 2*width, y: 9*height, width: width, height: height))
        boardButton25.layer.borderColor = yellow.CGColor
        boardButton25.layer.borderWidth = 1
        boardButton25.addTarget(self, action: #selector( RouletteBoardControl.boardButton25Tapped(_:)), forControlEvents: .TouchDown)
        let number25 = UIImage(named:"number25")
        boardButton25.setBackgroundImage(number25, forState: .Normal)
        boardButtons["25"] = boardButton25
        boardValues["25"] = 0.0
        addSubview(boardButton25)
        
        let boardButton26 = UIButton( frame: CGRect(x: 3*width, y: 9*height, width: width, height: height))
        boardButton26.layer.borderColor = yellow.CGColor
        boardButton26.layer.borderWidth = 1
        boardButton26.addTarget(self, action: #selector(RouletteBoardControl.boardButton26Tapped(_:)), forControlEvents: .TouchDown)
        let number26 = UIImage(named:"number26")
        boardButton26.setBackgroundImage(number26, forState: .Normal)
        boardButtons["26"] = boardButton26
        boardValues["26"] = 0.0
        addSubview(boardButton26)
        
        let boardButton27 = UIButton( frame: CGRect(x: 4*width, y: 9*height, width: width, height: height))
        boardButton27.layer.borderColor = yellow.CGColor
        boardButton27.layer.borderWidth = 1
        boardButton27.addTarget(self, action: #selector( RouletteBoardControl.boardButton27Tapped(_:)), forControlEvents: .TouchDown)
        let number27 = UIImage(named:"number27")
        boardButton27.setBackgroundImage(number27, forState: .Normal)
        boardButtons["27"] = boardButton27
        boardValues["27"] = 0.0
        addSubview(boardButton27)
        
        
        let boardButton28 = UIButton( frame: CGRect(x: 2*width, y: 10*height, width: width, height: height))
        boardButton28.layer.borderColor = yellow.CGColor
        boardButton28.layer.borderWidth = 1
        boardButton28.addTarget(self, action: #selector( RouletteBoardControl.boardButton28Tapped(_:)), forControlEvents: .TouchDown)
        let number28 = UIImage(named:"number28")
        boardButton28.setBackgroundImage(number28, forState: .Normal)
        boardButtons["28"] = boardButton28
        boardValues["28"] = 0.0
        addSubview(boardButton28)
        
        
        let boardButton29 = UIButton( frame: CGRect( x: 3*width, y: 10*height, width: width, height: height))
        boardButton29.layer.borderColor = yellow.CGColor
        boardButton29.layer.borderWidth = 1
        boardButton29.addTarget(self, action: #selector( RouletteBoardControl.boardButton29Tapped(_:)), forControlEvents: .TouchDown)
        let number29 = UIImage(named:"number29")
        boardButton29.setBackgroundImage(number29, forState: .Normal)
        boardButtons["29"] = boardButton29
        boardValues["29"] = 0.0
        addSubview(boardButton29)
        
        let boardButton30 = UIButton( frame: CGRect(x: 4*width, y: 10*height, width: width, height: height))
        boardButton30.layer.borderColor = yellow.CGColor
        boardButton30.layer.borderWidth = 1
        boardButton30.addTarget(self, action: #selector(RouletteBoardControl.boardButton30Tapped(_:)), forControlEvents: .TouchDown)
        let number30 = UIImage(named:"number30")
        boardButton30.setBackgroundImage(number30, forState: .Normal)
        boardButtons["30"] = boardButton30
        boardValues["30"] = 0.0
        addSubview(boardButton30)
        
        
        let boardButton1936 = UIButton(frame: CGRect(x:0, y:11*height, width: width, height: 2*height))
        boardButton1936.layer.borderColor = yellow.CGColor
        boardButton1936.layer.borderWidth = 1
        boardButton1936.addTarget(self, action: #selector(RouletteBoardControl.boardButton1936Tapped(_:)), forControlEvents: .TouchDown)
        let image1936 = UIImage(named:"image1936")
        boardButton1936.setBackgroundImage(image1936, forState: .Normal)
        boardButtons["1936"] = boardButton1936
        boardValues["1936"] = 0.0
        addSubview(boardButton1936)
        
        let boardButton31 = UIButton( frame: CGRect( x: 2*width, y: 11*height, width: width, height: height))
        boardButton31.layer.borderColor = yellow.CGColor
        boardButton31.layer.borderWidth = 1
        boardButton31.addTarget(self, action: #selector( RouletteBoardControl.boardButton31Tapped(_:)), forControlEvents: .TouchDown)
        let number31 = UIImage(named:"number31")
        boardButton31.setBackgroundImage(number31, forState: .Normal)
        boardButtons["31"] = boardButton31
        boardValues["31"] = 0.0
        addSubview(boardButton31)
        
        let boardButton32 = UIButton( frame: CGRect(x: 3*width, y: 11*height, width: width, height: height))
        boardButton32.layer.borderColor = yellow.CGColor
        boardButton32.layer.borderWidth = 1
        boardButton32.addTarget(self, action: #selector(RouletteBoardControl.boardButton32Tapped(_:)), forControlEvents: .TouchDown)
        let number32 = UIImage(named:"number32")
        boardButton32.setBackgroundImage(number32, forState: .Normal)
        boardButtons["32"] = boardButton32
        boardValues["32"] = 0.0
        addSubview(boardButton32)
        
        let boardButton33 = UIButton( frame: CGRect(x: 4*width, y: 11*height, width: width, height: height))
        boardButton33.layer.borderColor = yellow.CGColor
        boardButton33.layer.borderWidth = 1
        boardButton33.addTarget(self, action: #selector( RouletteBoardControl.boardButton33Tapped(_:)), forControlEvents: .TouchDown)
        let number33 = UIImage(named:"number33")
        boardButton33.setBackgroundImage(number33, forState: .Normal)
        boardButtons["33"] = boardButton33
        boardValues["33"] = 0.0
        addSubview(boardButton33)
        
        
        let boardButton34 = UIButton( frame: CGRect(x: 2*width, y: 12*height, width: width, height: height))
        boardButton34.layer.borderColor = yellow.CGColor
        boardButton34.layer.borderWidth = 1
        boardButton34.addTarget(self, action: #selector( RouletteBoardControl.boardButton34Tapped(_:)), forControlEvents: .TouchDown)
        let number34 = UIImage(named:"number34")
        boardButton34.setBackgroundImage(number34, forState: .Normal)
        boardButtons["34"] = boardButton34
        boardValues["34"] = 0.0
        addSubview(boardButton34)
        
        
        let boardButton35 = UIButton( frame: CGRect( x: 3*width, y: 12*height, width: width, height: height))
        boardButton35.layer.borderColor = yellow.CGColor
        boardButton35.layer.borderWidth = 1
        boardButton35.addTarget(self, action: #selector( RouletteBoardControl.boardButton35Tapped(_:)), forControlEvents: .TouchDown)
        let number35 = UIImage(named:"number35")
        boardButton35.setBackgroundImage(number35, forState: .Normal)
        boardButtons["35"] = boardButton35
        boardValues["35"] = 0.0
        addSubview(boardButton35)
        
        let boardButton36 = UIButton( frame: CGRect(x: 4*width, y: 12*height, width: width, height: height))
        boardButton36.layer.borderColor = yellow.CGColor
        boardButton36.layer.borderWidth = 1
        boardButton36.addTarget(self, action: #selector(RouletteBoardControl.boardButton36Tapped(_:)), forControlEvents: .TouchDown)
        let number36 = UIImage(named:"number36")
        boardButton36.setBackgroundImage(number36, forState: .Normal)
        boardButtons["36"] = boardButton36
        boardValues["36"] = 0.0
        addSubview(boardButton36)
        
        let boardButton1st = UIButton( frame: CGRect(x: 2*width, y: 13*height, width: width, height: height))
        boardButton1st.layer.borderColor = yellow.CGColor
        boardButton1st.layer.borderWidth = 1
        boardButton1st.addTarget(self, action: #selector( RouletteBoardControl.boardButton1stTapped(_:)), forControlEvents: .TouchDown)
        let image1st = UIImage(named:"image1st")
        boardButton1st.setBackgroundImage(image1st, forState: .Normal)
        boardButtons["1st"] = boardButton1st
        boardValues["1st"] = 0.0
        addSubview(boardButton1st)
        
        
        let boardButton2nd = UIButton( frame: CGRect( x: 3*width, y: 13*height, width: width, height: height))
        boardButton2nd.layer.borderColor = yellow.CGColor
        boardButton2nd.layer.borderWidth = 1
        boardButton2nd.addTarget(self, action: #selector( RouletteBoardControl.boardButton2ndTapped(_:)), forControlEvents: .TouchDown)
        let image2nd = UIImage(named:"image2nd")
        boardButton2nd.setBackgroundImage(image2nd, forState: .Normal)
        boardButtons["2nd"] = boardButton2nd
        boardValues["2nd"] = 0.0
        addSubview(boardButton2nd)
        
        let boardButton3rd = UIButton( frame: CGRect(x: 4*width, y: 13*height, width: width, height: height))
        boardButton3rd.layer.borderColor = yellow.CGColor
        boardButton3rd.layer.borderWidth = 1
        boardButton3rd.addTarget(self, action: #selector(RouletteBoardControl.boardButton3rdTapped(_:)), forControlEvents: .TouchDown)
        let image3rd = UIImage(named:"image3rd")
        boardButton3rd.setBackgroundImage(image3rd, forState: .Normal)
        boardButtons["3rd"] = boardButton3rd
        boardValues["3rd"] = 0.0
        addSubview(boardButton3rd)
        
        buttonGeneralSettings()
        
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var buttonZeroFrame = CGRect(x:2*width, y: 0, width: 3*width, height: height)
        buttonZeroFrame.origin.x = CGFloat(2*width)
        boardButtons["Zero"]!.frame = buttonZeroFrame
        
        var button118Frame = CGRect(x:0, y:height, width: width, height: 2*height)
        button118Frame.origin.x = CGFloat(0)
        boardButtons["118"]!.frame = button118Frame
        
        var button112Frame = CGRect(x: width, y: height, width: width, height: 4*height)
        button112Frame.origin.x = CGFloat(width)
        boardButtons["112"]!.frame = button112Frame
        
        var button1Frame = CGRect(x: 2*width, y: height, width: width, height: height)
        button1Frame.origin.x = CGFloat(2*width)
        boardButtons["1"]!.frame = button1Frame
        
        var button2Frame = CGRect(x: 3*width, y: height, width: width, height: height)
        button2Frame.origin.x = CGFloat(3*width)
        boardButtons["2"]!.frame = button2Frame
        
        var button3Frame = CGRect(x: 4*width, y: height, width: width, height: height)
        button3Frame.origin.x = CGFloat(4*width)
        boardButtons["3"]!.frame = button3Frame
        
        var button4Frame = CGRect(x: 2*width, y: 2*height, width: width, height: height)
        button4Frame.origin.x = CGFloat(2*width)
        boardButtons["4"]!.frame = button4Frame
        
        var button5Frame = CGRect(x: 3*width, y: 2*height, width: width, height: height)
        button5Frame.origin.x = CGFloat(3*width)
        boardButtons["5"]!.frame = button5Frame
        
        var button6Frame = CGRect(x: 4*width, y: 2*height, width: width, height: height)
        button6Frame.origin.x = CGFloat(4*width)
        boardButtons["6"]!.frame = button6Frame
        
        var buttonEvenFrame = CGRect(x:0, y:3*height, width: width, height: 2*height)
        buttonEvenFrame.origin.x = CGFloat(0)
        boardButtons["Even"]!.frame = buttonEvenFrame
        
        var button7Frame = CGRect(x: 2*width, y: 3*height, width: width, height: height)
        button7Frame.origin.x = CGFloat(2*width)
        boardButtons["7"]?.frame = button7Frame
        
        var button8Frame = CGRect(x: 3*width, y: 3*height, width: width, height: height)
        button8Frame.origin.x = CGFloat(3*width)
        boardButtons["8"]!.frame = button8Frame
        
        var button9Frame = CGRect(x: 4*width, y: 3*height, width: width, height: height)
        button9Frame.origin.x = CGFloat(4*width)
        boardButtons["9"]!.frame = button9Frame
        
        var button10Frame = CGRect(x: 2*width, y: 4*height, width: width, height: height)
        button10Frame.origin.x = CGFloat(2*width)
        boardButtons["10"]!.frame = button10Frame
        
        var button11Frame = CGRect(x: 3*width, y: 4*height, width: width, height: height)
        button11Frame.origin.x = CGFloat(3*width)
        boardButtons["11"]!.frame = button11Frame
        
        var button12Frame = CGRect(x: 4*width, y: 4*height, width: width, height: height)
        button12Frame.origin.x = CGFloat(4*width)
        boardButtons["12"]!.frame = button12Frame
        
        // second part
        
        var buttonRedFrame = CGRect(x:0, y:5*height, width: width, height: 2*height)
        buttonRedFrame.origin.x = CGFloat(0)
        boardButtons["Red"]!.frame = buttonRedFrame
        
        var button1324Frame = CGRect(x: width, y: 5*height, width: width, height: 4*height)
        button1324Frame.origin.x = CGFloat(width)
        boardButtons["1324"]!.frame = button1324Frame
        
        var button13Frame = CGRect(x: 2*width, y: 5*height, width: width, height: height)
        button13Frame.origin.x = CGFloat(2*width)
        boardButtons["13"]!.frame = button13Frame
        
        var button14Frame = CGRect(x: 3*width, y: 5*height, width: width, height: height)
        button14Frame.origin.x = CGFloat(3*width)
        boardButtons["14"]!.frame = button14Frame
        
        var button15Frame = CGRect(x: 4*width, y: 5*height, width: width, height: height)
        button15Frame.origin.x = CGFloat(4*width)
        boardButtons["15"]!.frame = button15Frame
        
        var button16Frame = CGRect(x: 2*width, y: 6*height, width: width, height: height)
        button16Frame.origin.x = CGFloat(2*width)
        boardButtons["16"]!.frame = button16Frame
        
        var button17Frame = CGRect(x: 3*width, y: 6*height, width: width, height: height)
        button17Frame.origin.x = CGFloat(3*width)
        boardButtons["17"]!.frame = button17Frame
        
        var button18Frame = CGRect(x: 4*width, y: 6*height, width: width, height: height)
        button18Frame.origin.x = CGFloat(4*width)
        boardButtons["18"]!.frame = button18Frame
        
        var buttonBlackFrame = CGRect(x:0, y:7*height, width: width, height: 2*height)
        buttonBlackFrame.origin.x = CGFloat(0)
        boardButtons["Black"]!.frame = buttonBlackFrame
        
        var button19Frame = CGRect(x: 2*width, y: 7*height, width: width, height: height)
        button19Frame.origin.x = CGFloat(2*width)
        boardButtons["19"]?.frame = button19Frame
        
        var button20Frame = CGRect(x: 3*width, y: 7*height, width: width, height: height)
        button20Frame.origin.x = CGFloat(3*width)
        boardButtons["20"]!.frame = button20Frame
        
        var button21Frame = CGRect(x: 4*width, y: 7*height, width: width, height: height)
        button21Frame.origin.x = CGFloat(4*width)
        boardButtons["21"]!.frame = button21Frame
        
        var button22Frame = CGRect(x: 2*width, y: 8*height, width: width, height: height)
        button22Frame.origin.x = CGFloat(2*width)
        boardButtons["22"]!.frame = button22Frame
        
        var button23Frame = CGRect(x: 3*width, y: 8*height, width: width, height: height)
        button23Frame.origin.x = CGFloat(3*width)
        boardButtons["23"]!.frame = button23Frame
        
        var button24Frame = CGRect(x: 4*width, y: 8*height, width: width, height: height)
        button24Frame.origin.x = CGFloat(4*width)
        boardButtons["24"]!.frame = button24Frame
        
        //third part
        
        var buttonOddFrame = CGRect(x:0, y:9*height, width: width, height: 2*height)
        buttonOddFrame.origin.x = CGFloat(0)
        boardButtons["Odd"]!.frame = buttonOddFrame
        
        var button2536Frame = CGRect(x: width, y: 9*height, width: width, height: 4*height)
        button2536Frame.origin.x = CGFloat(width)
        boardButtons["2536"]!.frame = button2536Frame
        
        var button25Frame = CGRect(x: 2*width, y: 9*height, width: width, height: height)
        button25Frame.origin.x = CGFloat(2*width)
        boardButtons["25"]!.frame = button25Frame
        
        var button26Frame = CGRect(x: 3*width, y: 9*height, width: width, height: height)
        button26Frame.origin.x = CGFloat(3*width)
        boardButtons["26"]!.frame = button26Frame
        
        var button27Frame = CGRect(x: 4*width, y: 9*height, width: width, height: height)
        button27Frame.origin.x = CGFloat(4*width)
        boardButtons["27"]!.frame = button27Frame
        
        var button28Frame = CGRect(x: 2*width, y: 10*height, width: width, height: height)
        button28Frame.origin.x = CGFloat(2*width)
        boardButtons["28"]!.frame = button28Frame
        
        var button29Frame = CGRect(x: 3*width, y: 10*height, width: width, height: height)
        button29Frame.origin.x = CGFloat(3*width)
        boardButtons["29"]!.frame = button29Frame
        
        var button30Frame = CGRect(x: 4*width, y: 10*height, width: width, height: height)
        button30Frame.origin.x = CGFloat(4*width)
        boardButtons["30"]!.frame = button30Frame
        
        var button1936Frame = CGRect(x:0, y:11*height, width: width, height: 2*height)
        button1936Frame.origin.x = CGFloat(0)
        boardButtons["1936"]!.frame = button1936Frame
        
        var button31Frame = CGRect(x: 2*width, y: 11*height, width: width, height: height)
        button31Frame.origin.x = CGFloat(2*width)
        boardButtons["31"]?.frame = button31Frame
        
        var button32Frame = CGRect(x: 3*width, y: 11*height, width: width, height: height)
        button32Frame.origin.x = CGFloat(3*width)
        boardButtons["32"]!.frame = button32Frame
        
        var button33Frame = CGRect(x: 4*width, y: 11*height, width: width, height: height)
        button33Frame.origin.x = CGFloat(4*width)
        boardButtons["33"]!.frame = button33Frame
        
        var button34Frame = CGRect(x: 2*width, y: 12*height, width: width, height: height)
        button34Frame.origin.x = CGFloat(2*width)
        boardButtons["34"]!.frame = button34Frame
        
        var button35Frame = CGRect(x: 3*width, y: 12*height, width: width, height: height)
        button35Frame.origin.x = CGFloat(3*width)
        boardButtons["35"]!.frame = button35Frame
        
        var button36Frame = CGRect(x: 4*width, y: 12*height, width: width, height: height)
        button36Frame.origin.x = CGFloat(4*width)
        boardButtons["36"]!.frame = button36Frame
        
        var button1stFrame = CGRect(x: 2*width, y: 13*height, width: width, height: height)
        button1stFrame.origin.x = CGFloat(2*width)
        boardButtons["1st"]!.frame = button1stFrame
        
        var button2ndFrame = CGRect(x: 3*width, y: 13*height, width: width, height: height)
        button2ndFrame.origin.x = CGFloat(3*width)
        boardButtons["2nd"]!.frame = button2ndFrame
        
        var button3rdFrame = CGRect(x: 4*width, y: 13*height, width: width, height: height)
        button3rdFrame.origin.x = CGFloat(4*width)
        boardButtons["3rd"]!.frame = button3rdFrame
        
    }
    
    func buttonGeneralSettings() {
        for (_, button) in boardButtons {
            button.layer.borderColor = yellow.CGColor
            button.layer.borderWidth = 1
            button.titleLabel!.font = UIFont(name: "Helvetica", size: 10.0)
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
            button.setTitleColor(UIColor.yellowColor(), forState: .Normal)
        }
    }
    
    func moneyUpdater(amount: Double ) -> Bool {
        if money - amount < 0 {
            stopBet()
            return false
        } else {
            money = money - amount
            return true
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 150, height: 500)
        
    }
    
    func resetRouletteBoard() {
        for (_, button) in boardButtons {
            button.setTitle("", forState: .Normal)
        }
    }
    
    func resetRouletteChipValues() {
        for (field, _) in boardValues {
            boardValues[field] = 0.0
        }
    }
    
    func setChip(chip chip: Int) {
        self.chip = chip
    }
    
    func setMoney(money money: Double) {
        self.money = money
    }
    
    func getMoney() -> Double {
        return self.money
    }
    
    func stopBet() {
        allowedBet = false
    }
    
    func allowBet() {
        allowedBet = true
    }
    
    // MARK: Button Actions
    
    func boardButtonZeroTapped(button: UIButton)
    {
        if allowedBet  && moneyUpdater(Double(chip)){
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 0)
            boardValues["Zero"]! += Double(chip)
            boardButtons["Zero"]!.setTitle(String(format: "%.1f", boardValues["Zero"]!), forState: .Normal)
            print(boardValues["Zero"]!)
            print(" pritisnuta nula ")
        }
    }
    
    func boardButton118Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.part1to18, bet: Double(chip), target: 0)
            boardValues["118"]! += Double(chip)
            boardButtons["118"]!.setTitle(String(format: "%.1f", boardValues["118"]!), forState: .Normal)
            print(boardValues["118"]!)
            print(" pritisnut 1-18")
        }
    }
    
    func boardButton112Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.part1to12, bet: Double(chip), target: 0)
            boardValues["112"]! += Double(chip)
            boardButtons["112"]!.setTitle(String(format: "%.1f", boardValues["112"]!), forState: .Normal)
            print(boardValues["112"]!)
            print(" pritisnut 1-12")
        }
    }
    
    func boardButton1Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 1)
            boardValues["1"]! += Double(chip)
            boardButtons["1"]!.setTitle(String(format: "%.1f", boardValues["1"]!), forState: .Normal)
            print(boardValues["1"]!)
            print("pritisnut 1")
        }
        
    }
    
    func boardButton2Tapped(button: UIButton)
    {
        
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 2)
            boardValues["2"]! += Double(chip)
            boardButtons["2"]!.setTitle(String(format: "%.1f", boardValues["2"]!), forState: .Normal)
            print(boardValues["2"]!)
            print("pritisnut 2")
        }
    }
    
    func boardButton3Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 3)
            boardValues["3"]! += Double(chip)
            boardButtons["3"]!.setTitle(String(format: "%.1f", boardValues["3"]!), forState: .Normal)
            print(boardValues["3"]!)
            print("pritisnut 3")
        }
        
    }
    
    func boardButton4Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 4)
            boardValues["4"]! += Double(chip)
            boardButtons["4"]!.setTitle(String(format: "%.1f", boardValues["4"]!), forState: .Normal)
            print(boardValues["4"]!)
            print("pritisnut 4")
        }
    }
    
    func boardButton5Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 5)
            boardValues["5"]! += Double(chip)
            boardButtons["5"]!.setTitle(String(format: "%.1f", boardValues["5"]!), forState: .Normal)
            print(boardValues["5"]!)
            print("pritisnut 5")
        }
        
    }
    
    func boardButton6Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 6)
            boardValues["6"]! += Double(chip)
            boardButtons["6"]!.setTitle(String(format: "%.1f", boardValues["6"]!), forState: .Normal)
            print(boardValues["6"]!)
            print("pritisnut 6")
        }
        
    }
    
    
    func boardButtonEvenTapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.even, bet: Double(chip), target: 0)
            boardValues["Even"]! += Double(chip)
            boardButtons["Even"]!.setTitle(String(format: "%.1f", boardValues["Even"]!), forState: .Normal)
            print(boardValues["Even"]!)
            print("pritisnut even")
        }
    }
    
    func boardButton7Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 7)
            boardValues["7"]! += Double(chip)
            boardButtons["7"]!.setTitle(String(format: "%.1f", boardValues["7"]!), forState: .Normal)
            print(boardValues["7"]!)
            print("pritisnut 7")
        }
        
    }
    
    func boardButton8Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 8)
            boardValues["8"]! += Double(chip)
            boardButtons["8"]!.setTitle(String(format: "%.1f", boardValues["8"]!), forState: .Normal)
            print(boardValues["8"]!)
            print("pritisnut 8")
        }
        
    }
    
    func boardButton9Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 9)
            boardValues["9"]! += Double(chip)
            boardButtons["9"]!.setTitle(String(format: "%.1f", boardValues["9"]!), forState: .Normal)
            print(boardValues["9"]!)
            print("pritisnut 9")
        }
        
    }
    
    func boardButton10Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 10)
            boardValues["10"]! += Double(chip)
            boardButtons["10"]!.setTitle(String(format: "%.1f", boardValues["10"]!), forState: .Normal)
            print(boardValues["10"]!)
            print("pritisnut 10")
        }
        
    }
    
    func boardButton11Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 11)
            boardValues["11"]! += Double(chip)
            boardButtons["11"]!.setTitle(String(format: "%.1f", boardValues["11"]!), forState: .Normal)
            print(boardValues["11"]!)
            print("pritisnut 11")
        }
        
    }
    
    func boardButton12Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 12)
            boardValues["12"]! += Double(chip)
            boardButtons["12"]!.setTitle(String(format: "%.1f", boardValues["12"]!), forState: .Normal)
            print(boardValues["12"]!)
            print("pritisnut 12")
        }
        
    }
    
    //novi ciklus
    func boardButtonRedTapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.red, bet: Double(chip), target: 0)
            boardValues["Red"]! += Double(chip)
            boardButtons["Red"]!.setTitle(String(format: "%.1f", boardValues["Red"]!), forState: .Normal)
            print(boardValues["Red"]!)
            print("pritisnuto crveno")
        }
    }
    
    func boardButton1324Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.part13to24, bet: Double(chip), target: 0)
            boardValues["1324"]! += Double(chip)
            boardButtons["1324"]!.setTitle(String(format: "%.1f", boardValues["1324"]!), forState: .Normal)
            print(boardValues["1324"]!)
            print("pritisnut 13-24")
        }
    }
    
    func boardButton13Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 13)
            boardValues["13"]! += Double(chip)
            boardButtons["13"]!.setTitle(String(format: "%.1f", boardValues["13"]!), forState: .Normal)
            print(boardValues["13"]!)
            print("pritisnut 13")
        }
        
    }
    
    func boardButton14Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 14)
            boardValues["14"]! += Double(chip)
            boardButtons["14"]!.setTitle(String(format: "%.1f", boardValues["14"]!), forState: .Normal)
            print(boardValues["14"]!)
            print("pritisnut 14")
        }
    }
    
    func boardButton15Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 15)
            boardValues["15"]! += Double(chip)
            boardButtons["15"]!.setTitle(String(format: "%.1f", boardValues["15"]!), forState: .Normal)
            print(boardValues["15"]!)
            print("pritisnut 15")
        }
        
    }
    
    func boardButton16Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 16)
            boardValues["16"]! += Double(chip)
            boardButtons["16"]!.setTitle(String(format: "%.1f", boardValues["16"]!), forState: .Normal)
            print(boardValues["16"]!)
            print("pritisnut 16")
        }
        
    }
    
    func boardButton17Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 17)
            boardValues["17"]! += Double(chip)
            boardButtons["17"]!.setTitle(String(format: "%.1f", boardValues["17"]!), forState: .Normal)
            print(boardValues["17"]!)
            print("pritisnut 17")
        }
        
    }
    
    func boardButton18Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 18)
            boardValues["18"]! += Double(chip)
            boardButtons["18"]!.setTitle(String(format: "%.1f", boardValues["18"]!), forState: .Normal)
            print(boardValues["18"]!)
            print("pritisnut 18")
        }
        
    }
    
    
    func boardButtonBlackTapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.black, bet: Double(chip), target: 0)
            boardValues["Black"]! += Double(chip)
            boardButtons["Black"]!.setTitle(String(format: "%.1f", boardValues["Black"]!), forState: .Normal)
            print(boardValues["Black"]!)
            print("pritisnuto crno")
        }
    }
    
    func boardButton19Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 19)
            boardValues["19"]! += Double(chip)
            boardButtons["19"]!.setTitle(String(format: "%.1f", boardValues["19"]!), forState: .Normal)
            print(boardValues["19"]!)
            print("pritisnut 19")
        }
    }
    
    func boardButton20Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 20)
            boardValues["20"]! += Double(chip)
            boardButtons["20"]!.setTitle(String(format: "%.1f", boardValues["20"]!), forState: .Normal)
            print(boardValues["20"]!)
            print("pritisnut 20")
        }
        
    }
    
    func boardButton21Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 21)
            boardValues["21"]! += Double(chip)
            boardButtons["21"]!.setTitle(String(format: "%.1f", boardValues["21"]!), forState: .Normal)
            print(boardValues["21"]!)
            print("pritisnut 21")
        }
        
    }
    
    func boardButton22Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 22)
            boardValues["22"]! += Double(chip)
            boardButtons["22"]!.setTitle(String(format: "%.1f", boardValues["22"]!), forState: .Normal)
            print(boardValues["22"]!)
            print("pritisnut 22")
        }
        
    }
    
    func boardButton23Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 23)
            boardValues["23"]! += Double(chip)
            boardButtons["23"]!.setTitle(String(format: "%.1f", boardValues["23"]!), forState: .Normal)
            print(boardValues["23"]!)
            print("pritisnut 23")
        }
        
    }
    
    func boardButton24Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 24)
            boardValues["24"]! += Double(chip)
            boardButtons["24"]!.setTitle(String(format: "%.1f", boardValues["24"]!), forState: .Normal)
            print(boardValues["24"]!)
            print("pritisnut 24")
        }
        
    }
    
    //novi ciklus
    
    func boardButtonOddTapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.odd, bet: Double(chip), target: 0)
            boardValues["Odd"]! += Double(chip)
            boardButtons["Odd"]!.setTitle(String(format: "%.1f", boardValues["Odd"]!), forState: .Normal)
            print(boardValues["Odd"]!)
            print("pritisnut odd")
        }
    }
    
    func boardButton2536Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.part25to36, bet: Double(chip), target: 0)
            boardValues["2536"]! += Double(chip)
            boardButtons["2536"]!.setTitle(String(format: "%.1f", boardValues["2536"]!), forState: .Normal)
            print(boardValues["2536"]!)
            print("pritisnut 25-36")
        }
    }
    
    func boardButton25Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 25)
            boardValues["25"]! += Double(chip)
            boardButtons["25"]!.setTitle(String(format: "%.1f", boardValues["25"]!), forState: .Normal)
            print(boardValues["25"]!)
            print("pritisnut 25")
        }
        
    }
    
    func boardButton26Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 26)
            boardValues["26"]! += Double(chip)
            boardButtons["26"]!.setTitle(String(format: "%.1f", boardValues["26"]!), forState: .Normal)
            print(boardValues["26"]!)
            print("pritisnut 26")
        }
        
    }
    
    func boardButton27Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 27)
            boardValues["27"]! += Double(chip)
            boardButtons["27"]!.setTitle(String(format: "%.1f", boardValues["27"]!), forState: .Normal)
            print(boardValues["27"]!)
            print("pritisnut 27")
        }
        
    }
    
    func boardButton28Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 28)
            boardValues["28"]! += Double(chip)
            boardButtons["28"]!.setTitle(String(format: "%.1f", boardValues["28"]!), forState: .Normal)
            print(boardValues["28"]!)
            print("pritisnut 28")
        }
        
    }
    
    func boardButton29Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 29)
            boardValues["29"]! += Double(chip)
            boardButtons["29"]!.setTitle(String(format: "%.1f", boardValues["29"]!), forState: .Normal)
            print(boardValues["29"]!)
            print("pritisnut 29")
        }
        
    }
    
    func boardButton30Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 30)
            boardValues["30"]! += Double(chip)
            boardButtons["30"]!.setTitle(String(format: "%.1f", boardValues["30"]!), forState: .Normal)
            print(boardValues["30"]!)
            print("pritisnut 30")
        }
        
    }
    
    
    func boardButton1936Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.part19to36, bet: Double(chip), target: 0)
            boardValues["1936"]! += Double(chip)
            boardButtons["1936"]!.setTitle(String(format: "%.1f", boardValues["1936"]!), forState: .Normal)
            print(boardValues["1936"]!)
            print("pritisnut 1936")
        }
    }
    
    func boardButton31Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 31)
            boardValues["31"]! += Double(chip)
            boardButtons["31"]!.setTitle(String(format: "%.1f", boardValues["31"]!), forState: .Normal)
            print(boardValues["31"]!)
            print("pritisnut 31")
        }
        
    }
    
    func boardButton32Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 32)
            boardValues["32"]! += Double(chip)
            boardButtons["32"]!.setTitle(String(format: "%.1f", boardValues["32"]!), forState: .Normal)
            print(boardValues["32"]!)
            print("pritisnut 32")
        }
        
    }
    
    func boardButton33Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 33)
            boardValues["33"]! += Double(chip)
            boardButtons["33"]!.setTitle(String(format: "%.1f", boardValues["33"]!), forState: .Normal)
            print(boardValues["33"]!)
            print("pritisnut 33")
        }
        
    }
    
    func boardButton34Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 34)
            boardValues["34"]! += Double(chip)
            boardButtons["34"]!.setTitle(String(format: "%.1f", boardValues["34"]!), forState: .Normal)
            print(boardValues["34"]!)
            print("pritisnut 34")
        }
        
    }
    
    func boardButton35Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 35)
            boardValues["35"]! += Double(chip)
            boardButtons["35"]!.setTitle(String(format: "%.1f", boardValues["35"]!), forState: .Normal)
            print(boardValues["35"]!)
            print("pritisnut 35")
        }
        
    }
    
    func boardButton36Tapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: 36)
            boardValues["36"]! += Double(chip)
            boardButtons["36"]!.setTitle(String(format: "%.1f", boardValues["36"]!), forState: .Normal)
            print(boardValues["36"]!)
            print("pritisnut 36")
        }
        
    }
    
    func boardButton1stTapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.firstColumn, bet: Double(chip), target: 0)
            boardValues["1st"]! += Double(chip)
            boardButtons["1st"]!.setTitle(String(format: "%.1f", boardValues["1st"]!), forState: .Normal)
            print(boardValues["1st"]!)
            print("pritisnut 1st")
        }
        
    }
    
    func boardButton2ndTapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.secondColumn, bet: Double(chip), target: 0)
            boardValues["2nd"]! += Double(chip)
            boardButtons["2nd"]!.setTitle(String(format: "%.1f", boardValues["2nd"]!), forState: .Normal)
            print(boardValues["2nd"]!)
            print("pritisnut 2nd")
        }
        
    }
    
    func boardButton3rdTapped(button: UIButton)
    {
        if allowedBet && moneyUpdater(Double(chip)) {
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.thirdColumn, bet: Double(chip), target: 0)
            boardValues["3rd"]! += Double(chip)
            boardButtons["3rd"]!.setTitle(String(format: "%.1f", boardValues["3rd"]!), forState: .Normal)
            print(boardValues["3rd"]!)
            print("pritisnut 3rd")
        }
        
    }
}

extension RouletteBoardControl {
    
    func drawJeuZero(bet bet: Double) {
        boardValues["Zero"]! += bet/8
        boardButtons["Zero"]!.setTitle(String(format: "%.1f", boardValues["Zero"]!), forState: .Normal)
        
        boardValues["3"]! += bet/8
        boardButtons["3"]!.setTitle(String(format: "%.1f", boardValues["3"]!), forState: .Normal)
        
        boardValues["12"]! += bet/8
        boardButtons["12"]!.setTitle(String(format: "%.1f", boardValues["12"]!), forState: .Normal)
        
        boardValues["15"]! += bet/8
        boardButtons["15"]!.setTitle(String(format: "%.1f", boardValues["15"]!), forState: .Normal)
        
        boardValues["32"]! += bet/8
        boardButtons["32"]!.setTitle(String(format: "%.1f", boardValues["32"]!), forState: .Normal)
        
        boardValues["35"]! += bet/8
        boardButtons["35"]!.setTitle(String(format: "%.1f", boardValues["35"]!), forState: .Normal)
        
        boardValues["26"]! += bet/4
        boardButtons["26"]!.setTitle(String(format: "%.1f", boardValues["26"]!), forState: .Normal)
    }
    
    func drawVoisinsDuZero(bet bet: Double) {
        
        boardValues["Zero"]! += bet*2/27
        boardButtons["Zero"]!.setTitle(String(format: "%.1f", boardValues["Zero"]!), forState: .Normal)
        
        boardValues["2"]! += bet*2/27
        boardButtons["2"]!.setTitle(String(format: "%.1f", boardValues["2"]!), forState: .Normal)
        
        boardValues["3"]! += bet*2/27
        boardButtons["3"]!.setTitle(String(format: "%.1f", boardValues["3"]!), forState: .Normal)
        
        boardValues["4"]! += bet/18
        boardButtons["4"]!.setTitle(String(format: "%.1f", boardValues["4"]!), forState: .Normal)
        
        boardValues["7"]! += bet/18
        boardButtons["7"]!.setTitle(String(format: "%.1f", boardValues["7"]!), forState: .Normal)
        
        boardValues["12"]! += bet/18
        boardButtons["12"]!.setTitle(String(format: "%.1f", boardValues["12"]!), forState: .Normal)
        
        boardValues["15"]! += bet/18
        boardButtons["15"]!.setTitle(String(format: "%.1f", boardValues["15"]!), forState: .Normal)
        
        boardValues["18"]! += bet/18
        boardButtons["18"]!.setTitle(String(format: "%.1f", boardValues["18"]!), forState: .Normal)
        
        boardValues["21"]! += bet/18
        boardButtons["21"]!.setTitle(String(format: "%.1f", boardValues["21"]!), forState: .Normal)
        
        boardValues["19"]! += bet/18
        boardButtons["19"]!.setTitle(String(format: "%.1f", boardValues["19"]!), forState: .Normal)
        
        boardValues["22"]! += bet/18
        boardButtons["22"]!.setTitle(String(format: "%.1f", boardValues["22"]!), forState: .Normal)
        
        boardValues["25"]! += bet/18
        boardButtons["25"]!.setTitle(String(format: "%.1f", boardValues["25"]!), forState: .Normal)
        
        boardValues["26"]! += bet/18
        boardButtons["26"]!.setTitle(String(format: "%.1f", boardValues["26"]!), forState: .Normal)
        
        boardValues["28"]! += bet/18
        boardButtons["28"]!.setTitle(String(format: "%.1f", boardValues["28"]!), forState: .Normal)
        
        boardValues["29"]! += bet/18
        boardButtons["29"]!.setTitle(String(format: "%.1f", boardValues["29"]!), forState: .Normal)
        
        boardValues["32"]! += bet/18
        boardButtons["32"]!.setTitle(String(format: "%.1f", boardValues["32"]!), forState: .Normal)
        
        boardValues["35"]! += bet/18
        boardButtons["35"]!.setTitle(String(format: "%.1f", boardValues["35"]!), forState: .Normal)
    }
    
    func drawTierDuCylindre(bet bet: Double){
        boardValues["5"]! += bet/12
        boardButtons["5"]!.setTitle(String(format: "%.1f", boardValues["5"]!), forState: .Normal)
        
        boardValues["8"]! += bet/12
        boardButtons["8"]!.setTitle(String(format: "%.1f", boardValues["8"]!), forState: .Normal)
        
        boardValues["10"]! += bet/12
        boardButtons["10"]!.setTitle(String(format: "%.1f", boardValues["10"]!), forState: .Normal)
        
        boardValues["11"]! += bet/12
        boardButtons["11"]!.setTitle(String(format: "%.1f", boardValues["11"]!), forState: .Normal)
        
        boardValues["13"]! += bet/12
        boardButtons["13"]!.setTitle(String(format: "%.1f", boardValues["13"]!), forState: .Normal)
        
        boardValues["16"]! += bet/12
        boardButtons["16"]!.setTitle(String(format: "%.1f", boardValues["16"]!), forState: .Normal)
        
        boardValues["23"]! += bet/12
        boardButtons["23"]!.setTitle(String(format: "%.1f", boardValues["23"]!), forState: .Normal)
        
        boardValues["24"]! += bet/12
        boardButtons["24"]!.setTitle(String(format: "%.1f", boardValues["24"]!), forState: .Normal)
        
        boardValues["27"]! += bet/12
        boardButtons["27"]!.setTitle(String(format: "%.1f", boardValues["27"]!), forState: .Normal)
        
        boardValues["30"]! += bet/12
        boardButtons["30"]!.setTitle(String(format: "%.1f", boardValues["30"]!), forState: .Normal)
        
        boardValues["33"]! += bet/12
        boardButtons["33"]!.setTitle(String(format: "%.1f", boardValues["33"]!), forState: .Normal)
        
        boardValues["36"]! += bet/12
        boardButtons["36"]!.setTitle(String(format: "%.1f", boardValues["36"]!), forState: .Normal)
    }
    
    func drawOrphelins(bet bet: Double) {
        boardValues["1"]! += bet/5
        boardButtons["1"]!.setTitle(String(format: "%.1f", boardValues["1"]!), forState: .Normal)
        
        boardValues["6"]! += bet/10
        boardButtons["6"]!.setTitle(String(format: "%.1f", boardValues["6"]!), forState: .Normal)
        
        boardValues["9"]! += bet/10
        boardButtons["9"]!.setTitle(String(format: "%.1f", boardValues["9"]!), forState: .Normal)
        
        boardValues["14"]! += bet/10
        boardButtons["14"]!.setTitle(String(format: "%.1f", boardValues["14"]!), forState: .Normal)
        
        boardValues["17"]! += bet/5
        boardButtons["17"]!.setTitle(String(format: "%.1f", boardValues["17"]!), forState: .Normal)
        
        boardValues["20"]! += bet/10
        boardButtons["20"]!.setTitle(String(format: "%.1f", boardValues["20"]!), forState: .Normal)
        
        boardValues["31"]! += bet/10
        boardButtons["31"]!.setTitle(String(format: "%.1f", boardValues["31"]!), forState: .Normal)
        
        boardValues["34"]! += bet/10
        boardButtons["34"]!.setTitle(String(format: "%.1f", boardValues["34"]!), forState: .Normal)
    }
}
