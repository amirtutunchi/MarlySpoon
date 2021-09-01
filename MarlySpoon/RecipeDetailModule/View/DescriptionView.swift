//
//  DescriptionView.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import SwiftUI

struct DescriptionView: View {
  let description: String
  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      Image("book")
        .resizable()
        .frame(width: 56, height: 56, alignment: .center)
        .scaledToFit()
        .cornerRadius(28)
      Text("Description")
        .font(.headline)
        .fontWeight(.medium)
        .foregroundColor(Color("textColor"))
      Spacer()
    }
    .padding(.leading)
    .frame(maxWidth: .infinity)
    Text(description)
      .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
      .fontWeight(.light)
      .multilineTextAlignment(.leading)
  }
}

struct DescriptionView_Previews: PreviewProvider {
  static var previews: some View {
    DescriptionView(description: "some sample description")
  }
}
