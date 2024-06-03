//
//  FilterCellView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//
import SwiftUI

struct FilterCellView: View {
    let image: Image?
    let name: Text
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            if let image = image {
                Button(action: {
                    //
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(AppColors.grey3)
                            .frame(height: 33)
                        HStack {
                            image
                                .frame(width: 15, height: 15)
                                .foregroundColor(AppColors.white)
                            name
                                .italic()
                                .foregroundColor(AppColors.white)
                        }
                        .padding([.leading, .trailing])
                    }
                }
            } else {
                name
                    .italic()
                    .foregroundColor(AppColors.white)
                    .padding([.leading, .trailing])
            }
        }
    }
}
