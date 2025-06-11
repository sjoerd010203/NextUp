import SwiftUI
import SwiftData

struct MainScreen: View {
    
    @State private var buttonItems: [ButtonItem] = []
    
    var body: some View {
        TabView {
            
            NavigationStack {
                
                VStack {
                    
                    List {
                        ForEach(buttonItems) { item in
                            CustomButton(
                                leftText: item.leftText,
                                rightText: item.rightText,
                                useImageBackground: item.useImageBackground,
                                backgroundImageName: item.backgroundImageName,
                                backgroundColor: item.backgroundColor
                            )
                        }
                    }
                    .modifier(NavigationConfigurator(backgroundColor: Color("LightBlue"), showBottomBorder: true))
                    
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                // Settings action
                            }) {
                                Image(systemName: "gearshape")
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: addNewButton) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
            }
            .tabItem {
                Label("Main", systemImage: "list.bullet")
            }
            .topTabBarConfigurator(backgroundColor: Color("LightBlue"), showBottomBorder: true)
            
            
            
            // ✅ Second Tab: Challenge
            NavigationStack {
                Challenge()
            }
            .tabItem {
                Label("Challenge", systemImage: "trophy")
            }
            
            // ✅ Third Tab: Shared
            NavigationStack {
                Shared()
            }
            .tabItem {
                Label("Shared", systemImage: "square.and.arrow.down")
            }
            
            // ✅ Fourth Tab: Archive
            NavigationStack {
                Archive()
            }
            .tabItem {
                Label("Archive", systemImage: "archivebox")
            }
            
        }
       
    }
      
    
    
    
    func addNewButton() {
        let newButton = ButtonItem(
            id: UUID(),
            leftText: "left \(buttonItems.count + 1)",
            rightText: "right \(buttonItems.count + 1)",
            useImageBackground: false,
            backgroundImageName: "",
            backgroundColor: .blue
        )
        buttonItems.append(newButton)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
