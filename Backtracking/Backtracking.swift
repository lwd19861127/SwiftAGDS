//
//  Backtracking.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/14/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function rollDiceSum similar to rollDice,
/// but it also accepts a desired sum and prints only permutations
/// that add up to exactly that sum.
///
/// rollDiceSum(dice: 2, sum: 5)
/// [1, 4], [2, 3], [3, 2], [4, 1]
func rollDiceSumHelper(dice: Int, desiredSum: Int, soFar:Int, _ chosen: inout [Int]) {
    // base case
    if dice == 0 {
        if soFar == desiredSum {
            print(chosen)
        }
    } else {
        for i in 1...6 {
            // if the desiredSum is possible to get by choosing the rest of the dice as 1
            // and choosing the rest of the dice as 6
            if soFar + i + 1 * (dice - 1) <= desiredSum
                && soFar + i * 6 * (dice - 1) >= desiredSum {
                chosen.append(i)
                rollDiceSumHelper(dice: dice - 1, desiredSum: desiredSum, soFar: soFar + i, &chosen)
                chosen.removeLast()
            }
        }
    }
}

func rollDiceSum(dice: Int, desiredSum: Int) {
    var chosen = [Int]()
    // pass by reference (same array)
    rollDiceSumHelper(dice: 2, desiredSum: 5, soFar: 0, &chosen)
}
