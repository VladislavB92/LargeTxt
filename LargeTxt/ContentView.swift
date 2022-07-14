//
//  ContentView.swift
//  LargeTxt
//
//  Created by Vladislavs Buzinskis on 14/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var userText: String = ""
    @State var capMode: Int = 0
    var pasteboard = UIPasteboard.general
    
    func userTextMod(text: String, mode: Int) -> String {
        if capMode == 1 {
            return text.uppercased()
        } else if capMode == 2 {
            return text.capitalized
        } else if capMode == 3 {
            return text.lowercased()
        }
        else {
            return text
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text(userTextMod(text: userText, mode: capMode))
            Spacer()
            
            VStack {
                TextField(
                    "Paste or enter text here...",
                    text: $userText
                )
            }
            Spacer()
            VStack {
                Button(action: {
                    pasteboard.string = userTextMod(
                        text: userText,
                        mode: capMode
                    )
                    print("Copied")
                }) {
                    RoundedButton(
                        buttonTitle: "Copy",
                        color: .cyan
                    )
                }
            }
            HStack {
                Button(action: {
                    capMode = 1
                    print("Capped")
                }) {
                    RoundedButton(
                        buttonTitle: "CAPS",
                        color: .blue
                    )
                }
                Button(action: {
                    capMode = 2
                    print("Tapped")
                }) {
                    RoundedButton(
                        buttonTitle: "First Letter",
                        color: .purple
                    )
                }
                Button(action: {
                    capMode = 3
                    print("Tapped")
                }) {
                    RoundedButton(
                        buttonTitle: "lowercase",
                        color: .green
                    )
                }
            }
            VStack {
                Button(action: {
                    userText = ""
                    print("Cleared")
                }) {
                    RoundedButton(
                        buttonTitle: "Clear",
                        color: .red
                    )
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RoundedButton: View {
    var buttonTitle: String
    var color: Color
    
    var body: some View {
        Text(buttonTitle)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}
