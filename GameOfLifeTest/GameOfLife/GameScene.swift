//
//  GameScene.swift
//  GameOfLife
//
//  Created by Nathalia Melare on 31/10/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import SceneKit

class GameScene: SCNScene {
    
    override init() {
        super.init()

            for xIndex:Int in 0...32 {
                for yIndex:Int in 0...32 {
                    let box = SCNBox(width: 0.6 , height: 0.6,
                                             length: 0.1, chamferRadius: 0.005)
                      box.firstMaterial?.diffuse.contents = UIColor.red
                      box.firstMaterial?.emission.contents = UIColor.darkGray
                      let boxnode = SCNNode(geometry: box)
                      let offset: Int = 10
                    let boxCopy = boxnode.copy() as! SCNNode
                    boxCopy.position.x = Float(xIndex - offset)
                    boxCopy.position.y = Float(yIndex - offset)
                    self.rootNode.addChildNode(boxCopy)
                }
            }
        }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
