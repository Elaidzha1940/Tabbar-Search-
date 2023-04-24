//
//  HelloVeiw.swift
//   Search
//
//  Created by Elaidzha Shchukin on 24.04.2023.
//

import SwiftUI

struct HelloView: View {
    let screen = UIScreen.main.bounds
    var body: some View {
        
        ZStack {
            Color.red
            
            VStack {
                Image("logo-big")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screen.width / 2.5)
                
                Image("logoword")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
            HelloView()
    }
}
