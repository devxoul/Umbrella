import Foundation
import CoreGraphics

public protocol PrimitiveType {
}

extension String: PrimitiveType {}

extension Bool: PrimitiveType {}

extension Int: PrimitiveType {}
extension Int8: PrimitiveType {}
extension Int16: PrimitiveType {}
extension Int32: PrimitiveType {}
extension Int64: PrimitiveType {}

extension UInt: PrimitiveType {}
extension UInt8: PrimitiveType {}
extension UInt16: PrimitiveType {}
extension UInt32: PrimitiveType {}
extension UInt64: PrimitiveType {}

extension Float: PrimitiveType {}
extension Double: PrimitiveType {}

extension NSNumber: PrimitiveType {}
extension CGFloat: PrimitiveType {}

extension Array: PrimitiveType where Element: PrimitiveType {}
extension Dictionary: PrimitiveType where Value: PrimitiveType {}
