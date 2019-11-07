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
            self.geometry?.firstMaterial?.diffuse.contents = newValue ? UIColor.yellow : UIColor.red
            self.geometry?.firstMaterial?.emission.contents = newValue ? UIColor.yellow : UIColor.darkGray
        }
    }
    var exists: Bool = true

    func thanos() {
        self.geometry?.firstMaterial = nil
    }
    
    // As coordenadas do cubo
    let x : Int
    let y : Int
    let z : Int
    
    // Inicializando
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
        self.isAlive = false
        super.init()
        self.geometry = SCNBox(width: 0.8 , height: 0.8,
                               length: 0.8, chamferRadius: 0.8)
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
