import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class IntercomProvider: RuntimeProviderType {
    public let className: String = "Intercom"
    public let selectorName: String = "logEventWithName:metaData:"
    
    public init() {
    }
}

