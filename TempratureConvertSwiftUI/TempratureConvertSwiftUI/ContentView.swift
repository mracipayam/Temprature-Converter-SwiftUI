//
//  ContentView.swift
//  TempratureConvertSwiftUI
//
//  Created by Murat Han on 5.04.2020.
//  Copyright © 2020 mracipayam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Temp1 = 0
    @State private var Temp2 = 0
    @State private var value = "10"
    
    let Temprature = ["C","K","F"]
    
    var Calculate : Double {
        
        let selectionFirst = Temprature[Temp1]
        let selectionSecond = Temprature[Temp2]
        let Value = Double(value) ?? 0
        var result = 0.0
        
        if (selectionFirst == "C" && selectionSecond == "K"){
            result = Value + 273.15
        }
        if (selectionFirst == "C" && selectionSecond == "F"){
            result = (Value * 1.8) + 32
        }
        if (selectionFirst == "C" && selectionSecond == "C"){
            result = Value
        }
        if (selectionFirst == "K" && selectionSecond == "C"){
            result = Value - 273.15
        }
        if (selectionFirst == "K" && selectionSecond == "F"){
            result = (Value * 1.8) - 459.67
        }
        if (selectionFirst == "K" && selectionSecond == "K"){
            result = Value
        }
        if (selectionFirst == "F" && selectionSecond == "C"){
            result = (Value - 32) * 1.8
        }
        if (selectionFirst == "F" && selectionSecond == "K"){
            result = (Value + 459.67) * 1.8
        }
        if (selectionFirst == "F" && selectionSecond == "F"){
            result = Value
        }
    
        return result
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header : Text("Value Type")) {
                    Picker("Temprature1",selection: $Temp1){
                        ForEach(0 ..< Temprature.count){
                            Text("\(self.Temprature[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    TextField("Enter a value for convert",text: $value)
                        .keyboardType(.decimalPad)
                }
                Section(header : Text("Convert Type")) {
                    Picker("Temprature2",selection: $Temp2){
                        ForEach(0 ..< Temprature.count){
                            Text("\(self.Temprature[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("Result : \(Calculate , specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("Temprature Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
