import SwiftUI
import SwiftData


//enum en extension


struct MainScreen: View {
    
    @State private var buttonItems: [ButtonItem] = []
    //Appstorage en Environment colorScheme
    @AppStorage("systemThemeVal") private var systemTheme: Int = SchemeType.allCases.first!.rawValue
    
    //Private var selectedScheme
    private var selectedScheme: ColorScheme? {
        guard let theme = SchemeType(rawValue: systemTheme) else {return nil}
        switch theme {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return nil
            
        }
    }
    
    var body: some View {
        ZStack{
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
                                
                                NavigationLink(destination: Settings()) {
                                    Image(systemName: "gearshape")
                                }
                            }
                            
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: addNewButton) {
                                    Image(systemName: "plus")
                                }
                            }
                        }
                        
                        
                        //Place text here?
                        
                        
                        //Picker
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
                    
                    NavigationStack {
                        Account()
                    }
                    .tabItem {
                        Label("Account", systemImage: "person.circle")
                    }
                    
                }
                //PreferredColorScheme
            .preferredColorScheme(selectedScheme)
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
        Group{
            MainScreen()
                .previewDisplayName("Light Mode")
                .preferredColorScheme(.light)
            MainScreen()
                .previewDisplayName("Dark Mode")
                .preferredColorScheme(.dark)
        }
        
    }
}
