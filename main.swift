//
//  main.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/10/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

var uniquePermuations = Set<String>()
permutationUnique("aabbcd", "", &uniquePermuations)
print(uniquePermuations)
