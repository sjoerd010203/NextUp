import Foundation
import SwiftUI

struct NavigationConfigurator: ViewModifier {
    var backgroundColor: UIColor
    var showBottomBorder: Bool
    
    init(backgroundColor: Color, showBottomBorder: Bool = true) {
        self.backgroundColor = UIColor(backgroundColor)
        self.showBottomBorder = showBottomBorder
    }
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { _ in
                    Color.clear.onAppear{
                        let appearance = UINavigationBarAppearance()
                        appearance.configureWithOpaqueBackground()
                        appearance.backgroundColor = backgroundColor
                        if showBottomBorder {
                            appearance.shadowColor = UIColor.black
                        }
                        else {
                            appearance.shadowColor = .clear
                        }
                        
                        UINavigationBar.appearance().standardAppearance = appearance
                        UINavigationBar.appearance().scrollEdgeAppearance = appearance
                        UINavigationBar.appearance().compactAppearance = appearance
                    }
                })
    }
}

struct TopTabBarConfigurator: ViewModifier {
    var backgroundColor: Color
    var showBottomBorder: Bool
    
    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .overlay(
                Rectangle()
                    .frame(height: showBottomBorder ? 1 : 0)
                    .foregroundColor(.black),
                alignment: .bottom
            )
    }
}
extension View {
    func navigationConfigurator(backgroundColor: Color, showBottomBorder: Bool = true) -> some View {
        self.modifier(NavigationConfigurator(backgroundColor: backgroundColor, showBottomBorder: showBottomBorder))
    }
    func topTabBarConfigurator(backgroundColor: Color, showBottomBorder: Bool = true) -> some View {
        self.modifier(TopTabBarConfigurator(backgroundColor: backgroundColor, showBottomBorder: showBottomBorder))
    }
}
