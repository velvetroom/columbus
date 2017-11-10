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
        XCTAssertNil(
            modelCreate?.status,
            "create status should be nil")
        
        XCTAssertNil(
            modelCreate?.locationStrategy,
            "location strategy should be nil")
        
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
    
    func testChangeAuthorizationNotDetermined()
    {
        guard
        
            let locationManager:CLLocationManager = modelLocation?.locationManager
        
        else
        {
            return
        }
        
        modelLocation?.locationManager(
            locationManager,
            didChangeAuthorization:CLAuthorizationStatus.notDetermined)
        
        XCTAssertNil(
            modelCreate?.locationStrategy,
            "location strategy should still be nil")
    }
    
    func testChangeAuthorizationDenied()
    {
        guard
            
            let locationManager:CLLocationManager = modelLocation?.locationManager
            
        else
        {
            return
        }
        
        modelLocation?.locationManager(
            locationManager,
            didChangeAuthorization:CLAuthorizationStatus.denied)
        
        let strategy:MCreateLocationStrategyDenied? = modelCreate?.locationStrategy as? MCreateLocationStrategyDenied
        
        XCTAssertNil(
            strategy,
            "location strategy should be denied")
    }
}
