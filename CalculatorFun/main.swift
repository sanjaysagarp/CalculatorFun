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

func mathOp(left: Int?, right: Int?, op: (Int?, Int?) throws -> Int) throws -> Int {
    return try op(left,right);
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

func multiply(arr: [Int]?) throws -> Int {
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

func mathOp(arr: [Int]?, op: ([Int])? throws -> Int) throws -> Int {
    return try op(arr);
}


func add(p1: (x1: Int, y1: Int)?, p2: (x2: Int, y2: Int)?) throws -> (Int, Int) {
    do {
        try checkNilPoint(p1, p2: p2);
        let x = try add(p1!.x1, right: p2!.x2);
        let y = try add(p1!.y1, right: p2!.y2);
        return (x,y);
    } catch NumberError.InvalidPoint {
        print("Nil Point Found");
    }
    return (0,0);
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

func add(dictionary: [Double:Double]?) throws -> [Double:Double] {
    do {
        var sumX: Double = 0;
        var sumY: Double = 0;
        for (key, value) in dictionary! {
            try checkNilEntry(Int(key), b: Int(value));
            sumX += key;
            sumY += value;
        }
        return [sumX:sumY];
    } catch NumberError.DictionaryIsNil {
        print("Dictionary is Nil");
    }
    return [0:0];
}

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

func subtract(dictionary: [Double:Double]?) throws -> [Double:Double] {
    do {
        var subX: Double = 0;
        var subY: Double = 0;
        var first = true;
        for (key, value) in dictionary! {
            try checkNilEntry(Int(key), b: Int(value));
            if first {
                subX = key;
                subY = value;
                first = false;
            } else {
                subX -= key;
                subY -= value;
            }
        }
        return [subX:subY];
    } catch NumberError.DictionaryIsNil {
        print("Dictionary is Nil");
    }
    return [0:0];
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
    if (p1 == nil || p2 == nil ) {
        throw NumberError.InvalidPoint;
    }
}

func checkDictionary(dictionary: [Int:Int]?) throws {
    if (dictionary == nil) {
        throw NumberError.DictionaryIsNil;
    }
}


// Function tests
var a: Int = 1;

var b: Int = 4;

try print(add(a,right: b)); // 5

try add(a,right: nil); // exception

try print(subtract(b, right: a)); // 3

try subtract(b, right: nil); // 3

try print(multiply(2, right: 3)); // 6

try multiply(nil, right: 3); // exception

try print(divide(6, right: 2)); // 3

try divide(6, right: nil); // exception

let c = try mathOp(7, right: 2, op: add);
print(c); // 9

try mathOp(7, right: nil, op: add); // exception

try print(add([1,2,6,4])); // 13

try print(multiply([1,2,2,3])); // 12

try print(count([1,1,1,1,1,1])); // 6

let d = try mathOp([2,2,2,2], op: add);
print(d); // 8

try mathOp(nil, op: add) // exception

var point1 = (1,2);

var point2 = (3,2)

try print(add(point1, p2: point2)); // (4,4)

try print(subtract(point2, p2: point1)); // (2,0)

try add(nil, p2: point2); // exception

let x = [
    1:3,
    2:2,
    3:6,
]

try print(add(x)); // [6:11]

var n = [Int:Int]();
try add(n); // exception

try print(subtract(x)); // [-2:-7]

let y = [
    1.0:1.2,
    2.1:3.5,
    3:5,
]

try print(add(y)); // [6.1:9.7]

try print(subtract(y)); // [-0.1:0.3]







