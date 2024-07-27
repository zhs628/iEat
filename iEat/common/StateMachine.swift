
import Foundation
import SwiftUI

enum PageUrl: String {
    case startPage = "StartPage"
    case homePage = "HomePage"
    case calendarPage = "CalendarPage"
    case statsPage = "StatsPage"
    
    // error pages
    case notInitiallized = "NotInitiallized"
    
    
    static func  pageIndexToPageUrl(index: Int) -> PageUrl {
        switch index {
        case 0:
            return .homePage
        case 1:
            return .calendarPage
        case 2:
            return .statsPage
        default:
            // 处理未知的或错误的 index
            MyLogger.error("pageIndex undefined! When scrolling to pageIndex: \(index), homePage is returned instead.", .maintain)
            return .homePage
        }
    }
    
    static func  pageUrlToPageIndex(url: PageUrl) -> Int {
        switch url {
        case .homePage:
            return 0
        case .calendarPage:
            return 1
        case .statsPage:
            return 2
        default:
            // 处理未知的或错误的 PageUrl
            MyLogger.error("Undefined PageUrl: \(url.rawValue). Returning -1 as default.", .maintain)
            return -1
        }
    }
}




class StateMachine: ObservableObject {
    
    // public vars
    @Published var currentPageUrl: PageUrl = .startPage {
        didSet {
            // 当 currentPageUrl 发生变化时，执行额外的逻辑
            if _lastCurrentPageUrl != currentPageUrl {
                MyLogger.info("switch to value: \(_lastCurrentPageUrl)", .maintain)
                _lastCurrentPageUrl = currentPageUrl
            }
        }
    }
    
    
    
    
    
    
    
    // private vars
    private static var _singeletonHasInitialized: Bool = false
    private var _lastCurrentPageUrl: PageUrl = .startPage   // 存储currentPageUrl的上一个值
    
    // 类加载期初始化
    init() {
        if StateMachine._singeletonHasInitialized {
            MyLogger.error("StateMachine has been initialized twice or more", .maintain)
            return
        }
        
        
        StateMachine._singeletonHasInitialized = true
    }
    
    // 预留, 额外的初始化
    public func addInit() {

    }
    
}


