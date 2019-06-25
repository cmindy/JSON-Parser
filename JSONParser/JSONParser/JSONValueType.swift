//
//  JSONValueType.swift
//  JSONParser
//
//  Created by CHOMINJI on 19/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol JSONValueType {
    var typeDescription: String { get }
}

protocol JSONContainerType: JSONValueType {
    var totalCount: Int { get }
    var typeCounts: [String: Int] { get }
    func prettyFormat(with indent: Int) -> String
    func insertTab(_ indent: Int) -> String
}

extension JSONContainerType {
    func insertTab(_ indent: Int) -> String {
        let tab = String.init(repeating: "\t", count: indent + 1)
        return tab
    }
}

extension String: JSONValueType {
    var typeDescription: String {
        return "문자열"
    }
}

typealias Number = Int
extension Number: JSONValueType {
    var typeDescription: String {
        return "숫자"
    }
}

extension Bool: JSONValueType {
    var typeDescription: String {
        return "부울"
    }
}

typealias Object = [String: JSONValueType]
extension Object: JSONValueType where Key == String, Value: JSONValueType {
    var typeDescription: String {
        return "객체"
    }
}

extension Object: JSONContainerType {
    var totalCount: Int {
        return self.count
    }
    
    var typeCounts: [String: Int] {
        var counts: [String: Int] = [:]
        for (_, value) in self {
            counts[value.typeDescription, default: 0] += 1
        }
        return counts
    }
    
        return jsonString
    }
}

typealias JSONArray = [JSONValueType]
extension JSONArray: JSONValueType where Element == JSONValueType {
    var typeDescription: String {
        return "배열"
    }
}

extension JSONArray: JSONContainerType {
    var totalCount: Int {
        return self.count
    }
    
    var typeCounts: [String: Int] {
        var counts: [String: Int] = [:]
        for data in self {
            counts[data.typeDescription, default: 0] += 1
        }
        return counts
    }
    
        
    }
}
