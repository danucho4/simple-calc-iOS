//
//  ViewController.swift
//  simple-calc
//
//  Created by Daniel Gil Chávez on 12/6/16.
//  Copyright © 2016 Daniel Gil Chavez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isTypingNumber = false
    var operation = ""
    var numbers = [Int]()
    var history = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func add(left : Int, right : Int) -> Int {
        return left + right
    }
    
    func subtract(left : Int, right : Int) -> Int {
        return left - right
    }
    
    func multiply(left : Int, right : Int) -> Int {
        return left * right
    }
    
    func divide(left : Int, right : Int) -> Int {
        return left / right
    }
    
    func mod(left : Int, right : Int) -> Int {
        return left % right;
    }
    
    func mathOperation(left : Int, right : Int, operation: (Int, Int) -> Int) -> Int {
        return operation(left, right);
    }
    
    func count(nums: [Int]) -> Int {
        return nums.count
    }
    
    func avg(nums: [Int]) -> Int {
        var sum = 0
        for num in nums {
            sum += num
        }
        return sum / nums.count
    }
    
    func fact(num: Int) -> Int {
        if (num < 0) {
            return -1
        } else if (num == 0 || num == 1) {
            return 1
        }
        
        return num * fact(num: (num - 1))
    }
    
    
    @IBOutlet weak var display: UITextField!
    
    @IBAction func numberTapped(_ sender: AnyObject) {
        let number = sender.currentTitle!
        
        if isTypingNumber {
            display.text = display.text! + number!
        } else {
            display.text = number
            isTypingNumber = true
        }
    }
    @IBAction func operationTapped(_ sender: AnyObject) {
        isTypingNumber = false
        numbers.append(Int(display.text!)!)
        operation = sender.currentTitle!!
    }
    @IBAction func equalsTapped(_ sender: AnyObject) {
        isTypingNumber = false
        numbers.append(Int(display.text!)!)
        var result = 0
        let firstNumber = numbers[0]
        let secondNumber = numbers[1]
        
        if operation == "+" {
            result = add(left: firstNumber, right: secondNumber)
        } else if operation == "-" {
            result = subtract(left: firstNumber, right: secondNumber)
        } else if operation == "x" {
            result = multiply(left: firstNumber, right: secondNumber)
        } else if operation == "÷" {
            result = divide(left: firstNumber, right: secondNumber)
        } else if operation == "%" {
            result = mod(left: firstNumber, right: secondNumber)
        } else if operation == "Avg" {
            result = avg(nums: numbers)
        } else if operation == "Count" {
            result = count(nums: numbers)
        } else {
            result = fact(num: firstNumber)
        }
        
        if operation == "Fact" {
            history.append("\(firstNumber)! = \(result)")
        } else if operation == "Count" {
            var hist = ""
            for num in numbers {
                hist += "\(num) count "
            }
            let index1 = hist.index(hist.endIndex, offsetBy: -6)
            hist = hist.substring(to: index1)
            hist += "= \(result)"
            history.append(hist)
        } else if operation == "Avg" {
            var hist = ""
            for num in numbers {
                hist += "\(num) avg "
            }
            let index1 = hist.index(hist.endIndex, offsetBy: -4)
            hist = hist.substring(to: index1)
            hist += "= \(result)"
            history.append(hist)
        } else {
            history.append("\(firstNumber) \(operation) \(secondNumber) = \(result)")
        }
        numbers.removeAll()
        display.text = "\(result)"
    }
    
    func printHist() {
        print(history)
    }
    
    @IBAction func historyTapped(_ sender: AnyObject) {
        printHist()
    }
}

