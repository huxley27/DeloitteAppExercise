//
//  Helpers.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import Foundation

struct Helpers {}

// MARK: - Logging

func debugLog(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
  #if DEBUG
    let fileURL = NSURL(fileURLWithPath: file)
    let fileName = fileURL.deletingPathExtension?.lastPathComponent ?? ""
    print("\(Date().dblog()) \(fileName)::\(function)[L:\(line)] \(message)")
  #endif
  // Nothing to do if not debugging
}

func debugJSON(_ value: AnyObject) {
  #if DEBUG
    //
  #endif
}

// MARK: - File Management

public func jsonDictionaryFromFile(_ name: String, bundle: Bundle = Bundle.main) throws -> JSONDictionary? {
  let path = bundle.path(forResource: name, ofType: "json")!
  guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return nil }
  let options = JSONSerialization.ReadingOptions.mutableContainers
  return try JSONSerialization.jsonObject(with: data, options: options) as? JSONDictionary
}

/// - parameter name: Name of HTML file excluding extension.
func htmlStringFromFile(_ name: String, bundle: Bundle = Bundle.main) -> String? {
  let path = bundle.path(forResource: name, ofType: "html")
  return try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
}

// MARK: - Threading

/// Performs an intensive process in the background, then calls the specified completion
/// block, if provided, on the main thread.
func performInBackground(_ work: @escaping VoidResult, completion: (VoidResult)? = nil) {
  DispatchQueue.global(qos: .background).async {
    work()
    DispatchQueue.main.async {
      completion?()
    }
  }
}

func delay(_ seconds: Double, task: @escaping VoidResult) {
  let when = DispatchTime.now() + seconds
  DispatchQueue.main.asyncAfter(deadline: when, execute: task)
}

// MARK: - Others

func attributedStringFromHTMLString(_ html: String) -> NSAttributedString? {
  guard let data = html.data(using: .utf16, allowLossyConversion: false) else { return nil }
  let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
  return try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
}
