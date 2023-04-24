//  /*
//
//  Project: Search
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.04.2023
//
//  */

import SwiftUI



enum MenuType {
    case orders, executors, cabinet, profile, addNew
}




struct MainView: View {
    @EnvironmentObject var observable: Observable
    
    @State var is_active: MenuType = .orders
    
    var body: some View {
        NavigationView {
            if !observable.showMain {
                HelloView()
                    .transition(.opacity)

            } else if !observable.netStatus {
                
                InternetConnectionError()
                
            } else if !observable.is_validate {
                Login()
            } else {
                VStack {
                    ZStack {
                        Color.init(red: 0.942, green: 0.958, blue: 0.958)
                            .ignoresSafeArea()
                        VStack {
                            if is_active == .orders || is_active == .executors || is_active == .addNew {
                                LogoTop()
                            }
                            if is_active == .orders || is_active == .executors {
                                SearchBar()
                            }
                            
                            switch is_active {
                            case .orders:
                                OrdersList()
                            case .executors:
                                ExecutorsList()
                            case .cabinet:
                                Cabinet()
                            case .profile:
                                ProfileView()
                            case .addNew:
                                AddNewOrder()
                            }
                            
                            Spacer()
                        }
                    }
                    
                    TabMenu(is_active: $is_active)
                        .padding(.top, 10)
                        .cornerRadius(10)
                        .overlay(
                            Button {
                                withAnimation {
                                    is_active = .addNew
                                }
                            } label: {
                                CirclePlus(is_active: $is_active)
                                    .padding(.bottom, 50)
                            }
                        )
                }
            }
        }
        .onAppear {
            observable.monitor.start(queue: observable.queue)
            observable.monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    DispatchQueue.main.async {
                        observable.netStatus = true
                    }
                } else {
                    DispatchQueue.main.async {
                        observable.netStatus = false
                    }
                }
            }
            observable.is_validate = UserDefaults.standard.bool(forKey: "is_validate")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: 2)) {
                    observable.showMain = true
                }

            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Observable())
    }
}
