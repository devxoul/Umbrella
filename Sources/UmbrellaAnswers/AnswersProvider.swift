import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AnswersProvider: RuntimeProviderType {
  public let className: String = "Answers"
  public let selectorName: String = "logCustomEventWithName:customAttributes:"

  public init() {
  }
}
