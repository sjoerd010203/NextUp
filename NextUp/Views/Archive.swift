//
//  Archive.swift
//  ChecklistApp
//
//  Created by Sjoerd van Lexmond on 24/03/2025.
//

import SwiftUI

struct Archive: View {
        @Environment(\.dismiss) private var dismiss
        @State private var buttonItems: [ButtonItem] = []
        
        var body: some View {
            VStack {
                
                NavigationStack {
                    HStack {
                        Text("")
                            .modifier(NavigationConfigurator(backgroundColor: Color("LightBlue"), showBottomBorder: true))
                         
                        
                        
                        
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
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: addNewButton) {
                                Image(systemName: "plus")
                            }
                        }
                        
                    }
                    
                }
                
            }
            .topTabBarConfigurator(backgroundColor: Color("LightBlue"), showBottomBorder: true)
         //   .navigationTitle("Archive")
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


#Preview {
    Archive()
}

