//
//  HeaderView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 4/20/24.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 230)
                .foregroundColor(.pink)
            
            
            Text(title)
                .font(.system(size: 45))
                .foregroundStyle(.white)
                .offset(y:10)
        }
        .offset(y:-75)
    }
}

#Preview {
    HeaderView(title: "Filler Text")
}
