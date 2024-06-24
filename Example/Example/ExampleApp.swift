import SwiftUI
import MLKitTranslate

@main
struct ExampleApp: App {
    func test() {
        _ = TranslatorOptions(sourceLanguage: .afrikaans, targetLanguage: .afrikaans)
    }
    
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
