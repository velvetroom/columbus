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
    
    //MARK: private
    
    private func changeAuthorization<T:MCreateLocationStrategyProtocol>(
        authStatus:CLAuthorizationStatus) -> T?
    {
        guard
            
            let locationManager:CLLocationManager = modelLocation?.locationManager
            
        else
        {
            return nil
        }
        
        modelLocation?.locationManager(
            locationManager,
            didChangeAuthorization:authStatus)
        
        let strategy:T? = modelCreate?.locationStrategy as? T
        
        return strategy
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
        let _:MCreateLocationStrategyUnknown? = changeAuthorization(
            authStatus:CLAuthorizationStatus.notDetermined)
        
        XCTAssertNil(
            modelCreate?.locationStrategy,
            "location strategy should still be nil")
    }
    
    func testChangeAuthorizationDenied()
    {
        let strategy:MCreateLocationStrategyDenied? = changeAuthorization(
            authStatus:CLAuthorizationStatus.denied)
        
        XCTAssertNotNil(
            strategy,
            "location strategy should be denied")
    }
    
    func testChangeAuthorizationAuthAlways()
    {
        let strategy:MCreateLocationStrategyReady? = changeAuthorization(
            authStatus:CLAuthorizationStatus.authorizedAlways)
        
        XCTAssertNotNil(
            strategy,
            "location strategy should be ready")
    }
    
    func testChangeAuthorizationAuthWhenInUse()
    {
        let strategy:MCreateLocationStrategyReady? = changeAuthorization(
            authStatus:CLAuthorizationStatus.authorizedWhenInUse)
        
        XCTAssertNotNil(
            strategy,
            "location strategy should be ready")
    }
    
    func testChangeAuthorizationRestricted()
    {
        let strategy:MCreateLocationStrategyDenied? = changeAuthorization(
            authStatus:CLAuthorizationStatus.restricted)
        
        XCTAssertNotNil(
            strategy,
            "location strategy should be denied")
    }
}
