//
//  Styles.swift
//  TASK
//
//  Created by macbook pro on 29/06/24.
//

import Foundation
import SwiftUI

extension Text {

    func titleTextStyle() -> some View {
        self.foregroundColor(textColor)
            .font(.system(size: 24))
            .foregroundColor(textColor)
            .bold()

    }

    func descriptionTextStyle() -> some View {
        self.foregroundColor(.secondary)
            .font(.system(size: 16))
            .foregroundColor(textColor)

    }
    func labelTextStyle() -> some View {
        self.foregroundColor(.secondary)
            .font(.system(size: 20))
            .foregroundColor(textColor)

    }
}
