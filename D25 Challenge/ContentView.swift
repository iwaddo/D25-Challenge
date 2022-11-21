//
//  ContentView.swift
//  D25 Challenge
//
//  Created by Ian Waddington on 20/11/2022.
//

import SwiftUI




struct ContentView: View {
    
    @State private var appChoice: Int = Int.random(in: 0..<3)
    @State private var playerToWinOrLose: Bool = true
    @State private var correctChoice: Bool = false
    @State private var playerScore: Int = 0
    @State private var numberOfGuesses: Int = 0
    @State private var gamesToPlay: Int = 4
    @State private var gameEnd: Bool = false
    
    var choice: [String] = ["rock", "paper", "scissors"]
    
    
    var body: some View {
        VStack {
            Spacer()
            Text("The computer chooses:")
                .foregroundColor(.blue)
                .font(.title)
            Image(choice[appChoice])
                .renderingMode(.original)
                .shadow(radius: 5)
            
            Spacer()
            
            Text("What will you choose to \(playerToWinOrLose ? "Win" : "Lose")?")
                .foregroundColor(.blue)
                .font(.title)
            
            ForEach(0..<3) {number in
                Button {
                    nextTurn(number)
                } label: {
                    Image(choice[number])
                        .renderingMode(.original)
                        .shadow(radius: 5)
                        
                }
            }
            Text("You made the \(correctChoice ? "winning" : "losing") choice")
            Text("Your score is \(playerScore) from \(numberOfGuesses) guesses")
            Spacer()
        }
        .alert(isPresented: $gameEnd) {
            Alert(title: Text("End of Game \nYour score is \(playerScore) from \(numberOfGuesses) guesses"), primaryButton: .default(Text("Quit"), action: doNothing), secondaryButton: .destructive(Text("Quit"), action: doNothingAgain))
        }
    }

    func doNothing() {
        // do nothing
    }
    
    func doNothingAgain() {
        // do nothing
    }
    
    
    func nextTurn(_ number: Int) {
        if appChoice == 0 && playerToWinOrLose && number == 1 {
            correctChoice = true
            playerScore += 1
        } else if appChoice == 1 && playerToWinOrLose && number == 2 {
            correctChoice = true
            playerScore += 1
        } else if appChoice == 2 && playerToWinOrLose && number == 0 {
            correctChoice = true
            playerScore += 1
        } else if appChoice == 0 && !playerToWinOrLose && number == 2 {
            correctChoice = true
            playerScore += 1
        } else if appChoice == 1 && !playerToWinOrLose && number == 0 {
            correctChoice = true
            playerScore += 1
        } else if appChoice == 2 && !playerToWinOrLose && number == 1 {
            correctChoice = true
            playerScore += 1
        } else {
            correctChoice = false
            playerScore -= 1
        }
            
        numberOfGuesses += 1
        if numberOfGuesses >= gamesToPlay {
            gameEnd = true
        }
        appChoice = Int.random(in: 0...2)
        playerToWinOrLose.toggle()
    }
    
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

}
