//
//  RationalNumber.swift
//  Point24
//
//  Created by Mr. Apple on 10/4/20.
//  Copyright © 2020 Mr. Apple. All rights reserved.
//

import Foundation

class RationalNumber {
    var p: Int = 0, q: Int = 1
    var expr: String = ""
    init() {
        p = 0
        q = 1
        expr = toString()
    }
    init(_ n: Int) {
        p = n
        q = 1
        expr = toString()
    }
    init(_ p: Int, _ q: Int) {
        self.p = p
        self.q = q
        simplify(&self.p, &self.q)
        expr = toString()
    }
    
    private func gcd(x: Int, _ y : Int) -> Int {
        if y == 0 {
            return x == 0 ? 1 : abs(x)
        }
        return gcd(abs(y), abs(x) % abs(y))
    }
    private func simplify(inout x: Int, inout _ y: Int) {
        if y < 0 {
            x = -x
            y = -y
        }
        let gcdx = gcd(x, y)
        x /= gcdx
        y /= gcdx
    }
    
    func add(b: RationalNumber) -> RationalNumber {
        let gcdq: Int = gcd(self.q, b.q)
        var ansq: Int = self.q / gcdq * b.q
        var ansp: Int = self.p * (ansq / self.q) + b.p * (ansq / b.q)
        simplify(&ansp, &ansq)
        let ret = RationalNumber(ansp, ansq)
        var lpart = self.expr
        var rpart = b.expr
        if self.isExpr() {
            lpart = "(" + lpart + ")"
        }
        if b.isExpr() {
            rpart = "(" + rpart + ")"
        }
        ret.expr = lpart + "+" + rpart
        return ret
    }
    func sub(b: RationalNumber) -> RationalNumber {
        let invb = RationalNumber(-b.p, b.q)
        
        let ret = self.add(invb)
        var lpart = self.expr
        var rpart = b.expr
        if self.isExpr() {
            lpart = "(" + lpart + ")"
        }
        if b.isExpr() {
            rpart = "(" + rpart + ")"
        }
        ret.expr = lpart + "-" + rpart
        return ret
    }
    func mul(b: RationalNumber) -> RationalNumber {
        var p1: Int = self.p
        var q1: Int = self.q
        var p2: Int = b.p
        var q2: Int = b.q
        simplify(&p1, &q1)
        simplify(&p2, &q2)
        simplify(&p1, &q2)
        simplify(&p2, &q1)
        var ansp: Int = p1 * p2
        var ansq: Int = q1 * q2
        simplify(&ansp, &ansq)
        ///return RationalNumber(ansp, ansq)
        let ret = RationalNumber(ansp, ansq)
        var lpart = self.expr
        var rpart = b.expr
        if self.isExpr() {
            lpart = "(" + lpart + ")"
        }
        if b.isExpr() {
            rpart = "(" + rpart + ")"
        }
        ret.expr = lpart + "*" + rpart
        return ret
    }
    func div(b: RationalNumber) -> RationalNumber {
        if b.q == 0 {
            return RationalNumber(1)
        }
        let invb = RationalNumber(b.q, b.p)
        let ret = self.mul(invb)
        var lpart = self.expr
        var rpart = b.expr
        if self.isExpr() {
            lpart = "(" + lpart + ")"
        }
        if b.isExpr() {
            rpart = "(" + rpart + ")"
        }
        ret.expr = lpart + "/" + rpart
        return ret
    }
    
    func compareTo(b: RationalNumber) -> Int {
        let dif = self.sub(b)
        return dif.p == 0 ? 0 : (dif.p < 0 ? -1 : 1)
    }
    
    func toString() -> String {
        if self.q == 1 {
            return "\(p)"
        }
        return "\(p)/\(q)"
    }
    func isExpr() -> Bool {
        var flg: Bool = true
        for chr in expr.characters {
            switch chr {
            case "0"..."9":
                break
            default:
                flg = false
            }
        }
        return !flg
    }
}

func + (left: RationalNumber, right: RationalNumber) -> RationalNumber {
    return left.add(right)
}
func + (left: Int, right: RationalNumber) -> RationalNumber {
    return RationalNumber(left).add(right)
}
func + (left: RationalNumber, right: Int) -> RationalNumber {
    return left.add(RationalNumber(right))
}
func - (left: RationalNumber, right: RationalNumber) -> RationalNumber {
    return left.sub(right)
}
func - (left: Int, right: RationalNumber) -> RationalNumber {
    return RationalNumber(left).sub(right)
}
func - (left: RationalNumber, right: Int) -> RationalNumber {
    return left.sub(RationalNumber(right))
}
func * (left: RationalNumber, right: RationalNumber) -> RationalNumber {
    return left.mul(right)
}
func * (left: Int, right: RationalNumber) -> RationalNumber {
    return RationalNumber(left).mul(right)
}
func * (left: RationalNumber, right: Int) -> RationalNumber {
    return left.mul(RationalNumber(right))
}
func / (left: RationalNumber, right: RationalNumber) -> RationalNumber {
    return left.div(right)
}
func / (left: Int, right: RationalNumber) -> RationalNumber {
    return RationalNumber(left).div(right)
}
func / (left: RationalNumber, right: Int) -> RationalNumber {
    return left.div(RationalNumber(right))
}

let ZERO: RationalNumber = RationalNumber(0)
let ONE: RationalNumber = RationalNumber(1)

func calc2Number(op: Character, _ left: RationalNumber, _ right: RationalNumber) -> RationalNumber? {
    switch op {
    case Character("+"):
        return left + right
    case Character("-"):
        return left - right
    case Character("*"):
        return left * right
    case Character("/"):
        if right.compareTo(RationalNumber(0)) == 0 {
            return nil
        }
        else {
            return left / right
        }
    default:
        return nil
    }
}

