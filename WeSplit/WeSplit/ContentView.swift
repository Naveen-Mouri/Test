//
//  ContentView.swift
//  WeSplit
//
//  Created by Naveen Singisetty on 09/03/20.
//  Copyright © 2020 MouriTech Pvt. Ltd. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//    @State private var tapCount = 0
//    @State private var name = ""
//    var body: some View {
//        NavigationView {
//            Form {
//                Section {
//                    Text("Hello, \(name)")
//                }
//
//                Section {
//                    Button("Tap Action: \(tapCount)") {
//                        self.tapCount += 1
//                    }
//                    TextField("Enter you name:", text: $name)
//                }
//                ForEach(0 ..< 100) {
//                    Text("Row \($0)")
//                }
//            }
//            .navigationBarTitle("SwiftUI")
//        }
//    }
//}

//struct ContentView:View {
//    let students = ["Naveen", "Vansi", "Santosh"]
//    @State private var selectedStudent = 0
//
//    var body : some View {
//        VStack {
//            Picker("Select your student", selection: $selectedStudent) {
//                ForEach(0 ..< students.count) {
//                    Text(self.students[$0])
//                }
//            }
//            Text("You chose: Student #\(students[selectedStudent])")
//        }
//    }
//}

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople)
        let amountPerPerson = grandTotal / peopleCount
        
        return (amountPerPerson > 0) ? amountPerPerson : 0
    }
    
    var grandTotal:Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
//                    TextField("Number of people", text: $numberOfPeople)
//                    .keyboardType(.numberPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach( 2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%0.2f")")
                }
                Section(header: Text("Grand Total")) {
                    Text("$\(grandTotal, specifier: "%0.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
