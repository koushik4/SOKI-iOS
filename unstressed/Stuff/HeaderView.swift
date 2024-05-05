//
//  Header.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/1/24.
//

import SwiftUI

struct HeaderView: View {
    let scale:Double
    
    var body: some View {
        ZStack {
            Color(Constants.COLOR)
                .ignoresSafeArea()
            
            Circle()
                .scale(scale)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    HeaderView(scale:1.8)
}
