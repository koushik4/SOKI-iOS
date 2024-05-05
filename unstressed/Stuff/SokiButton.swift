//
//  SokiButton.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/1/24.
//

import SwiftUI

struct SokiButton: View {
    let title:String
    let height:Double
    let width:Double
    let color: Color

    let action: ()->Void
    
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(color))
                    .frame(width: width, height: height)
                Text(title)
                    .foregroundStyle(.white)
//                    .fontWeight(.semibold)
            }
        }

    }
}

#Preview {
    SokiButton(title: "title", height:45, width: 200, color: Constants.COLOR) {
        // lsllsd
    }
}
