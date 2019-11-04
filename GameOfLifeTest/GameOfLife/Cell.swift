//
//  Cell.swift
//  GameOfLife
//
//  Created by Nathalia Melare on 01/11/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import SceneKit

class Cell : SCNNode {
    // Se o nosso individuo está vivo ou morto
    var isAlive: Bool {
        willSet {
            if newValue == false {
                dead()
            } else {
                alive()
            }
        }
    }
    
    func dead() {
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        self.geometry?.firstMaterial?.emission.contents = UIColor.darkGray
    }
    
    func alive() {
        self.geometry?.firstMaterial?.emission.contents = UIColor.yellow
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
    }
    
    // As coordenadas do cubo
    let x : Int
    let y : Int
    
    // Inicializando
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.isAlive = false
        super.init()
        self.geometry = SCNBox(width: 0.8 , height: 0.8,
                               length: 0.8, chamferRadius: 0.8)
        dead()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
