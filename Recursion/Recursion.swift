//
//  Recursion.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/11/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

// 1. power(base, exponent): base^exponent
// assume exponent >= 0
func power(base: Int, exponent: Int) -> Int {
    // base case
    if exponent == 0 { return 1 }
    // recursive case
    return base * power(base: base, exponent: exponent - 1)
}

// 2. isPalindrome(word): check if a word is palindrome
// "racecar" -> true
// "hello" -> false
func isPalindrome(_ word: String) -> Bool {
    // base case
    if word.count <= 1 { return true }
    // recursive case (how is this self-similar?)
    if let first = word.first, let last = word.last, first == last {
        return isPalindrome(word[1, word.count-1])
    }
    return false
}

// 3. printBinary(int): prints binary form of given int input
func printBinary(_ num: Int) {
    // if negative number, just add "-" at the front
    if num < 0 {
        print("-", terminator: "")
        printBinary(-num)
        return
    }
    // base case
    if num < 2 {
        print(num, terminator: "") // print without newline
        return
    }
    // recursive
    printBinary(num / 2)
    print(num % 2, terminator: "")
}

// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want.
func reverseLines(_ line: Int) {
    let contents = try! String(contentsOfFile: "/Users/park/Desktop/SwiftAlgorithmsDataStructures/SwiftAlgorithmsDataStructures/Recursion/story.txt", encoding: .utf8)
    let _ = contents.split(separator: "\n")
    // MARK: - YOUR RECURSIVE CODE
    
}

/// 5. evaluate
/// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
/// - The expression will be "fully parenthesized" and will  consist of + and * on single-digit integers only.
/// - You can use a helper function. (Do not change the original function header)
/// - Use Recursion
/// evaluate("7")                 -> 7
/// evaluate("(2+2)")             -> 4
/// evaluate("(1+(2*4))")         -> 9
/// evaluate("((1+3)+((1+2)*5))") -> 19
func evaluateHelperExt(_ expr: String, _ i: inout Int) -> Int {
    if Character(expr[i]).isNumber {
        return Int(expr[i])!
    } else {
        i += 1 // skip (
        let left = evaluateHelperExt(expr, &i)
        i += 1
        let op = expr[i] // +, *
        i += 1
        let right = evaluateHelperExt(expr, &i)
        i += 1 // skip )
        if op == "+" {
            return left + right
        } else {
            return left * right
        }
    }
}

func evaluateExt(_ expr: String) -> Int {
    var i = 0
    return evaluateHelperExt(expr, &i)
}

/// Without String extension
func evaluateHelper(_ expr: String, _ i: inout String.Index) -> Int {
    if expr[i].isNumber {
        return Int(String(expr[i]))!
    } else {
        i = expr.index(after: i)
        let leftExpr = evaluateHelper(expr, &i)
        i = expr.index(after: i)
        let op = String(expr[i])
        i = expr.index(after: i)
        let rightExpr = evaluateHelper(expr, &i)
        i = expr.index(after: i)
        if op == "+" {
            return leftExpr + rightExpr
        } else {
            return leftExpr * rightExpr
        }
    }
}

func evaluate(_ expr: String) -> Int {
    var i = expr.startIndex
    return evaluateHelper(expr, &i)
}
