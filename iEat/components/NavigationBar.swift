//
//  NavigationBar.swift
//  iEat
//
//  Created by zhs on 2024/7/27.
//

import SwiftUI


private var screen_width: CGFloat = UIScreen.main.bounds.width
private var screen_height: CGFloat = UIScreen.main.bounds.height

public var bar_width: CGFloat = 0.858*screen_width
public var bar_height: CGFloat = min(0.313*bar_width, 0.124*screen_height)




struct NavigationBar: View {
    @EnvironmentObject private var stateMachine: StateMachine
    
    @State var tohomeActived: Bool = true
    @State var tocalendarActived: Bool = false
    @State var tostatsActived: Bool = false
    
    func onButtonPressed(toPage: PageUrl) {
        if toPage == .homePage {
            MyLogger.info(" swich to page: \(toPage.rawValue)  by calling NavigationBar.onButtonPressed", .maintain)
            self.stateMachine.currentPageUrl = .homePage
            self.tohomeActived = true
            self.tocalendarActived = false
            self.tostatsActived = false
            
        }
        else if toPage == .calendarPage {
            MyLogger.info(" swich to page: \(toPage.rawValue)  by calling NavigationBar.onButtonPressed", .maintain)
            self.stateMachine.currentPageUrl = .calendarPage
            self.tohomeActived = false
            self.tocalendarActived = true
            self.tostatsActived = false
            
        }
        else if toPage == .statsPage {
            MyLogger.info(" swich to page: \(toPage.rawValue)  by calling NavigationBar.onButtonPressed", .maintain)
            self.stateMachine.currentPageUrl = .statsPage
            self.tohomeActived = false
            self.tocalendarActived = false
            self.tostatsActived = true
            
        }
        else {
            MyLogger.error("calling NavigationBar.onButtonPressed with unexceped param \"toPage: \(toPage.rawValue)\" \nSo navigating to the homePage", .maintain)
            self.stateMachine.currentPageUrl = .homePage
            self.tohomeActived = false
            self.tocalendarActived = false
            self.tostatsActived = false
            
        }
    }
    
    var body: some View {
        ZStack {
            NavigationBarBackground(
                width: bar_width, height: bar_height, cornerRadius: 0.444*bar_height
            )
            
            HStack(alignment:.bottom) {
                Spacer()
                Button(action: {self.onButtonPressed(toPage: .homePage)}) {
                    Image("navigationbar-tohome")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 0.597*0.62*bar_height, height: 0.62*bar_height)

                }
                .scaleEffect(self.tohomeActived ? 1.222 : 1)
                .brightness(self.tohomeActived ? -0.2 : 0)
                .animation(.easeInOut(duration: 0.3), value: self.tohomeActived)
                .padding(.bottom, 0.13*bar_height)
                .padding(.top, 0.25*bar_height)

                Spacer()
                
                Button(action: {self.onButtonPressed(toPage: .calendarPage)}) {
                    Image("navigationbar-tocalendar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 0.597*0.62*bar_height, height: 0.62*bar_height)

                }
                .scaleEffect(self.tocalendarActived ? 1.222 : 1)
                .brightness(self.tocalendarActived ? -0.2 : 0)
                .animation(.easeInOut(duration: 0.3), value: self.tocalendarActived)
                .padding(.bottom, 0.13*bar_height)
                .padding(.top, 0.25*bar_height)
                
                Spacer()
                
                Button(action: {self.onButtonPressed(toPage: .statsPage)}) {
                    Image("navigationbar-tostats")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 0.597*0.62*bar_height, height: 0.62*bar_height)

                }
                .scaleEffect(self.tostatsActived ? 1.222 : 1)
                .brightness(self.tostatsActived ? -0.2 : 0)
                .animation(.easeInOut(duration: 0.3), value: self.tostatsActived)
                .padding(.bottom, 0.13*bar_height)
                .padding(.top, 0.25*bar_height)
                Spacer()

            }
            .onChange(of: self.stateMachine.currentPageUrl) { old, new in
                MyLogger.info("NavigationBar has detected stateMachine.currentPageUrl's change: \(old) -> \(new)\nSo calling NavigationBar.onButtonPressed(toPage: \(new)")
                if [PageUrl.homePage, PageUrl.calendarPage, PageUrl.statsPage].contains(new) {
                    self.onButtonPressed(toPage: new)
                }
            }

        }
        .frame(width: bar_width, height: bar_height)
    }
}

struct NavigationBarFrame: View {
    var body: some View {
        ZStack {
            HStack {
                
            }
            .frame(width: bar_width, height: bar_height)

            
            
        }
    }
}


private struct NavigationBarBackground: View {
    
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {

        ZStack() {
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: self.width, height: self.height)
            .background(
            LinearGradient(
            stops: [
            Gradient.Stop(color: Color(red: 0.81, green: 0.87, blue: 0.61), location: 0.00),
            Gradient.Stop(color: Color(red: 0.94, green: 0.98, blue: 0.84), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0, y: 0),
            endPoint: UnitPoint(x: 0, y: 1)
            )
            )
            .cornerRadius(self.cornerRadius)
            
        }
        .frame(width:self.width,height:self.height)
        .cornerRadius(self.cornerRadius)
        .shadow(color: .black.opacity(0.25), radius: 5.35, x: 0, y: 4)

    }
}

