import AppFeature
import DependenciesTestSupport
import Testing

@Test(.dependencies { $0.uuid = .incrementing })
func usesOverriddenUUIDDependency() {
  #expect(AppFeature.makeID().uuidString == "00000000-0000-0000-0000-000000000000")
}
