public class AnalyticsKit {}

public extension AnalyticsKit {
    public class Firebase {
        static var firebase: FirebaseAnalyticsInterface?
        
        public static func regist(instance: FirebaseAnalyticsInterface) {
            self.firebase = instance
        }
        
        public static func register() {
            firebase?.register()
        }
        
        public static func logEvent() {
            assert(firebase != nil)
            firebase?.logEvent()
        }
    }
}
