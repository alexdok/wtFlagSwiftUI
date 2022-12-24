

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Germany", "Bangladesh", "Argentina", "Brazil", "Canada", "Greece", "Russia", "Sweden"].shuffled()

    @State private var trueAnswer = Int.random(in: 0...2)
    
    @State private var totalScore = 0
    
    @State private var showingScore = false
    
    @State private var scoreTitle  = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .white], startPoint: .top, endPoint: .bottom) .edgesIgnoringSafeArea(.all)
            VStack(spacing: 45){
                VStack {
                    Text("Chose FLAG")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(countries[trueAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3) {
                    number in Button(action: {
                        self.flagTapt(number)
                        self.showingScore = true
                    }) {
                        Image(self.countries[number])
                            .frame(width: 250, height: 125, alignment: .center)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                            .shadow(color: .black, radius: 5)
                    }
                }
                Text("Total Score: \(totalScore)")
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
        } .alert( isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Total score: \(totalScore)"), dismissButton: .default(Text("continue"), action: {
                self.askQuestion()
            }) )
        }
    }
    func askQuestion() {
        countries.shuffle()
        trueAnswer = Int.random(in: 0...2)
    }
    
    func flagTapt(_ number: Int) {
        if number == trueAnswer {
            scoreTitle = "SUCCESS!"
            totalScore += 1
        } else {
            scoreTitle = " WRONG! this is \(countries[number]) "
            totalScore -= 1
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
