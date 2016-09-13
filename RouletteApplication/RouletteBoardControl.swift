//
//  RouletteBoardControl.swift
//  RouletteApplication
//
//  Created by imac21 on 8/28/16.
//  Copyright © 2016 imac21. All rights reserved.
//

import UIKit

enum BoardButtonOption {
    case number(Int)
    case range(String)
    case zero
    case odd
    case even
    case red
    case black
    
    func stringValue() -> String {
        switch self {
        case .number(let num):
            return String(num)
        case .range(let rangeValue):
            return rangeValue
        case .zero:
            return "Zero"
        case .odd:
            return "Odd"
        case .even:
            return "Even"
        case .red:
            return "Red"
        case .black:
            return "Black"
        }
    }
    
    func intValue() -> Int {
        switch self {
        case .number(let num):
            return num
        default:
            return 0
        }
    }
}

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
        
        var buttonOption = BoardButtonOption.zero
        
        let boardButtonZero = BoardButton(frame: CGRect( x:2*width, y: 0, width: 3*width, height: height), andBoardOption:buttonOption)
        let zeroImage = UIImage(named:"number0")
        setupButton(on: boardButtonZero, with: zeroImage!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButtonZero)
        
        buttonOption = BoardButtonOption.range("118")
        let boardButton118 = BoardButton(frame: CGRect(x:0, y:height, width: width, height: 2*height), andBoardOption:buttonOption)
        let image118 = UIImage(named:"image118")
        setupButton(on: boardButton118, with: image118!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton118)
        
        buttonOption = BoardButtonOption.range("112")
        let boardButton112 = BoardButton(frame: CGRect( x: width, y: height, width: width, height: 4*height), andBoardOption:buttonOption)
        let image112 = UIImage(named:"image112")
        setupButton(on: boardButton112, with: image112!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton112)
        
        buttonOption = BoardButtonOption.number(1)
        let boardButton1 = BoardButton( frame: CGRect( x: 2*width, y: height, width: width, height: height), andBoardOption:buttonOption)
        let number1 = UIImage(named:"number1")
        setupButton(on: boardButton1, with: number1!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton1)
        
        buttonOption = BoardButtonOption.number(2)
        let boardButton2 = BoardButton( frame: CGRect(x: 3*width, y: height, width: width, height: height), andBoardOption:buttonOption)
        let number2 = UIImage(named:"number2")
        setupButton(on: boardButton2, with: number2!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton2)
        
        buttonOption = BoardButtonOption.number(3)
        let boardButton3 = BoardButton( frame: CGRect(x: 4*width, y: height, width: width, height: height), andBoardOption:buttonOption)
        let number3 = UIImage(named:"number3")
        setupButton(on: boardButton3, with: number3!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton3)
        
        buttonOption = BoardButtonOption.number(4)
        let boardButton4 = BoardButton( frame: CGRect(x: 2*width, y: 2*height, width: width, height: height), andBoardOption:buttonOption)
        let number4 = UIImage(named:"number4")
        setupButton(on: boardButton4, with: number4!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton4)
        
        buttonOption = BoardButtonOption.number(5)
        let boardButton5 = BoardButton( frame: CGRect( x: 3*width, y: 2*height, width: width, height: height), andBoardOption:buttonOption)
        let number5 = UIImage(named:"number5")
        setupButton(on: boardButton5, with: number5!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton5)
        
        buttonOption = BoardButtonOption.number(6)
        let boardButton6 = BoardButton( frame: CGRect(x: 4*width, y: 2*height, width: width, height: height), andBoardOption:buttonOption)
        let number6 = UIImage(named:"number6")
        setupButton(on: boardButton6, with: number6!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton6)
        
        buttonOption = BoardButtonOption.even
        let boardButtonEven = BoardButton(frame: CGRect(x:0, y:3*height, width: width, height: 2*height), andBoardOption:buttonOption)
        let even = UIImage(named:"even")
        setupButton(on: boardButtonEven, with: even!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButtonEven)
        
        buttonOption = BoardButtonOption.number(7)
        let boardButton7 = BoardButton( frame: CGRect( x: 2*width, y: 3*height, width: width, height: height), andBoardOption:buttonOption)
        let number7 = UIImage(named:"number7")
        setupButton(on: boardButton7, with: number7!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton7)
        
        buttonOption = BoardButtonOption.number(8)
        let boardButton8 = BoardButton( frame: CGRect(x: 3*width, y: 3*height, width: width, height: height), andBoardOption:buttonOption)
        let number8 = UIImage(named:"number8")
        setupButton(on: boardButton8, with: number8!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton8)
        
        buttonOption = BoardButtonOption.number(9)
        let boardButton9 = BoardButton( frame: CGRect(x: 4*width, y: 3*height, width: width, height: height), andBoardOption:buttonOption)
        let number9 = UIImage(named:"number9")
        setupButton(on: boardButton9, with: number9!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton9)
        
        buttonOption = BoardButtonOption.number(10)
        let boardButton10 = BoardButton( frame: CGRect(x: 2*width, y: 4*height, width: width, height: height), andBoardOption:buttonOption)
        let number10 = UIImage(named:"number10")
        setupButton(on: boardButton10, with: number10!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton10)
        
        buttonOption = BoardButtonOption.number(11)
        let boardButton11 = BoardButton( frame: CGRect( x: 3*width, y: 4*height, width: width, height: height), andBoardOption:buttonOption)
        let number11 = UIImage(named:"number11")
        setupButton(on: boardButton11, with: number11!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton11)
        
        buttonOption = BoardButtonOption.number(12)
        let boardButton12 = BoardButton( frame: CGRect(x: 4*width, y: 4*height, width: width, height: height), andBoardOption:buttonOption)
        let number12 = UIImage(named:"number12")
        setupButton(on: boardButton12, with: number12!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton12)
        
        //novi ciklus
        buttonOption = BoardButtonOption.red
        let boardButtonRed = BoardButton(frame: CGRect(x:0, y:5*height, width: width, height: 2*height), andBoardOption:buttonOption)
        let red = UIImage(named:"red")
        setupButton(on: boardButtonRed, with: red!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButtonRed)
        
        buttonOption = BoardButtonOption.range("1324")
        let boardButton1324 = BoardButton(frame: CGRect( x: width, y: 5*height, width: width, height: 4*height), andBoardOption:buttonOption)
        let image1324 = UIImage(named:"image1324")
        setupButton(on: boardButton1324, with: image1324!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton1324)
        
        buttonOption = BoardButtonOption.number(13)
        let boardButton13 = BoardButton( frame: CGRect( x: 2*width, y: 5*height, width: width, height: height), andBoardOption:buttonOption)
        let number13 = UIImage(named:"number13")
        setupButton(on: boardButton13, with: number13!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton13)
        
        buttonOption = BoardButtonOption.number(14)
        let boardButton14 = BoardButton( frame: CGRect(x: 3*width, y: 5*height, width: width, height: height), andBoardOption:buttonOption)
        let number14 = UIImage(named:"number14")
        setupButton(on: boardButton14, with: number14!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton14)
        
        buttonOption = BoardButtonOption.number(15)
        let boardButton15 = BoardButton( frame: CGRect(x: 4*width, y: 5*height, width: width, height: height), andBoardOption:buttonOption)
        let number15 = UIImage(named:"number15")
        setupButton(on: boardButton15, with: number15!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton15)
        
        buttonOption = BoardButtonOption.number(16)
        let boardButton16 = BoardButton( frame: CGRect(x: 2*width, y: 6*height, width: width, height: height), andBoardOption:buttonOption)
        let number16 = UIImage(named:"number16")
        setupButton(on: boardButton16, with: number16!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton16)
        
        buttonOption = BoardButtonOption.number(17)
        let boardButton17 = BoardButton( frame: CGRect( x: 3*width, y: 6*height, width: width, height: height), andBoardOption:buttonOption)
        let number17 = UIImage(named:"number17")
        setupButton(on: boardButton17, with: number17!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton17)
        
        buttonOption = BoardButtonOption.number(18)
        let boardButton18 = BoardButton( frame: CGRect(x: 4*width, y: 6*height, width: width, height: height), andBoardOption:buttonOption)
        let number18 = UIImage(named:"number18")
        setupButton(on: boardButton18, with: number18!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton18)
        
        buttonOption = BoardButtonOption.black
        let boardButtonBlack = BoardButton(frame: CGRect(x:0, y:7*height, width: width, height: 2*height), andBoardOption:buttonOption)
        let black = UIImage(named:"black")
        setupButton(on: boardButtonBlack, with: black!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButtonBlack)
        
        buttonOption = BoardButtonOption.number(19)
        let boardButton19 = BoardButton( frame: CGRect( x: 2*width, y: 7*height, width: width, height: height), andBoardOption:buttonOption)
        let number19 = UIImage(named:"number19")
        setupButton(on: boardButton19, with: number19!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton19)
        
        buttonOption = BoardButtonOption.number(20)
        let boardButton20 = BoardButton( frame: CGRect(x: 3*width, y: 7*height, width: width, height: height), andBoardOption:buttonOption)
        let number20 = UIImage(named:"number20")
        setupButton(on: boardButton20, with: number20!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton20)
        
        buttonOption = BoardButtonOption.number(21)
        let boardButton21 = BoardButton( frame: CGRect(x: 4*width, y: 7*height, width: width, height: height), andBoardOption:buttonOption)
        let number21 = UIImage(named:"number21")
        setupButton(on: boardButton21, with: number21!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton21)
        
        buttonOption = BoardButtonOption.number(22)
        let boardButton22 = BoardButton( frame: CGRect(x: 2*width, y: 8*height, width: width, height: height), andBoardOption:buttonOption)
        let number22 = UIImage(named:"number22")
        setupButton(on: boardButton22, with: number22!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton22)
        
        buttonOption = BoardButtonOption.number(23)
        let boardButton23 = BoardButton( frame: CGRect( x: 3*width, y: 8*height, width: width, height: height), andBoardOption:buttonOption)
        let number23 = UIImage(named:"number23")
        setupButton(on: boardButton23, with: number23!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton23)
        
        buttonOption = BoardButtonOption.number(24)
        let boardButton24 = BoardButton( frame: CGRect(x: 4*width, y: 8*height, width: width, height: height), andBoardOption:buttonOption)
        let number24 = UIImage(named:"number24")
        setupButton(on: boardButton24, with: number24!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton24)
        
        //novi ciklus
        buttonOption = BoardButtonOption.odd
        let boardButtonOdd = BoardButton(frame: CGRect(x:0, y:9*height, width: width, height: 2*height), andBoardOption:buttonOption)
        let odd = UIImage(named:"odd")
        setupButton(on: boardButtonOdd, with: odd!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButtonOdd)
        
        buttonOption = BoardButtonOption.range("2536")
        let boardButton2536 = BoardButton(frame: CGRect( x: width, y: 9*height, width: width, height: 4*height), andBoardOption:buttonOption)
        let image2536 = UIImage(named:"image2536")
        setupButton(on: boardButton2536, with: image2536!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton2536)
        
        buttonOption = BoardButtonOption.number(25)
        let boardButton25 = BoardButton( frame: CGRect( x: 2*width, y: 9*height, width: width, height: height), andBoardOption:buttonOption)
        let number25 = UIImage(named:"number25")
        setupButton(on: boardButton25, with: number25!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton25)
        
        buttonOption = BoardButtonOption.number(26)
        let boardButton26 = BoardButton( frame: CGRect(x: 3*width, y: 9*height, width: width, height: height), andBoardOption:buttonOption)
        let number26 = UIImage(named:"number26")
        setupButton(on: boardButton26, with: number26!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton26)
        
        buttonOption = BoardButtonOption.number(27)
        let boardButton27 = BoardButton( frame: CGRect(x: 4*width, y: 9*height, width: width, height: height), andBoardOption:buttonOption)
        let number27 = UIImage(named:"number27")
        setupButton(on: boardButton27, with: number27!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton27)
        
        buttonOption = BoardButtonOption.number(28)
        let boardButton28 = BoardButton( frame: CGRect(x: 2*width, y: 10*height, width: width, height: height), andBoardOption:buttonOption)
        let number28 = UIImage(named:"number28")
        setupButton(on: boardButton28, with: number28!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton28)
        
        buttonOption = BoardButtonOption.number(29)
        let boardButton29 = BoardButton( frame: CGRect( x: 3*width, y: 10*height, width: width, height: height), andBoardOption:buttonOption)
        let number29 = UIImage(named:"number29")
        setupButton(on: boardButton29, with: number29!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton29)
        
        buttonOption = BoardButtonOption.number(30)
        let boardButton30 = BoardButton( frame: CGRect(x: 4*width, y: 10*height, width: width, height: height), andBoardOption:buttonOption)
        let number30 = UIImage(named:"number30")
        setupButton(on: boardButton30, with: number30!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton30)
        
        buttonOption = BoardButtonOption.range("1936")
        let boardButton1936 = BoardButton(frame: CGRect(x:0, y:11*height, width: width, height: 2*height), andBoardOption:buttonOption)
        let image1936 = UIImage(named:"image1936")
        setupButton(on: boardButton1936, with: image1936!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton1936)
        
        buttonOption = BoardButtonOption.number(31)
        let boardButton31 = BoardButton( frame: CGRect( x: 2*width, y: 11*height, width: width, height: height), andBoardOption:buttonOption)
        let number31 = UIImage(named:"number31")
        setupButton(on: boardButton31, with: number31!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton31)
        
        buttonOption = BoardButtonOption.number(32)
        let boardButton32 = BoardButton( frame: CGRect(x: 3*width, y: 11*height, width: width, height: height), andBoardOption:buttonOption)
        let number32 = UIImage(named:"number32")
        setupButton(on: boardButton32, with: number32!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton32)
        
        buttonOption = BoardButtonOption.number(33)
        let boardButton33 = BoardButton( frame: CGRect(x: 4*width, y: 11*height, width: width, height: height), andBoardOption:buttonOption)
        let number33 = UIImage(named:"number33")
        setupButton(on: boardButton33, with: number33!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton33)
        
        buttonOption = BoardButtonOption.number(34)
        let boardButton34 = BoardButton( frame: CGRect(x: 2*width, y: 12*height, width: width, height: height), andBoardOption:buttonOption)
        let number34 = UIImage(named:"number34")
        setupButton(on: boardButton34, with: number34!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton34)
        
        buttonOption = BoardButtonOption.number(35)
        let boardButton35 = BoardButton( frame: CGRect( x: 3*width, y: 12*height, width: width, height: height), andBoardOption:buttonOption)
        let number35 = UIImage(named:"number35")
        setupButton(on: boardButton35, with: number35!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton35)
        
        buttonOption = BoardButtonOption.number(36)
        let boardButton36 = BoardButton( frame: CGRect(x: 4*width, y: 12*height, width: width, height: height), andBoardOption:buttonOption)
        let number36 = UIImage(named:"number36")
        setupButton(on: boardButton36, with: number36!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton36)
        
        buttonOption = BoardButtonOption.range("1st")
        let boardButton1st = BoardButton( frame: CGRect(x: 2*width, y: 13*height, width: width, height: height), andBoardOption:buttonOption)
        let image1st = UIImage(named:"image1st")
        setupButton(on: boardButton1st, with: image1st!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton1st)
        
        buttonOption = BoardButtonOption.range("2nd")
        let boardButton2nd = BoardButton( frame: CGRect( x: 3*width, y: 13*height, width: width, height: height), andBoardOption:buttonOption)
        let image2nd = UIImage(named:"image2nd")
        setupButton(on: boardButton2nd, with: image2nd!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
        addSubview(boardButton2nd)
        
        buttonOption = BoardButtonOption.range("3rd")
        let boardButton3rd = BoardButton( frame: CGRect(x: 4*width, y: 13*height, width: width, height: height), andBoardOption:buttonOption)
        let image3rd = UIImage(named:"image3rd")
        setupButton(on: boardButton3rd, with: image3rd!, border: 1, widthColor: yellow.CGColor, andBoardOption:buttonOption)
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
    
    func boardButtonTapped(button: BoardButton)
    {
        let option = button.buttonOption!
        if allowedBet  && moneyUpdater(Double(chip)){
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.number, bet: Double(chip), target: option.intValue())
            boardValues[option.stringValue()]! += Double(chip)
            boardButtons[option.stringValue()]!.setTitle(String(format: "%.1f", boardValues[option.stringValue()]!), forState: .Normal)
            print(boardValues[option.stringValue()]!)
            print(" pritisnuta \(option.stringValue()) ")
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

extension RouletteBoardControl {
    func setupButton(on button:UIButton, with image: UIImage, border width: CGFloat, widthColor color: CGColor, andBoardOption option: BoardButtonOption) {
        button.addTarget(self, action: #selector(RouletteBoardControl.boardButtonTapped(_:)), forControlEvents: .TouchDown)
        boardButtons[option.stringValue()] = button
        boardValues[option.stringValue()] = 0.0
        button.layer.borderWidth = width
        button.layer.borderColor = color
        button.setBackgroundImage(image, forState: .Normal)
    }
}
