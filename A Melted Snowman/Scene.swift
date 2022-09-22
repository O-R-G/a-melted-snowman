//
//  Scene.swift
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

class Scene: SKScene {
    
    override var acceptsFirstResponder: Bool { 
        return false 
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        addskemitternodeprogram()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMove(to view: SKView) {
        self.resignFirstResponder()
        self.isUserInteractionEnabled = false
    }
    
    override func update(_ currentTime: TimeInterval) {
    }

    private func addskemitternodeprogram() {
        let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        let range = CGVector(dx: frame.size.width, dy: frame.size.height)
        let size = 50

        let node = SKEmitterNode()                      

        node.position = center

        node.particleBirthRate = 40.0
        node.numParticlesToEmit = 0

        node.particleLifetime = 8.0
        node.particleLifetimeRange = 0.0      

        node.particlePositionRange = range
        node.particleZPosition = 0.0

        node.emissionAngle = 269.863 * .pi/180
        node.emissionAngleRange = 22.918 * .pi/180        

        node.particleSpeed = 80.0
        node.particleSpeedRange = 100.0

        node.xAcceleration = 0.0
        node.yAcceleration = -10.0

        node.particleAlpha = 1
        node.particleAlphaRange = 0.2
        node.particleAlphaSpeed = 0.0

        node.particleScale = 0.2
        node.particleScaleRange = 0.2
        node.particleScaleSpeed = 0.0

        node.particleRotation = 0.0
        node.particleRotationRange = 0.0
        node.particleRotationSpeed = 0.0

        node.particleColorBlendFactor = 1.0
        node.particleColorBlendFactorRange = 0.0
        node.particleColorBlendFactorSpeed = 0.0

        node.particleBlendMode = SKBlendMode.add 
        node.fieldBitMask = 0x00000000

        node.particleColor = .white
        node.particleSize = CGSize(width: size, height: size)

        // requires explicit path to .saver bundle
        let bundle = Bundle(for: Saverview.self)
        let path = bundle.path(forResource: "spark", ofType: "png")!
        let texture = SKTexture(imageNamed: path)
        node.particleTexture = texture

        self.addChild(node) 
    }
}
