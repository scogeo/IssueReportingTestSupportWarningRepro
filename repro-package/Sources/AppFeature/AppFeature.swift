import Dependencies
import Foundation

public enum AppFeature {
  public static func makeID() -> UUID {
    @Dependency(\.uuid) var uuid
    return uuid()
  }
}
