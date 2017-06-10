import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AnswersProvider: RuntimeProviderType {
  open let className: String = "Answers"
  open let selectorName: String = "logCustomEventWithName:customAttributes:"

  public init() {
  }
}
