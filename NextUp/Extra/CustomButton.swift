import SwiftUI

struct CustomButton: View{
    
    var leftText: String
    var rightText: String
    var useImageBackground: Bool
    var backgroundImageName: String = "backgroundImage"
    var backgroundColor: Color = .blue
    var action: ()
    
    
    var body: some View {
        Button(action: {
            
        }) {
            HStack {
                Image(systemName: "highlighter")
                Text("Left Label")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Right Label")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .frame(height: 125)
            .background(
                Group {
                    if useImageBackground {
                        Image(backgroundImageName)
                            .resizable()
                            .scaledToFill()
                    } else {
                        backgroundColor
                    }
                }
           )
            .foregroundColor(.white)
            .cornerRadius(40)
            .frame(maxWidth: .infinity)
            
        }
    }
}
