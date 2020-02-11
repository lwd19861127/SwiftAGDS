//
//  main.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/10/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

if let index = binarySearch([1, 2, 3, 4, 5, 6, 7, 8], 7) {
    print("Found at \(index)")
}


let _ = bubbleSort([1, 2, 3, 4, 5], <) // ascending order
let _ = bubbleSort([1, 2, 3, 4, 5], >) // descending order

