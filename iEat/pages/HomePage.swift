//
//  HomePage.swift
//  iEat
//
//  Created by zhs on 2024/7/24.
//

import SwiftUI

private var screen_width: CGFloat = UIScreen.main.bounds.width
private var screen_height: CGFloat = UIScreen.main.bounds.height



struct HomePage: View {
    @EnvironmentObject private var stateMachine: StateMachine

    var body: some View {

            VStack() {
                // headbar
                HStack(alignment: .center){
                    Spacer()
                    Image("homepage-menu")
                        .frame(width: screen_width/10)
                    Spacer()
                    Image("homepage-ieat")
                        .frame(width: screen_width*0.3)
                    Spacer()
                    Image("homepage-account")
                        .frame(width: screen_width/10)
                    Spacer()
                }
                .frame(width: screen_width)
//                .offset(y:-0.385*screen_height)
                .padding(.top, 0.085*screen_height)
                // textspace
                
                
                Text("这是一个多行文本示例。\n这段文本会完全居中显示，并支持多行。可以看到文本的对齐方式也进行了设置。这是一个多行文本示例。\n这段文本会完全居中显示，并支持多行。可以看到文本的对齐方式也进行了设置。")
                    .font(Font.custom("PingFang SC", size: min(0.018*screen_height, 0.036*screen_height))) // 根据视图大小调整文字大小
                    .frame(width: screen_width*0.65, height: screen_height*0.2, alignment: .center)
                    .multilineTextAlignment(.center) // 多行文本居中对齐
                
                
                // center icon
                Image("homepage-center")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: min(screen_width, screen_height) * 0.54, height: min(screen_width, screen_height) * 0.507)
                    .padding(.bottom, 0.235*min(screen_width, screen_height) * 0.507)

                // scanner button
                Image("scanner-button")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 0.84 * min(screen_width, screen_height) * 0.54, height: 0.3333 * 0.84 * min(screen_width, screen_height) * 0.54)
                    
                Spacer()
                
                // navigation bar frame
                NavigationBarFrame()
                    .padding(.bottom, min((screen_width - bar_width)/2, bar_height))
                
            }
            .frame(width: screen_width, height: screen_height)

        
        

    }
}
