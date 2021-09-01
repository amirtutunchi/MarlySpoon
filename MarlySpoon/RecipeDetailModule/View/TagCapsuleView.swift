//
//  TagCapsuleView.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import SwiftUI

struct TagCapsuleView: View {
  let tag: Tag
  var body: some View {
    Text(" \(tag.name ?? "") ")
      .background(Color("purpleColor"))
      .foregroundColor(.white)
      .clipShape(Capsule())
  }
}

struct TagCapsuleView_Previews: PreviewProvider {
  static var previews: some View {
    let tag = Tag.init(name: "example tag")
    TagCapsuleView(tag: tag)
  }
}
