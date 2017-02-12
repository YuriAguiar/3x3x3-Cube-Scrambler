//
//  Scrambler.swift
//  Cubix
//
//  Created by Yuri Aguiar on 29/01/17.
//  Copyright © 2017 Yuri Aguiar. All rights reserved.
//

import UIKit

public class Scrambler: NSObject {
    
    func scramble(intervalLength: Float) -> CubeMoves {
        let intervalLength = intervalLength
        var cubeMove: CubeMoves?
        let chance = Float(CGFloat(Float(arc4random()) / Float(UINT32_MAX)))
        
        switch chance {
        case 0...intervalLength:
            cubeMove = CubeMoves.U
        case intervalLength...(2 * intervalLength):
            cubeMove = CubeMoves.U_
        case (2 * intervalLength)...(3 * intervalLength):
            cubeMove = CubeMoves.U2
        case (3 * intervalLength)...(4 * intervalLength):
            cubeMove = CubeMoves.D
        case (4 * intervalLength)...(5 * intervalLength):
            cubeMove = CubeMoves.D_
        case (5 * intervalLength)...(6 * intervalLength):
            cubeMove = CubeMoves.D2
        case (6 * intervalLength)...(7 * intervalLength):
            cubeMove = CubeMoves.L
        case (7 * intervalLength)...(8 * intervalLength):
            cubeMove = CubeMoves.L_
        case (8 * intervalLength)...(9 * intervalLength):
            cubeMove = CubeMoves.L2
        case (9 * intervalLength)...(10 * intervalLength):
            cubeMove = CubeMoves.R
        case (10 * intervalLength)...(11 * intervalLength):
            cubeMove = CubeMoves.R_
        case (11 * intervalLength)...(12 * intervalLength):
            cubeMove = CubeMoves.R2
        case (12 * intervalLength)...(13 * intervalLength):
            cubeMove = CubeMoves.F
        case (13 * intervalLength)...(14 * intervalLength):
            cubeMove = CubeMoves.F_
        case (14 * intervalLength)...(15 * intervalLength):
            cubeMove = CubeMoves.F2
        case (15 * intervalLength)...(16 * intervalLength):
            cubeMove = CubeMoves.B
        case (16 * intervalLength)...(17 * intervalLength):
            cubeMove = CubeMoves.B_
        case (17 * intervalLength)...(18 * intervalLength):
            cubeMove = CubeMoves.B2
        default:
            scramble(intervalLength : intervalLength)
            break
        }
        
        return cubeMove!
    }
    
    func cubeScrambler(sequenceLength: Int, intervalLength: Float) -> [CubeMoves] {
        let sequenceLength = sequenceLength
        let intervalLength = intervalLength
        var scrambledSequence = [CubeMoves]()
        
        for _ in 1...sequenceLength {
            scrambledSequence.append(scramble(intervalLength: intervalLength))
        }
        
        return scrambledSequence
    }

}
