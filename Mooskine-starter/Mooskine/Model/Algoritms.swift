//
//  Algoritms.swift
//  Mooskine
//
//  Created by GLB-253 on 11/1/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation



func horMirror(_ s: String) -> String {
    return s.components(separatedBy: "\n").reversed().joined(separator: "\n")
}

func vertMirror(_ s: String) -> String {
    return s.components(separatedBy: "\n").map({ String($0.characters.reversed()) }).joined(separator: "\n")
}

func oper(_ f: (String) -> (String), _ s: String) -> String {
    return f(s)
}

func nbDig(_ n: Int, _ d: Int)  {
    let k = (0 ... n)
    print(k)
    let ksq = k.map{ $0 * $0 }
    print(ksq)
    let kstrA = ksq.map{ "\($0)" }
    print(kstrA)
    let kstr = kstrA.reduce("", +)
    print(kstr)
    let fkstr = kstr.filter{ "\($0)" == "\(d)" }
    print(fkstr.count)
    
    
}

func dontGiveMeFive(_ start: Int, _ end: Int) -> Int {
    var count = 0
    for i in start...end {
        if String(i).contains("5"){
            print(i)
            count += 1
        }
        
    }
    return count
}

func findOutlier(_ array: [Int]) -> Int {
    
    let arrayofEvenumbers = array.filter({$0 % 2 == 0})
    let arrayofOddnumbers = array.filter({$0 % 2 != 0})
    
    if arrayofOddnumbers.count < arrayofOddnumbers.count {
        return arrayofOddnumbers[0]
    }
    else {
        return arrayofEvenumbers[0]
    }
}

func findSum(_ n: Int) -> Int {
    
    var sum = 0
    
    for i in 0...n {
        if i % 3 == 0 || i % 5 == 0 {
            sum = sum + i
        }
    }
    return sum
}

 func diamonds(_ size: Int) -> String{
    let diamondSize = size + 2
    var diamondString = ""
    if diamondSize < 0 || diamondSize % 2 == 0 {
        return "null"
    }
    
    
    
    for i in 1...diamondSize/2 {
        for _ in 0..<diamondSize/2 - i {
            diamondString += " "
        }
        for _ in 0..<2*i-1 {
            diamondString += "*"
        }
        
        
        diamondString += "\n"
    }
    
    
    for k in stride(from: diamondSize/2 - 1 , to: 0, by: -1) {
        
        for _ in 0..<diamondSize/2 - k {
            diamondString += " "
        }
        for _ in 0..<2*k-1  {
            diamondString += "*"
        }
        diamondString += "\n"
        
    }
    
    
    return diamondString
}
func diamond(_ size: Int) -> String? {
    guard size > 0 && size % 2 == 1 else {
        return nil
    }
    var diamond = ""
    let centerRow = size/2 + 1
    for row in 1...size {
        let spaces = abs(centerRow - row)
        diamond += String(repeating: " ", count: spaces) + String(repeating: "*", count: size-spaces*2) + "\n"
    }
    return diamond
}


