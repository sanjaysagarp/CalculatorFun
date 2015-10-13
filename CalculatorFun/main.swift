//
//  main.swift
//  CalculatorFun
//
//  Created by Sanjay Sagar on 10/11/15.
//  Copyright © 2015 Sanjay Sagar. All rights reserved.
//

import Foundation

func add(left: Int?, right: Int?) throws -> Int {
    do {
        try checkNilEntry(left, b: right)
        return left! + right!;
    } catch NumberError.NilEntryFound {
        print("Nil entry was found");
    }
    return 0;
}

func subtract(left: Int?, right: Int?) throws -> Int {
    do {
        try checkNilEntry(left, b: right)
        return left! - right!;
    } catch NumberError.NilEntryFound {
        print("Nil entry was found");
    }
    return 0;
}

func multiply(left: Int?, right: Int?) throws -> Int {
    do {
        try checkNilEntry(left, b: right)
        return left! * right!;
    } catch NumberError.NilEntryFound {
        print("Nil entry was found");
    }
    return 0;
}

func divide(left: Int?, right: Int?) throws -> Int {
    do {
        try checkNilEntry(left, b: right)
        return left! / right!;
    } catch NumberError.NilEntryFound {
        print("Nil entry was found");
    }
    return 0;
}

func mathOp(left: Int?, right: Int?, op: (Int, Int) -> Int) throws -> Int {
    return op(left!,right!);
}

func add(arr: [Int]?) throws -> Int {
    do {
        try checkNilArray(arr);
        let a = arr!;
        var result: Int = 0;
        for num in a {
            result = try add(result,right: num);
        }
        return result;
    } catch NumberError.ArrayIsNil {
        print("Array is nil");
    }
    return 0;
}

func multiplty(arr: [Int]?) throws -> Int {
    do {
        try checkNilArray(arr);
        var result: Int = 1;
        for num in arr! {
            result = try multiply(result, right: num);
        }
        return result;
    } catch NumberError.ArrayIsNil {
        print("Array is nil");
    }
    return 0;
}

func average(arr: [Int]?) throws -> Int {
    return try add(arr) / arr!.count;
}

func count(arr: [Int]?) throws -> Int {
    do {
        try checkNilArray(arr);
    } catch {
        print("Array is nil");
    }
    return arr!.count;
}




func mathOp(arr: [Int]?, op: ([Int]) -> Int) throws -> Int {
    return op(arr!);
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
    do {
        try checkNilPoint(p1, p2: p2);
        let x = try subtract(p1!.x1, right: p2!.x2);
        let y = try subtract(p1!.y1, right: p2!.y2);
        return (x,y);
    } catch NumberError.NilEntryFound {
        print("Nil Point Found");
    }
    return (0,0);
}

//for ints
func add(dictionary: [Int:Int]?) throws -> [Int:Int] {
    do {
        var sumX: Int = 0;
        var sumY: Int = 0;
        for (key, value) in dictionary! {
            sumX = try add(sumX, right: key);
            sumY = try add(sumY, right: value);
        }
        return [sumX:sumY];
    } catch NumberError.DictionaryIsNil {
        print("Dictionary is Nil");
    }
    return [0:0];
}

//for doubles
func add(dictionary: [Double:Double]?) throws -> [Double:Double] {
    do {
        var sumX: Double = 0;
        var sumY: Double = 0;
        for (key, value) in dictionary! {
            let x : Double? = key;
            let y : Double? = value;
            if x == nil || y == nil {
                throw NumberError.NilEntryFound;
            }
            sumX += x!;
            sumY += y!;
        }
        return [sumX:sumY];
    } catch NumberError.DictionaryIsNil {
        print("Dictionary is Nil");
    }
    return [0:0];
}

//for ints
func subtract(dictionary: [Int:Int]?) throws -> [Int:Int] {
    do {
        var subX: Int = 0;
        var subY: Int = 0;
        var first = true;
        for (key, value) in dictionary! {
            if first {
                subX = key;
                subY = value;
                first = false;
            } else {
                subX = try subtract(subX, right: key);
                subY = try subtract(subY, right: value);
            }
        }
        return [subX:subY];
    } catch NumberError.DictionaryIsNil {
        print("Dictionary is Nil");
    }
    return [0:0];
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
            throw NumberError.NilEntryFound;
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
    case NilEntryFound
    case DictionaryIsNil
    case ArrayIsNil
    case InvalidPoint
}

func checkNilEntry(a: Int?, b: Int?) throws {
    if a == nil || b == nil {
        throw NumberError.NilEntryFound;
    }
}

func checkNilArray(a: [Int]?) throws {
    if a == nil {
        throw NumberError.ArrayIsNil;
    } else {
        for num in a! {
            let test: Int? = num;
            if test == nil {
                throw NumberError.NilEntryFound;
            }
        }
        
    }
}

func checkNilPoint(p1: (x1: Int, y1: Int)?, p2: (x2: Int, y2: Int)?) throws {
    if (p1 == nil || p2 == nil) {
        throw NumberError.InvalidPoint;
    }
}

func checkDictionary(dictionary: [Int:Int]?) throws {
    if (dictionary == nil) {
        throw NumberError.DictionaryIsNil;
    }
}

var a =  [
    1.0:2,
    3:2.1,
]

try add(a);


