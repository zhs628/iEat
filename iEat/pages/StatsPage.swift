//
//  HomePage.swift
//  iEat
//
//  Created by zhs on 2024/7/24.
//

import SwiftUI

private var screen_width: CGFloat = UIScreen.main.bounds.width
private var screen_height: CGFloat = UIScreen.main.bounds.height



struct StatsPage: View {
    @EnvironmentObject private var stateMachine: StateMachine

    var body: some View {
        Text("应为:StatsPage 检测为:\(stateMachine.currentPageUrl)")
            .frame(width:screen_width, height:screen_height)
    }
}

