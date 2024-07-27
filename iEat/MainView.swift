//
//  MainView.swift
//  iEat
//
//  Created by zhs on 2024/7/23.
//

import Foundation
import SwiftUI

private var screen_width: CGFloat = UIScreen.main.bounds.width
private var screen_height: CGFloat = UIScreen.main.bounds.height


struct MainView: View {
    @EnvironmentObject private var stateMachine: StateMachine
    
    @State private var pages = [HomePage(), HomePage()]
    @State private var focusedPageIndex: Int?
    @State private var showMainView: Bool = false
    
    var body: some View {
        ZStack {
            if self.stateMachine.currentPageUrl == .startPage {
                StartPage()
                    .onDisappear() {self.showMainView = true}
                
            }
            else {

                ZStack(alignment: .bottom) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            
                            HomePage().id(0)
                            CalendarPage().id(1)
                            StatsPage().id(2)

                        }
                        
                        .scrollTargetLayout()
                        
                    }
                    .scrollPosition(id: $focusedPageIndex)
                    .scrollTargetBehavior(.viewAligned)
                    .onChange(of: focusedPageIndex) { old, new in
                        MyLogger.info("ScrollView in MainView detected focusedPageIndex's change: \(String(describing: old)) -> \(String(describing: new))", .maintain)
                        self.stateMachine.currentPageUrl = PageUrl.pageIndexToPageUrl(index: new!)
                    }
                    .onChange(of: self.stateMachine.currentPageUrl) { old, new in
                        MyLogger.info("ScrollView in MainView detected stateMachine.currentPageUrl's change:  \(String(describing: old)) -> \(String(describing: new))", .maintain)
                        self.focusedPageIndex = PageUrl.pageUrlToPageIndex(url: new)
                    }
                    
                    
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.92, green: 0.96, blue: 0.76), Color(red: 0.98, green: 1, blue: 0.91), .white]), startPoint: .top, endPoint: .bottom)

                    )
                    .opacity(self.showMainView ? 1:0)
                    .animation(.easeOut(duration: 0.5), value: self.showMainView)
                    
                    
                    NavigationBar()
                    .padding(.bottom, min((screen_width - bar_width)/2, bar_height))
                    .zIndex(999)
                    
                    
                }

                

            }
        }

        
        .ignoresSafeArea()
        

        
    }
}

#Preview {
    MainView()
}
