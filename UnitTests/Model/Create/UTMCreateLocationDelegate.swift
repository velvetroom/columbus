import XCTest
import CoreLocation
@testable import columbus

final class UTMCreateLocationDelegate:XCTestCase
{
    private let kAccuracy:CLLocationAccuracy = kCLLocationAccuracyBestForNavigation
    
    //MARK: tests
    
    func testAskAuthorization()
    {
        let model:MCreateLocationDelegate = MCreateLocationDelegate()
        model.askAuthorization()
        
        XCTAssertNotNil(
            model.locationManager,
            "failed creating location manager")
        
        XCTAssertNotNil(
            model.locationManager?.delegate,
            "failed assigning delegate to location manager")
        
        XCTAssertEqual(
            model.locationManager?.desiredAccuracy,
            kAccuracy,
            "failed assigning maximum accuracy for location manager")
    }
}
