//
//  Defaultable.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import Foundation

/// This allows you to still decode an enum from a raw value not in its cases.
///
/// Swift throws a DecodingError when decoding from a raw value that doesn't map to one of enum's cases.
///
/// Example usage:
///
///     enum Gender: String, Codable, Defaultable {
///       case male, female, other
///
///       static var defaultValue: Gender {
///         return .other
///       }
///     }
///
///     struct User: Codable {
///       let id: String?
///       let gender: Gender?
///     }
///
///     // sample json data: {"id": "abc123", "gender": "undecided"}
///     print(JSONDecoder().decode(User.self, from: jsonData))
///     // Prints User(id: Optional("abc123"), gender: Optional(__lldb_expr_31.Gender.unknown))
///
protocol Defaultable: RawRepresentable {
  static var defaultValue: Self { get }
}

extension Defaultable {
  static func value(for rawValue: RawValue) -> Self {
    return Self(rawValue: rawValue) ?? Self.defaultValue
  }
}

extension Defaultable where Self.RawValue: Decodable {
  init(from decoder: Decoder) throws {
    self = Self.value(for: try decoder.singleValueContainer().decode(RawValue.self))
  }
}
