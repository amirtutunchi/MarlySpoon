//
//  TagView.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import SwiftUI

struct TagView: View {
  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      Image("tag")
        .resizable()
        .frame(width: 16, height: 20, alignment: .center)
        .scaledToFit()
        .cornerRadius(28)
      Text("Tags")
        .font(.headline)
        .fontWeight(.medium)
        .foregroundColor(Color("textColor"))
      Spacer()
    }
    .padding(.leading)
    .frame(maxWidth: .infinity)
  }
}

struct TagView_Previews: PreviewProvider {
  static var previews: some View {
    TagView()
  }
}
