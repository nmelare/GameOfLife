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
    
    // Nossa matriz (que vai ser nossa grid) inicializada vazia
    var individuals = [[Cell]]()
    
    override init() {
        super.init()
        
        // Populando a matriz
        for row:Int in 0...32 {
            // fazendo linhas com elementos
            var singleRow = [Cell]()
            
            for col:Int in 0...32 {
                
                let individual = Cell(x: col, y: row)
                
                let offset: Int = 16
                
                individual.position.x = Float(row - offset)
                individual.position.y = Float(col - offset)
                
                singleRow.append(individual)
                
                self.rootNode.addChildNode(individual)
            }
            // Adiciona essas linhas dentro da matriz
            individuals.append(singleRow)
        }
        // Cada vez que o código percorre esse for, nos adicionamos uma coluna dentro da matriz
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
