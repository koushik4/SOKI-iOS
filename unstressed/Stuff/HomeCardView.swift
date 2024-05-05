//
//  HomeCardView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/2/24.
//

import SwiftUI

struct HomeCardView: View {
    let imageResource: ImageResource
    let title:String
    
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.4), radius: 5)
                    
                
                VStack {
                    Image(imageResource)
                        .resizable()
                        .frame(width: 156, height: 190)
                        .cornerRadius(25)
                    
                    Text(title)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .bold()
                        .offset(y:-20)
                }
            }
            .frame(width: 156, height: 190)
        }
            
    }
}

#Preview {
    HomeCardView(imageResource: .family, title: "Family")
}
