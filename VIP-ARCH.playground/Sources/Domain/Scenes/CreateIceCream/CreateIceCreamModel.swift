
public enum CreateIceCream {
    
    public enum LoadIceCream {
        
        //Following payloads required to interaction b/w view - interactor - presentor
        public struct Request {}
        
        public struct Response {
            public var iceCream: IceCream
        }
        
        public struct ViewModel {
            public var iceCreamInfo: String
        }
    }
}

