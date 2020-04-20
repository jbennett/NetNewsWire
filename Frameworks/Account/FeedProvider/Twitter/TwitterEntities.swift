//
//  TwitterEntities.swift
//  Account
//
//  Created by Maurice Parker on 4/18/20.
//  Copyright © 2020 Ranchero Software, LLC. All rights reserved.
//

import Foundation

protocol TwitterEntity {
	var indices: [Int]? { get }
	func renderAsHTML() -> String
}

extension TwitterEntity {
	var startIndex: Int? {
		if indices?.count ?? 0 > 0 {
			return indices?[0]
		}
		return nil
	}
	
	var endIndex: Int? {
		if indices?.count ?? 0 > 1 {
			return indices?[1]
		}
		return nil
	}
	
}

struct TwitterEntities: Codable {
	
	let hashtags: [TwitterHashtag]?
	let urls: [TwitterURL]?
	let userMentions: [TwitterMention]?
	let symbols: [TwitterSymbol]?

	enum CodingKeys: String, CodingKey {
		case hashtags = "hashtags"
		case urls = "urls"
		case userMentions = "user_mentions"
		case symbols = "symbols"
	}
	
	func combineAndSort() -> [TwitterEntity] {
		var entities = [TwitterEntity]()
		if let hashtags = hashtags {
			entities.append(contentsOf: hashtags)
		}
		if let urls = urls {
			entities.append(contentsOf: urls)
		}
		if let userMentions = userMentions {
			entities.append(contentsOf: userMentions)
		}
		if let symbols = symbols {
			entities.append(contentsOf: symbols)
		}
		return entities
	}
	
}
