//
//  ChefView.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import SwiftUI

struct ChefView: View {
  let chef: Chef
  var body: some View {
    HStack( alignment: .center, spacing: 16) {
      Image(systemName: "person.circle.fill")
        .resizable()
        .frame(width: 50, height: 50, alignment: .center)
        .foregroundColor(Color("purpleColor"))
      Text(chef.name ?? "Unknown Chef")
        .font(.headline)
        .fontWeight(.medium)
        .foregroundColor(Color("textColor"))
      Spacer()
    }
  }
}

struct ChefView_Previews: PreviewProvider {
  static var previews: some View {
    let chef = Chef.init(name: "John Doe")
    ChefView(chef: chef)
  }
}
