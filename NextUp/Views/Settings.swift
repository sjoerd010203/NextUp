//
//  Archive.swift
//  NextUp
//
//  Created by Sjoerd van Lexmond on 24/03/2025.
//

import SwiftUI


enum SchemeType: Int, Identifiable, CaseIterable {
    var id: Self { self }
    case system
    case light
    case dark
}

extension SchemeType {
    var title: String {
        switch self {
        case .system:
            return "System"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
}


// Start View
struct Settings: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var buttonItems: [ButtonItem] = []
    
    @AppStorage("systemThemeVal") private var systemTheme: Int = SchemeType.allCases.first!.rawValue
    @Environment(\.colorScheme) private var colorScheme
    
    
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
        VStack {
            
            HStack {
                ZStack {
                    Color (.tan)
                        .cornerRadius(10)
                    
                    VStack (alignment: .leading){
                        Text("UI")
                            .bold(true)
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Picker(selection: $systemTheme) {
                            ForEach(SchemeType.allCases) { item in Text(item.title)
                                    .tag(item.rawValue)
                            }
                        }label: {
                            Text("Pick a theme")
                                
                        }
                        .frame(width: 300, height: 40, alignment: .leading)
                        .background(Color ("LightBlue"), in: RoundedRectangle(cornerRadius: 8, style: .circular))
                        
                        
                        
                        Text("Language")
                        
                            .bold(true)
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        
                        
                        
                        Text("Notifications")
                            .bold(true)
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        
                        Text("About")
                            .bold(true)
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }
                    .frame(width: 300, height: 20, alignment: .topLeading)
                }
                
                .padding()
                
                
            }
            .preferredColorScheme(selectedScheme)
        }
        .topTabBarConfigurator(backgroundColor: Color("LightBlue"), showBottomBorder: true)
        .navigationTitle("Settings")
    }
    
    
    
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            Settings()
                .previewDisplayName("Light Mode")
                .preferredColorScheme(.light)
            Settings()
                .previewDisplayName("Dark Mode")
                .preferredColorScheme(.dark)
        }
    }
}

