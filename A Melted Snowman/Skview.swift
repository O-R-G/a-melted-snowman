//
//  skview.swift
//
//  Created by david reinfurt on 9/1/22.
//  Copyright © 2022 O-R-G inc. All rights reserved.
//
//  +----------------------------------+
//  | Saverview [ScreenSaverView]      |
//  | +------------------------------+ |
//  | | Skview [SKView]              | |
//  | | +--------------------------+ | |
//  | | | Scene [SKScene]          | | |
//  | | | +----------------------+ | | |
//  | | | | Node [SKEmitterNode] | | | |
//  | | | |                      | | | |
//  | | | +----------------------+ | | |
//  | | +--------------------------+ | |
//  | +------------------------------+ |
//  +----------------------------------+
//

import SpriteKit

class Skview: SKView {
    
    override var acceptsFirstResponder: Bool { 
        return false 
    }
    
    override var frame: NSRect {
        didSet {
            self.scene?.size = frame.size
        }
    }
}
