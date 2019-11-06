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
    var grid = [[Cell]]()
    var gridIndividual = [[[Cell]]]()
    var manager = Manager()
    var size : Int = 16
    let offset: Int = 8
    
    
    override init() {
        super.init()
        
        // Populando a matriz
        for row:Int in 0...size {
            // fazendo linhas com elementos
            var singleRow = [Cell]()
            
            for col:Int in 0...size {
  
                let individual = Cell(x: col, y: row, z: 0)
                
                individual.position.x = Float(row - offset)
                individual.position.y = Float(col - offset)
                
                singleRow.append(individual)
                
                self.rootNode.addChildNode(individual)
            }
            // Adiciona essas linhas dentro da matriz
            grid.append(singleRow)
            gridIndividual.append(self.grid)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func zlayerController(_ interaction: Int) {
        let newGrid = manager.engineerCreateNewGrids(oldGrid: grid, z: interaction)
        createNewGrid(newGrid, interaction)
        grid = newGrid
    }
    
    func createNewGrid(_ newGrid: [[Cell]], _ interaction: Int) {
        for row:Int in 0...size {
            for col:Int in 0...size {
                let individual = newGrid[row][col]
                individual.position.x = Float(row - offset)
                individual.position.y = Float(col - offset)
                individual.position.z = Float(Double(interaction) * (0.8 + 0.3))
                                
                if (individual.exists) {
                    self.rootNode.addChildNode(individual)
                }
            }
        }
    }
}
