//
//  HomePage.swift
//  iEat
//
//  Created by zhs on 2024/7/24.
//

import SwiftUI

private var screen_width: CGFloat = UIScreen.main.bounds.width
private var screen_height: CGFloat = UIScreen.main.bounds.height



struct CalendarPage: View {
    @EnvironmentObject private var stateMachine: StateMachine

    var body: some View {
        VStack() {
            Spacer()
            Image("calendar-temp1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 0.07*screen_height)
            Image("calendar-temp2")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            
            // navigation bar frame
            NavigationBarFrame()
                .padding(.bottom, min((screen_width - bar_width)/2, bar_height))
            
        }
        .frame(width: screen_width, height: screen_height)

    }
}

