//
//  Header.swift
//  TodoList
//
//  Created by Nunzio Ricci on 14/11/22.
//

import SwiftUI

extension PageView {
    func Header<Content: View>(_ title: String, @ViewBuilder left: () -> Content) -> some View {
        HStack {
            Title(title)
            Spacer()
            left()
        }
    }
    
    func Header(_ title: String) -> some View {
        HStack {
            Title(title)
            Spacer()
        }
    }
}
