//
//  RatingView.swift
//  Bookworm
//
//  Created by John Bradshaw on 21/06/2025.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var label = ""
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow

    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                        .accessibilityElement()
                        .accessibilityLabel(label)
                        .accessibilityAdjustableAction { direction in
                            switch direction {
                            case .increment:
                                if rating < maximumRating { rating += 1 }
                                if rating > 1 { rating -= 1 }
                            default:
                                break
                            }
                        }
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
    
}


#Preview {
    RatingView(rating: .constant(4))
}
