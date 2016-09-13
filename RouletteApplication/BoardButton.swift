//
//  BoardButton.swift
//  RouletteApplication
//
//  Created by Nenad Jelic on 9/13/16.
//  Copyright © 2016 imac21. All rights reserved.
//

import Foundation
import UIKit

class BoardButton: UIButton {
    var buttonOption: BoardButtonOption?
    
    convenience init(frame: CGRect, andBoardOption option: BoardButtonOption) {
        self.init(frame: frame)
        self.buttonOption = option
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}