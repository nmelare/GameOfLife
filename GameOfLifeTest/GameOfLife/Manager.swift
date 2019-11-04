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
    
    func jailorKillerOrRevival(grid : [[Cell]]) -> [[Cell]] {
        var newGrid : [[Cell]] = []
        var count = 0
        
        for y in (0..<grid.count) {
            newGrid.append([])
            for x in (0..<grid[y].count) {
                newGrid[y].append(grid[y][x])
            }
        }
        for y in (0..<grid.count) {
            for x in (0..<grid[y].count) {
                count = janitorCheckNeighbours(grid: grid, x: x, y: y)
                newGrid[y][x] = godfatherMobsterOrderToKillOrRevive(grid: grid, x: x, y: y, count: count)
            }
        }
        return newGrid
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
    
    
    func godfatherMobsterOrderToKillOrRevive(grid : [[Cell]], x: Int, y: Int, count: Int) -> Cell {
        
        if grid[y][x].isAlive == true {
            if count <= 1 || count >= 4 {
                grid[y][x].isAlive = false
            }
        } else if grid[y][x].isAlive == false {
            if count == 3 {
                grid[y][x].isAlive = true
            }
        }
        return grid[y][x]
    }
    
}
