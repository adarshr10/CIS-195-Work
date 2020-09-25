import UIKit
/*
 Adarsh Rao
 74434185
 App Number 1
 Making iOS apps!
 */

// Exercise 1
let foo: Int = 42;

let fooStr: String? = String(foo);

print("My number is \(fooStr!)");

if let realString = fooStr {
    print("My number is \(realString)");
}

print("My number is \(fooStr ?? "Sorry I'm Nil")");


// Exercise 2

var myArr: [Character] = ["c", "i", "s", "1", "9", "5", " ", "i", "s", " ", "f", "u", "n"];
let myString: String = String(myArr);

myArr.append("!");

print(myString);

var peopleDict: [String: Int] = ["Jerry" : 10, "Larry" : 20, "Harry" : 30];

dump(peopleDict);

var myInfo: (String, Int) = ("Adarsh Rao", 2023);

print(myInfo);

// Exercise 3

for (person, age) in peopleDict {
    if (age < 21) {
        print("My friend \(person) is under 21");
    } else {
        print("My friend \(person) is not under 21");
    }
}

for index in 1...10 {
    print(index);
}

for char in myArr {
    print(char);
}

// Exercise 4
func sumAndDiff(_ one: Int, _ two: Int) -> (Int, Int) {
    return (one + two, one - two);
}

typealias Course = String;

typealias PennId = Int;

func enroll(student using: PennId, enrolled courseName: Course) {
    print("Enrolled \(using) in \(courseName)");
}

let newCourse: String = "CIS 591";

let myPennId: Int = 12345678;

enroll(student: myPennId, enrolled: newCourse);

// Exercises 5 and 6

struct Rectangle {
    var width: Int = 0;
    var length: Int = 0;
    
    var area: Int {
        get {
            return length * width
        }
    }
    
    var description: String? {
        didSet {
            if let desc = description {
                print(desc);
            }
        }
    }
}

var myRect = Rectangle(width: 100, length: 100);

typealias School = String;
typealias Major = String;

class Student {
    var name: String = "";
    var school: School? = "";
    var major: Major = "undeclared";
    
    init(name: String, school: School?, major: Major) {
        self.name = name;
        self.school = school;
        self.major = major;
    }
    
    init(name: String) {
        self.name = name;
    }
}

let me = Student(name: "Adarsh", school: "SEAS", major: "CIS");

let babyQuaker = Student(name: "Larry Ye");

let majorArr: [String] = ["CIS", "SSE", "Econ", "Neuro", "Linguistics"];

babyQuaker.major = majorArr.randomElement()!;

myRect.description = "This is my rectangle";

print(myRect.area);
