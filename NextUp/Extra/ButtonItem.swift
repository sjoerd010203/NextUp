import Foundation
import SwiftUI

struct ButtonItem: Identifiable {
    let id: UUID
    let leftText: String
    let rightText: String
    let useImageBackground: Bool
    let backgroundImageName: String
    let backgroundColor: Color
}
