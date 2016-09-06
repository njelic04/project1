//
//  ViewController.swift
//  RouletteApplication
//
//  Created by imac21 on 8/27/16.
//  Copyright © 2016 imac21. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var rouletteWheelImage: UIImageView!
    @IBOutlet weak var chipNumberSelection: UIPickerView!
    @IBOutlet weak var rouletteBoard: RouletteBoardControl!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var historyTrackLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var wheelTimer = NSTimer()
    var idleTimer = NSTimer()
    var winTimer = NSTimer()
    var chipNumbers = [1,2,5,10,15,20]
    var isRotating = false
    var counter = 15
    var flashCounter = 10
    var money = 1000.0
    var chip  = 1
    var winNumber = 0
    var historyTrack = [Int]()
    var result = 0.0
    
    let lenghtMultiplier: CGFloat = 3.0
    let whiteColor = UIColor.whiteColor().CGColor
    let replicatorLayer = CAReplicatorLayer()
    let instanceLayer = CALayer()
    let fadeAnimation = CABasicAnimation(keyPath: "opacity")
    
    //var boardControl = RouletteBoardControl()
    
    // MARK: Replicator methods
    
    func setUpReplicatorLayer() {
        replicatorLayer.frame = rouletteWheelImage.bounds
        let count = 30
        replicatorLayer.instanceCount = 30
        replicatorLayer.preservesDepth = false
        replicatorLayer.instanceColor = whiteColor
        //replicatorLayer.instanceRedOffset = 1.0
        //replicatorLayer.instanceGreenOffset = 1.0
        //replicatorLayer.instanceAlphaOffset = 1.0
        //replicatorLayer.instanceBlueOffset = 1.0
        let angle = Float(M_PI * 2.0) / Float(count)
        
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        rouletteWheelImage.layer.addSublayer(replicatorLayer)
    }
    
    func setUpInstanceLayer() {
        let layerWidth = CGFloat(5.0)
        let midX = CGRectGetMidX(rouletteWheelImage.bounds) - layerWidth / 2.0
        instanceLayer.frame = CGRect(x: midX, y: 0.0, width: layerWidth, height: layerWidth * lenghtMultiplier)
        instanceLayer.backgroundColor = whiteColor
    }
    
    func setUpLayerFadeAnimation() {
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        fadeAnimation.repeatCount = Float(Int.max)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpReplicatorLayer()
        setUpInstanceLayer()
    }
    
    // MARK: PickerView methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return chipNumbers.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(chipNumbers[row])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(chipNumbers[row])
        chip = chipNumbers[row]
        //RouletteCalculator.Engine.setChipValue(chip: chip)
        rouletteBoard.setChip(chip: chip)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moneyLabel.text = "\(money)"
        timerLabel.text = "15"
        rouletteBoard.setMoney(money: money)
        rouletteBoard.allowBet()
        
        winLabel.text = ""
        historyTrackLabel.text = ""
        resultLabel.text = ""
        
        self.chipNumberSelection.delegate = self
        self.chipNumberSelection.dataSource = self
        
        setUpReplicatorLayer()
        rouletteWheelImage.layer.addSublayer(replicatorLayer)
        setUpInstanceLayer()
        replicatorLayer.addSublayer(instanceLayer)
        setUpLayerFadeAnimation()
        replicatorLayer.hidden = true
        view.addSubview(rouletteWheelImage)
        
        idle() 
        }
    
    func resetRouletteBoard() {
        RouletteCalculator.Engine.RouletteReset()
        rouletteBoard.resetRouletteBoard()
        rouletteBoard.resetRouletteChipValues()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Triggered action
    
    func setLayerFadeAnimation() {
        instanceLayer.opacity = 0.0
        fadeAnimation.duration = CFTimeInterval(2.0)
        instanceLayer.addAnimation(fadeAnimation, forKey: "FadeAnimation")
    }
    
    // MARK: Selector methods
    
    func countdown() {
        
        if counter > 0 {
            counter = counter-1
            timerLabel.text = "\(counter)"
        }
        else
        {
            wheelTimer.invalidate()
            replicatorLayer.hidden = true
            winNumber = Int(arc4random_uniform(37))
            print(winNumber)
            winLabel.text = "\(winNumber)"
            historyTrack.append(winNumber)
            printHistoryBar()
            result = RouletteCalculator.Engine.calculateWin(winNumber: winNumber)
            
            //put your code which should be executed with a delay here
            
            self.resultLabel.text = "\(result)"
            print("result:\(result)")
            winEffect()
            money += result
            rouletteBoard.setMoney(money: money)
            print("money:\(money)")
            moneyLabel.text = "\(money)"
            timerLabel.text = "15"
            rouletteBoard.allowBet()
            RouletteCalculator.Engine.RouletteReset()
            rouletteBoard.resetRouletteBoard()
            rouletteBoard.resetRouletteChipValues()
        }
        
        
        
    }
    
    func moneyChecker() {
        money = rouletteBoard.getMoney()
        moneyLabel.text = "\(money)"
    }
    
    func highlight() {
        flashCounter = flashCounter + 1
        if flashCounter < 10 {
            rouletteBoard.stopBet()
            if flashCounter % 2 == 0 {
                resultLabel.text = ""
            } else {
                resultLabel.text = "\(result)"
            }
        } else {
            winTimer.invalidate()
            rouletteBoard.allowBet()
        }
    }
    
    // MARK: Internal methods
    
    func winEffect() {
        flashCounter = 0
        winTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(highlight), userInfo: nil, repeats: true)
        resultLabel.text = "\(result)"
    }
    
    func idle() {
        idleTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.moneyChecker), userInfo: nil, repeats: true)
        money = rouletteBoard.getMoney()
    }
    
    func printHistoryBar() {
        var text = ""
        for number in historyTrack {
            text += " \(number)"
        }
        historyTrackLabel.text = text
    }
    
    func moneyUpdater(amount: Double ) {
        if money - amount < 0 {
            rouletteBoard.stopBet()
        } else {
            money = money - amount
            rouletteBoard.setMoney(money: money)
        }
    }
    
    // MARK: Actions
    
    @IBAction func addMoney1000(sender: UIButton) {
        
        money = rouletteBoard.getMoney()
        money += 1000.0
        rouletteBoard.setMoney(money: money)
        moneyLabel.text = "\(money)"
        rouletteBoard.allowBet()
    }
    
    
    // MARK: Gesture Tap Actions
    
    @IBAction func rouletteWheelTap(sender: UITapGestureRecognizer) {
        counter = 15
        rouletteBoard.stopBet()
        winLabel.text = ""
        resultLabel.text = ""
        replicatorLayer.hidden = false
        setLayerFadeAnimation()
        
        wheelTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func zeroJeuxTap(sender: UITapGestureRecognizer) {
        if rouletteBoard.allowedBet {
            print("tapnuo sam zero jeu")
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.jeuZero, bet:  Double(4 * chip), target: 0)
            moneyUpdater(Double(4 * chip))
            rouletteBoard.drawJeuZero(bet: Double(4 * chip))
        }
        
    }
    
    @IBAction func voisinsDuZeroTap(sender: UITapGestureRecognizer) {
        if rouletteBoard.allowedBet {
            print("tapnuo sam veliku seriju")
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.voisinsDuZero, bet: (9 * Double(chip)), target: 0)
            moneyUpdater(Double(9 * chip))
            rouletteBoard.drawVoisinsDuZero(bet: 9 * Double(chip))
        }
        
    }
    
    @IBAction func orphanelsTap(sender: UITapGestureRecognizer) {
        if rouletteBoard.allowedBet {
            print("tapnuo sam orfanele")
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.orphelins, bet: (5 * Double(chip)), target: 0)
            moneyUpdater( Double(5 * chip))
            rouletteBoard.drawOrphelins(bet: 5 * Double(chip))
        }
    }
    
    @IBAction func tierDuCylindreTap(sender: UITapGestureRecognizer) {
        if rouletteBoard.allowedBet {
            print("tapnuo sam malu seriju")
            RouletteCalculator.Engine.bet(type: RouletteCalculator.BetTypes.tierDuCylindre, bet: (6 * Double(chip)), target: 0)
            moneyUpdater( Double(6 * chip))
            rouletteBoard.drawTierDuCylindre(bet: 6 * Double(chip))
        }
    }
}



