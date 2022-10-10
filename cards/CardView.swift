//
//  CardView.swift
//  cards
//
//  Created by Sathurshan Ramachandran on 2022-10-10.
//

import SwiftUI

struct CardView: View {
    //MARK: - Properties
    var card: Card
    
    @State private var fadeIn:Bool = false
    @State private var moveDown: Bool = false
    @State private var moveTop: Bool = false
    @State private var showAlert: Bool = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .soft)
    // MARK: - CARDS
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0: 0.0)
            VStack{
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
                Spacer()
            }.padding(.top, moveDown ? 20 : 0 )
                
            
            Button(action: {
                print(card.message)
                playSound(sound: "sound-chime", type: "mp3")
                self.hapticImpact.impactOccurred()
                self.showAlert.toggle()
            }, label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                    .foregroundColor(Color.white).accentColor(Color.white)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(Color.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 27)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6,x: 0,y: 5)
                   
            }).offset(y: moveTop ? 210 : 300)
        }
        .frame(
        width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom ))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear(){
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation (.linear(duration: 0.8)){
                self.moveDown.toggle()
                self.moveTop.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(card.title),
                  message: Text(card.message),
                  dismissButton: .default(Text("Ok"))
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cards[1]).previewLayout(.sizeThatFits)
    }
}
