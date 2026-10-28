//
//  EventAnnotationView.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 23/10/26.
//


import SwiftUI

struct EventAnnotationView: View {
    let eventName: String
    let category: String
    let priceRange: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(eventName)
                .font(.caption)
                .fontWeight(.bold)
                .lineLimit(2)

            Text(category)
                .font(.caption2)
                .foregroundStyle(.secondary)

            Text(priceRange)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.green)
        }
        .padding(10)
        .frame(width: 160, alignment: .leading)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray.opacity(0.3), lineWidth: 1)
        }
    }
}
