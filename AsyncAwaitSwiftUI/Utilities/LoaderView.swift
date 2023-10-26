//
//  LoaderView.swift
//  AsyncAwaitSwiftUI
//
//  Created by Ayush Gupta on 26/10/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(1.0, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
    }
}

#Preview {
    LoaderView()
}
