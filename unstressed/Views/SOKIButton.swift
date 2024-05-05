//
//  SOKIButton.swift
//  unstressed
//
//  Created by Srinivas Koushik on 4/20/24.
//

import SwiftUI

struct SOKIButton: View {
    let buttonTitle:String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // nada
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                
                Text(buttonTitle)
                    .foregroundStyle(.white)
                    .bold()
            }.padding()
        }
        
    }
}

#Preview {
    SOKIButton(buttonTitle: "Button title", color: Color.pink) {
        // action
    }
}
