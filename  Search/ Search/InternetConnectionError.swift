//
//  InternetConnectionError.swift
//   Search
//
//  Created by Elaidzha Shchukin on 24.04.2023.
//

import SwiftUI

struct InternetConnectionError: View {
    @EnvironmentObject var observable: Observable
    
    
    func tryConection() {
        print(observable.netStatus)
    }
    
    var body: some View {
            VStack {
                Image("interneterror")
                    .padding()
                
                Text("Проблемы с интернет подключением")
                    .font(.custom(FontsManager.Inter.regular, size: 16))
                    .foregroundColor(
                        Color.init(toText: .gwork)
                    )
              
                Button {
                    tryConection()
                } label: {
                    Text("Попробовать ещё раз")
                        .font(.custom(FontsManager.Inter.regular, size: 16))
                        .frame(width: 225, height: 43)
                        .foregroundColor(
                            Color.init(toText: .gmain)
                            
                        )
                        .cornerRadius(4)
                        .padding()
                }
                
                Button {
                    tryConection()
                } label: {
                    Text("Вернуться на главную")
                        .font(.custom(FontsManager.Inter.regular, size: 16))
                        .frame(width: 225, height: 43)
                        .background(
                            Color.init(toElement: .main)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .padding()
                }
            }
            .padding()
        
    }
}

struct InternetConnectionError_Previews: PreviewProvider {
    static var previews: some View {
        self.devices {
            InternetConnectionError()
        }
    }
}
