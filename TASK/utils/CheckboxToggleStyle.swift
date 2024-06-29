//
//  CheckboxToggleStyle.swift
//  TASK
//
//  Created by macbook pro on 29/06/24.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    HStack {
      configuration.label
      Spacer()
      Image(systemName: configuration.isOn ? "checkmark.square" : "square")
        .resizable()
        .frame(width: 36, height: 36)
        .onTapGesture { configuration.isOn.toggle() }
    }
  }
}
