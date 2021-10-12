import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class MixpanelProvider: RuntimeProviderType {
    public var manualLogOnly: Bool = false
    public let className: String = "Mixpanel"
    public let instanceSelectorName: String? = "sharedInstance"
    public let selectorName: String = "track:properties:"

    public init() {
    }
}
