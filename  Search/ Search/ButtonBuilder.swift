//
//  ButtonBuilder.swift
//   Search
//
//  Created by Elaidzha Shchukin on 24.04.2023.
//

import SwiftUI

enum ButtonWidth: CGFloat {
    case short = 160
    case long = 350
}

enum TypeOfAction {
    case cancel,  next, back, publish
}

struct ButtonBuilder: View {
    @EnvironmentObject var observable: Observable
    
    let text: String
    let withBackground: Bool
    let isActiveButton: Bool
    let buttonWidth: ButtonWidth
    let actionIsContinue: Bool
    let typeOfAction: TypeOfAction
    
    var body: some View {
        Button {
            
            switch typeOfAction {
            case .next:
                guard observable.indexPageOfNewOrder != 3 else { return }
                observable.indexPageOfNewOrder += 1
                
            case .back:
                guard observable.indexPageOfNewOrder != 0 else { return }
                observable.indexPageOfNewOrder -= 1
            case .publish:
                withAnimation {
                    observable.showPublishedNewOrder = true
                }
            case .cancel:
                observable.cancelNewOrder = true
            }
            
        } label: {
            Text(text)
                .frame(width: CGFloat(buttonWidth.rawValue), height: 40)
                .foregroundColor(withBackground ? isActiveButton ? .white : Color.init(toElement: .iconactive) : Color.init(toElement: .main))
                .background(
                    withBackground ? isActiveButton ? Color.init(toElement: .main) : Color.init(toElement: .currency) : .white
                )
                .cornerRadius(6)
        }
        .disabled(!isActiveButton)
    }
}
