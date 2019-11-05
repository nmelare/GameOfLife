//
//  Manager.swift
//  GameOfLife
//
//  Created by Nathalia Melare on 04/11/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import SceneKit

// Cuidar das regras do jogo
class Manager {
    
    func jailorKillerOrRevival(grid : [[Cell]], z: Int) {
        var newGrid : [[Cell]] = []
        var count = 0
        
        for y in (0..<grid.count) {
            newGrid.append([])
            for x in (0..<grid[y].count) {
                newGrid[y].append(cloneCell(oldCell: grid[y][x], z: z))
            }
        }
        
        for y in (0..<grid.count) {
            for x in (0..<grid[y].count) {
                count = janitorCheckNeighbours(grid: newGrid, x: x, y: y)
                grid[y][x].isAlive = godfatherMobsterOrderToKillOrRevive(grid: newGrid, x: x, y: y, count: count)
            }
        }
    }
    
    func janitorCheckNeighbours (grid : [[Cell]], x: Int, y: Int) -> Int {
        var count = 0
        
        if y-1 >= 0 && y-1 < grid.count {
            if x-1 >= 0 && x-1 < grid[y-1].count {
                if grid[y-1][x-1].isAlive == true {
                    count += 1
                }
            }
            if x >= 0 && x < grid[y-1].count {
                if grid[y-1][x].isAlive == true {
                    count += 1
                }
            }
            
            if x+1 >= 0 && x+1 < grid[y-1].count {
                if grid[y-1][x+1].isAlive == true {
                    count += 1
                }
            }
        }
        
        if y >= 0 && y < grid.count {
            if x-1 >= 0 && x-1 < grid[y].count {
                if grid[y][x-1].isAlive == true {
                    count += 1
                }
            }
            
            if x+1 >= 0 && x+1 < grid[y].count {
                if grid[y][x+1].isAlive == true {
                    count += 1
                }
            }
        }
        
        if y+1 >= 0 && y+1 < grid.count {
            if x-1 >= 0 && x-1 < grid[y+1].count {
                if grid[y+1][x-1].isAlive == true {
                    count += 1
                }
            }
            if x >= 0 && x < grid[y+1].count {
                if grid[y+1][x].isAlive == true {
                    count += 1
                }
            }
            
            if x+1 >= 0 && x+1 < grid[y+1].count {
                if grid[y+1][x+1].isAlive == true {
                    count += 1
                }
            }
        }
        return count
    }
    
    
    func godfatherMobsterOrderToKillOrRevive(grid : [[Cell]], x: Int, y: Int, count: Int) -> Bool {
        
        if grid[y][x].isAlive == true {
            if count <= 1 || count >= 4 {
                return false
            } else {
                return true
            }
        } else {
            if count == 3 {
                return true
            }
        }
        return false
    }
    
    func engineerCreateNewGrids(oldGrid: [[Cell]], z: Int) -> [[Cell]] {
        var newGrid : [[Cell]] = []
        var count = 0
        
        for y in (0..<oldGrid.count) {
            newGrid.append([])
            for x in (0..<oldGrid[y].count) {
                newGrid[y].append(cloneCell(oldCell: oldGrid[y][x], z: z))
                count = janitorCheckNeighbours(grid: oldGrid, x: x, y: y)
                let alive = godfatherMobsterOrderToKillOrRevive(grid: newGrid, x: x, y: y, count: count)
                newGrid[y][x].isAlive = alive
                newGrid[y][x].exists = alive
            }
        }
        
//        for y in (0..<oldGrid.count) {
//            for x in (0..<oldGrid[y].count) {
//                count = janitorCheckNeighbours(grid: newGrid, x: x, y: y)
//                oldGrid[y][x].isAlive = godfatherMobsterOrderToKillOrRevive(grid: newGrid, x: x, y: y, count: count)
//            }
//        }
        return newGrid
    }
    
    func cloneCell(oldCell: Cell, z: Int) -> Cell {
        let newCell: Cell = Cell(x: oldCell.x, y: oldCell.y, z: z)
        
        newCell.isAlive = oldCell.isAlive
        newCell.exists = false
        
        return newCell
    }
    
}
