//
//  Checker.swift
//  Cubix
//
//  Created by Yuri Aguiar on 29/01/17.
//  Copyright © 2017 Yuri Aguiar. All rights reserved.
//

import UIKit

class Checker: NSObject {
    
    var duplicateMovesLight = Semaphore.RED_LIGHT
    var undoMovesLight = Semaphore.RED_LIGHT
    var tripleMovesLight = Semaphore.RED_LIGHT
    var allClear = Semaphore.RED_LIGHT
    
    var didFindDuplicateMove = false
    var didFindUndoMove = false
    var didFindTripleMove = false
    
    var scrambler = Scrambler()
    
    func checkDuplicateMoves(intervalLength : Float, scrambledSequence : [CubeMoves]) -> [CubeMoves] {
        var scrambledSequence = scrambledSequence
        
        for (index, _) in scrambledSequence.enumerated() {
            if index < (scrambledSequence.count - 1) {
                if scrambledSequence[index] == scrambledSequence[index + 1] {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindDuplicateMove = true
                }
            }
        }
        
        if didFindDuplicateMove == true {
            duplicateMovesLight = Semaphore.RED_LIGHT
        } else {
            duplicateMovesLight = Semaphore.YELLOW_LIGHT
        }
        
        didFindDuplicateMove = false
        
        return scrambledSequence
    }
    
    func checkUndoMoves(intervalLength : Float, scrambledSequence : [CubeMoves]) -> [CubeMoves] {
        var scrambledSequence = scrambledSequence
        
        for (index, _) in scrambledSequence.enumerated() {
            if index < (scrambledSequence.count - 1) {
                if (scrambledSequence[index] == CubeMoves.U && scrambledSequence[index + 1] == CubeMoves.U_) || (scrambledSequence[index] == CubeMoves.U_ && scrambledSequence[index + 1] == CubeMoves.U) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindUndoMove = true
                    
                } else if (scrambledSequence[index] == CubeMoves.D && scrambledSequence[index + 1] == CubeMoves.D_) || (scrambledSequence[index] == CubeMoves.D_ && scrambledSequence[index + 1] == CubeMoves.D) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindUndoMove = true
                    
                } else if (scrambledSequence[index] == CubeMoves.L && scrambledSequence[index + 1] == CubeMoves.L_) || (scrambledSequence[index] == CubeMoves.L_ && scrambledSequence[index + 1] == CubeMoves.L) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindUndoMove = true
                    
                } else if (scrambledSequence[index] == CubeMoves.R && scrambledSequence[index + 1] == CubeMoves.R_) || (scrambledSequence[index] == CubeMoves.R_ && scrambledSequence[index + 1] == CubeMoves.R) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindUndoMove = true
                    
                } else if (scrambledSequence[index] == CubeMoves.F && scrambledSequence[index + 1] == CubeMoves.F_) || (scrambledSequence[index] == CubeMoves.F_ && scrambledSequence[index + 1] == CubeMoves.F) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindUndoMove = true
                    
                } else if (scrambledSequence[index] == CubeMoves.B && scrambledSequence[index + 1] == CubeMoves.B_) || (scrambledSequence[index] == CubeMoves.B_ && scrambledSequence[index + 1] == CubeMoves.B) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindUndoMove = true
                    
                }
            }
        }
        
        if didFindUndoMove == true {
            undoMovesLight = Semaphore.RED_LIGHT
        } else {
            undoMovesLight = Semaphore.YELLOW_LIGHT
        }
        
        didFindUndoMove = false
        
        return scrambledSequence
    }
    
    func checkTripleMoves(intervalLength : Float, scrambledSequence : [CubeMoves]) -> [CubeMoves] {
        var scrambledSequence = scrambledSequence
        
        for (index, _) in scrambledSequence.enumerated() {
            if index < (scrambledSequence.count - 1) {
                if ((scrambledSequence[index] == CubeMoves.U || scrambledSequence[index] == CubeMoves.U_) && scrambledSequence[index + 1] == CubeMoves.U2) || (scrambledSequence[index] == CubeMoves.U2 && (scrambledSequence[index + 1] == CubeMoves.U || scrambledSequence[index + 1] == CubeMoves.U_)) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindTripleMove = true
                    
                } else if ((scrambledSequence[index] == CubeMoves.D || scrambledSequence[index] == CubeMoves.D_) && scrambledSequence[index + 1] == CubeMoves.D2) || (scrambledSequence[index] == CubeMoves.D2 && (scrambledSequence[index + 1] == CubeMoves.D || scrambledSequence[index + 1] == CubeMoves.D_)) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindTripleMove = true
                    
                } else if ((scrambledSequence[index] == CubeMoves.L || scrambledSequence[index] == CubeMoves.L_) && scrambledSequence[index + 1] == CubeMoves.L2) || (scrambledSequence[index] == CubeMoves.L2 && (scrambledSequence[index + 1] == CubeMoves.L || scrambledSequence[index + 1] == CubeMoves.L_)) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindTripleMove = true
                    
                } else if ((scrambledSequence[index] == CubeMoves.R || scrambledSequence[index] == CubeMoves.R_) && scrambledSequence[index + 1] == CubeMoves.R2) || (scrambledSequence[index] == CubeMoves.R2 && (scrambledSequence[index + 1] == CubeMoves.R || scrambledSequence[index + 1] == CubeMoves.R_)) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindTripleMove = true
                    
                } else if ((scrambledSequence[index] == CubeMoves.F || scrambledSequence[index] == CubeMoves.F_) && scrambledSequence[index + 1] == CubeMoves.F2) || (scrambledSequence[index] == CubeMoves.F2 && (scrambledSequence[index + 1] == CubeMoves.F || scrambledSequence[index + 1] == CubeMoves.F_)) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindTripleMove = true
                    
                } else if ((scrambledSequence[index] == CubeMoves.B || scrambledSequence[index] == CubeMoves.B_) && scrambledSequence[index + 1] == CubeMoves.B2) || (scrambledSequence[index] == CubeMoves.B2 && (scrambledSequence[index + 1] == CubeMoves.B || scrambledSequence[index + 1] == CubeMoves.B_)) {
                    
                    scrambledSequence[index] = scrambler.scramble(intervalLength : intervalLength)
                    didFindTripleMove = true
                    
                }
            }
        }
        
        if didFindTripleMove == true {
            tripleMovesLight = Semaphore.RED_LIGHT
        } else {
            tripleMovesLight = Semaphore.YELLOW_LIGHT
        }
        
        didFindTripleMove = false
        
        return scrambledSequence
    }
    
    func checkSequence(scrambledSequence : [CubeMoves], intervalLength : Float) -> [CubeMoves] {
        let intervalLength = intervalLength
        var scrambledSequence = scrambledSequence
        
        while allClear != Semaphore.GREEN_LIGHT {
            
            scrambledSequence = checkDuplicateMoves(intervalLength : intervalLength, scrambledSequence : scrambledSequence)
            scrambledSequence = checkUndoMoves(intervalLength : intervalLength, scrambledSequence : scrambledSequence)
            scrambledSequence = checkTripleMoves(intervalLength : intervalLength, scrambledSequence : scrambledSequence)
            
            if (duplicateMovesLight == Semaphore.RED_LIGHT) || (undoMovesLight == Semaphore.RED_LIGHT) || (tripleMovesLight == Semaphore.RED_LIGHT) {
                
                duplicateMovesLight = Semaphore.RED_LIGHT
                undoMovesLight = Semaphore.RED_LIGHT
                tripleMovesLight = Semaphore.RED_LIGHT
                
            } else if (duplicateMovesLight == Semaphore.YELLOW_LIGHT) && (undoMovesLight == Semaphore.YELLOW_LIGHT) && (tripleMovesLight == Semaphore.YELLOW_LIGHT) {
                
                allClear = Semaphore.GREEN_LIGHT
            }
        }
        
        duplicateMovesLight = Semaphore.RED_LIGHT
        undoMovesLight = Semaphore.RED_LIGHT
        tripleMovesLight = Semaphore.RED_LIGHT
        allClear = Semaphore.RED_LIGHT
        
        return scrambledSequence
    }

}
