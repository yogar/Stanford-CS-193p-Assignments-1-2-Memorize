//
//  EmojiMemoryGameView.swift
//  HarvardCourse_01
//
//  Created by Egor Pekhota on 27.02.2021.
//

import SwiftUI

// Game view
struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
//        Group {
            VStack {
                HStack {
                    Button(action: {
                        withAnimation(.easeInOut(duration:0.5)) {
                            self.viewModel.resetGame()
                        }
                    },label: { Text("New Game") })
                    Spacer()
                    Text("Score is \(viewModel.score)")
                }
                .padding(10)
                Grid(viewModel.cards) {card in
                    CardView(card: card).onTapGesture {
                        withAnimation(Animation.easeInOut(duration: 0.5)) {
                            viewModel.choose(card: card)
                        }
                    }
                    .padding(5)
                }
                .foregroundColor(Color(EmojiMemoryGame.selectedTheme.color))
            }
//        }
    }
}

// Displays a card face down or up, depending of `isFaceUp` property value or hides a card, if it's matched.
struct CardView: View {
    
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size:CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
                ZStack {
                    Group {
                        if card.isConsumingBonusTime {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                                .onAppear {
                                    self.startBonusTimeAnimation()
                                }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                        }
                    }
                    .padding(6).opacity(0.3)

                    Text(card.content)
                        .font(Font.system(size: min(size.width,size.height) * fontScaleFactor))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
                        .animation(card.isMatched ? Animation.easeIn(duration: 0.4).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
            }
        }
    
    // MARK: – Drawing Constants
    private let fontScaleFactor: CGFloat = 0.7
}

    

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
