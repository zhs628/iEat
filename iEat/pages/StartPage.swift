//
//  SwiftUIView.swift
//  iEat
//
//  Created by zhs on 2024/7/22.
//

import SwiftUI


private var screen_width: CGFloat = UIScreen.main.bounds.width
private var screen_height: CGFloat = UIScreen.main.bounds.height

private var image_rescale_ratio = 0.5




struct StartPage: View {
    @EnvironmentObject private var stateMachine: StateMachine
    @State private var isToggle = false
    @State private var xOffset = 0.0
    @State private var scaleRatio = 1.0

    
    
    var body: some View {
        
        ZStack(alignment: .center) {
//            Rectangle().fill(.white)
            Image("startpage-center")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(CGSize(width: image_rescale_ratio, height: image_rescale_ratio))
                .opacity(self.isToggle ? 1 : 0)
        }
        
        .scaleEffect(CGSize(width: self.scaleRatio, height: self.scaleRatio))
        .offset(x: self.xOffset)
        .ignoresSafeArea()
        .onAppear {
            withAnimation (.easeOut(duration: 0.5)){
                self.isToggle = true

            }
            
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                // 计时结束，开始动画
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.xOffset = -screen_width
                }
                withAnimation(.linear(duration: 0.5)) {
                    self.scaleRatio = 0.0
                }
                
                // 动画结束后隐藏视图
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.stateMachine.currentPageUrl = .homePage
                    MyLogger.info("Animation end. To \(self.stateMachine.currentPageUrl)")
                }
            }
            
            
        }
        
    }
}
