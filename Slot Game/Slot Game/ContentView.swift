//
//  ContentView.swift
//  Slot Game
//
//  Created by kekeli on 29/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var symbols = ["apple","star","cherry"]
    @State private var numbers = [1, 2, 0]
    @State private var background = [Color.white, Color.white, Color.white ]
  @State  private var credits = 1000
    private var betAmount = 5
    
    
    
    
    
    
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(red:200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red:228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            
           
            
//            Title
            
            VStack{
                Spacer()
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slot")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
//Credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
//                Cards
                HStack {
                    Spacer()
                    
                    
                    
                    CardView(symbol: $symbols[numbers[0]], background: $background[0])
                    CardView(symbol: $symbols[numbers[1]], background: $background[1])
                    CardView(symbol: $symbols[numbers[2]], background: $background[2])
                    Spacer()
                }
                Spacer()
                
                
                
                

                
                Button(action: {
                    
                    self.background[0] = Color.white
                    self.background[1] = Color.white
                    self.background[2] = Color.white
                    
//                    change the images
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
//                    check winnings
                    if self.numbers[0] == self.numbers[1] &&
                        self.numbers[1] == self.numbers[2] {
                        
//                        won
                        self.credits += self.betAmount * 10
                        
//                        update back grounds to green
                        self.background[0] = Color.green
                        self.background[1] = Color.green
                        self.background[2] = Color.green
                    }else{
                        self.credits -= self.betAmount
                    }
                })
                {
                    Text("Spin")
                    
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
