//
//  Recipe.swift
//  MarlySpoon
//
//  Created by Amir Tutunchi on 9/1/21.
//

import Foundation
import Contentful

public final class Recipe: EntryDecodable {
  public static let contentTypeId: String = "recipe"
  public let id: String
  public let localeCode: String?
  public let updatedAt: Date?
  public let createdAt: Date?
  public let title: String?
  public let description: String?
  public var chef: Chef?
  public var photo: Asset?
  public var tags: [Tag]?
  public init(title: String, description: String, chef: Chef, tags: [Tag]) {
    self.title = title
    self.description = description
    self.chef = chef
    self.tags = tags
    self.id = UUID().uuidString
    self.localeCode = "en-US"
    self.createdAt = Date()
    self.updatedAt = Date()
  }
  public required init(from decoder: Decoder) throws {
    let sys = try decoder.sys()
    id = sys.id
    localeCode = sys.locale
    updatedAt = sys.updatedAt
    createdAt = sys.createdAt
    let fields = try decoder.contentfulFieldsContainer(keyedBy: Recipe.FieldKeys.self)
    self.title = try fields.decodeIfPresent(String.self, forKey: .title)
    self.description = try fields.decodeIfPresent(String.self, forKey: .description)
    try fields.resolveLink(forKey: .chef, decoder: decoder) { [weak self] linkedChef in
      self?.chef = linkedChef as? Chef
    }
    try fields.resolveLink(forKey: .photo, decoder: decoder) { [weak self] photo in
      self?.photo = photo as? Asset
    }
    try fields.resolveLinksArray(forKey: .tags, decoder: decoder) { [weak self] tags in
      self?.tags = tags as? [Tag]
    }
  }
}
extension Recipe: FieldKeysQueryable {
  public enum FieldKeys: String, CodingKey {
    case title, description, tags, chef, photo, calories, name
  }
}
extension Recipe: Identifiable {}

extension Recipe: ObservableObject {}
