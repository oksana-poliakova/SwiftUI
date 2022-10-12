//
//  FlagQuizGame.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 12.10.2022.
//

import SwiftUI

struct FlagQuizGame: View {
    
    // MARK: - Properties
    
    @State private var countries = ["Canada", "Denmark", "France", "Germany", "Iceland", "India", "Italy", "Mexico", "Norway", "Poland", "Spain", "Sweden", "Thailand", "Turkey", "UK", "Ukraine", "USA"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var totalScore = 0
    @State private var showScore = false
    @State private var scoreTitle = ""
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .yellow]),
                           startPoint: .top,
                           endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 20) {
                    Text("Choose a flag:")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number: number)
                        self.showScore = true
                    }) {
                        Image(countries[number])
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 160)
                            .clipShape(Rectangle())
                    }
                }
                
                Text("Total score: \(totalScore)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                
            }
        } .alert(isPresented: $showScore) {
            Alert(title: Text(scoreTitle),
                  message: Text("Total score is: \(totalScore)"),
                  dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func flagTapped(number: Int) {
        if number == correctAnswer {
            scoreTitle = "Right answer!"
            totalScore += 1
        } else {
            scoreTitle = "Wrong answer! It's a flag of \(countries[number])"
            totalScore -= 1
        }
    }
}

struct FlagQuizGame_Previews: PreviewProvider {
    static var previews: some View {
        FlagQuizGame()
    }
}
