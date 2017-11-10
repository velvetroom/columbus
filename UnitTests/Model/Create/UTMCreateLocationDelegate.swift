import XCTest
import CoreLocation
@testable import columbus

final class UTMCreateLocationDelegate:XCTestCase
{
    private var modelLocation:MCreateLocationDelegate?
    private var modelCreate:MCreate?
    private let kAccuracy:CLLocationAccuracy = kCLLocationAccuracyBestForNavigation
    
    override func setUp()
    {
        super.setUp()
        
        modelLocation = MCreateLocationDelegate()
        modelCreate = MCreate()
        modelLocation?.model = modelCreate
        modelLocation?.askAuthorization()
    }
    
    //MARK: tests
    
    func testAskAuthorization()
    {
        XCTAssertNotNil(
            modelLocation?.locationManager,
            "failed creating location manager")
        
        XCTAssertNotNil(
            modelLocation?.locationManager?.delegate,
            "failed assigning delegate to location manager")
        
        XCTAssertEqual(
            modelLocation?.locationManager?.desiredAccuracy,
            kAccuracy,
            "failed assigning maximum accuracy for location manager")
    }
    
    func testClean()
    {
        modelLocation?.clean()
        
        XCTAssertNil(
            modelLocation?.locationManager?.delegate,
            "failed removing delegate from location manager")
    }
}
