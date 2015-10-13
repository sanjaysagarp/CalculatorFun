//
//  main.swift
//  CalculatorFun
//
//  Created by Sanjay Sagar on 10/11/15.
//  Copyright © 2015 Sanjay Sagar. All rights reserved.
//

import Foundation

func add(left: Int?, right: Int?) throws -> Int {
    try checkNullEntry(left, b: right)
    return left! + right!;
}

func subtract(left: Int?, right: Int?) throws -> Int {
    try checkNullEntry(left, b: right)
    return left! - right!;
}

func multiply(left: Int?, right: Int?) throws -> Int {
    try checkNullEntry(left, b: right)
    return left! * right!;
}

func divide(left: Int?, right: Int?) throws -> Int {
    try checkNullEntry(left, b: right)
    return left! / right!;
}

func mathOp(left: Int?, right: Int?, op: (Int, Int) -> Int) throws -> Int {
    try checkNullEntry(left, b: right)
    return op(left!,right!);
}

func add(arr: [Int]?) throws -> Int {
    if arr == nil {
        throw NumberError.ArrayIsNil;
    }
    let a = arr!;
    var result: Int = 0;
    for (var index = 0; index < arr!.count; index++) {
        let num : Int? = a[index];
        if num == nil {
            throw NumberError.NullEntryFound;
        }
        result += num!;
    }
    return result;
}

func multiplty(arr: [Int]?) throws -> Int {
    if arr == nil {
        throw NumberError.ArrayIsNil;
    }
    let a = arr!;
    if a.count == 0 {
        return 0
    }
    var result: Int = 1;
    for num in a {
        let test: Int? = num;
        if test == nil {
            throw NumberError.NullEntryFound;
        }
        result *= num;
    }
    return result;
}

func average(arr: [Int]?) throws -> Int {
    if arr == nil {
        throw NumberError.ArrayIsNil;
    }
    let a = arr!;
    var sum: Int = 0;
    for num in a {
        let test: Int? = num;
        if test == nil {
            throw NumberError.NullEntryFound;
        }
        sum += num;
    }
    return sum / a.count;
}

func count(arr: [Int]?) throws -> Int {
    if arr == nil {
        throw NumberError.ArrayIsNil;
    }
    let a = arr!;
    return a.count;
}


func mathOp(arr: [Int]?, op: ([Int]) -> Int) throws -> Int {
    if arr == nil {
        throw NumberError.ArrayIsNil;
    }
    let a = arr!;
    return op(a);
}

func add(p1: (x1: Int, y1: Int)?, p2: (x2: Int, y2: Int)?) throws -> (Int, Int) {
    if (p1 == nil || p2 == nil) {
        throw NumberError.InvalidPoint;
    }
    let x = try add(p1!.x1, right: p2!.x2);
    let y = try add(p1!.y1, right: p2!.y2);
    return (x,y);
}

func subtract(p1: (x1: Int, y1: Int)?, p2: (x2: Int, y2: Int)?) throws -> (Int, Int) {
    if (p1 == nil || p2 == nil) {
        throw NumberError.InvalidPoint;
    }
    let x = try subtract(p1!.x1, right: p2!.x2);
    let y = try subtract(p1!.y1, right: p2!.y2);
    return (x,y);
}

//for ints
func add(dictionary: [Int:Int]?) throws -> [Int:Int] {
    if (dictionary == nil) {
        throw NumberError.DictionaryIsNil;
    }
    var sumX: Int = 0;
    var sumY: Int = 0;
    for (key, value) in dictionary! {
        let x : Int? = key;
        let y : Int? = value;
        if x == nil || y == nil {
            throw NumberError.NullEntryFound;
        }
        sumX += x!;
        sumY += y!;
    }
    return [sumX:sumY];
}

//for doubles
func add(dictionary: [Double:Double]?) throws -> [Double:Double] {
    if (dictionary == nil) {
        throw NumberError.DictionaryIsNil;
    }
    var sumX: Double = 0;
    var sumY: Double = 0;
    for (key, value) in dictionary! {
        let x : Double? = key;
        let y : Double? = value;
        if x == nil || y == nil {
            throw NumberError.NullEntryFound;
        }
        sumX += x!;
        sumY += y!;
    }
    return [sumX:sumY];
}

//for ints
func subtract(dictionary: [Int:Int]?) throws -> [Int:Int] {
    if (dictionary == nil) {
        throw NumberError.DictionaryIsNil;
    }
    var subX: Int = 0;
    var subY: Int = 0;
    var first = true;
    for (key, value) in dictionary! {
        let x : Int? = key;
        let y : Int? = value;
        if x == nil || y == nil {
            throw NumberError.NullEntryFound;
        }
        if first {
            subX = x!;
            subY = y!;
            first = false;
        } else {
            subX -= x!;
            subY -= y!;
        }
    }
    return [subX:subY];
}

//for doubles
func subtract(dictionary: [Double:Double]?) throws -> [Double:Double] {
    if (dictionary == nil) {
        throw NumberError.DictionaryIsNil;
    }
    var subX: Double = 0;
    var subY: Double = 0;
    var first = true;
    for (key, value) in dictionary! {
        let x : Double? = key;
        let y : Double? = value;
        if x == nil || y == nil {
            throw NumberError.NullEntryFound;
        }
        if first {
            subX = x!;
            subY = y!;
            first = false;
        } else {
            subX -= x!;
            subY -= y!;
        }
    }
    return [subX:subY];
}

enum NumberError: ErrorType {
    case NullEntryFound
    case DictionaryIsNil
    case ArrayIsNil
    case InvalidPoint
}

func checkNullEntry(a: Int?, b: Int?) throws {
    if a == nil || b == nil {
        throw NumberError.NullEntryFound;
    }
}



