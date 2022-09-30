//
//  Saverview.swift
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

import ScreenSaver
import SpriteKit

class Saverview: ScreenSaverView {
    
    var skview: Skview?
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.animationTimeInterval = 1.0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.animationTimeInterval = 1.0
    }
    
    override var frame: NSRect {
        didSet {
            self.skview?.frame = frame
        }
    }
    
    override func startAnimation() {

        // init skview
        if self.skview == nil {
            let skview = Skview(frame: self.frame)
            
            // add scene 
            let scene = Scene(size: skview.frame.size)
            scene.blendMode = .add
            scene.backgroundColor = .black
            
            // add skview as a subview
            // skview.showsFPS = true
            // skview.showsNodeCount = true
            skview.presentScene(scene)
            self.addSubview(skview)
        }
        super.startAnimation()
    }
}
