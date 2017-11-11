import XCTest
import CoreLocation
@testable import columbus

final class UTMCreateLocationFactory:XCTestCase
{
    //MARK: private
    
    private func factoryStrategy<T:MCreateLocationStrategyProtocol>(
        status:CLAuthorizationStatus) -> T.Type?
    {
        let strategy:T.Type? = MCreate.factoryLocationStrategy(
            status:status) as? T.Type
        
        return strategy
    }
    
    //MARK: tests
    
    func testFactoryLocationStrategyAuthAlways()
    {
        let strategy:MCreateLocationStrategyReady.Type? = factoryStrategy(
            status:CLAuthorizationStatus.authorizedAlways)
        
        XCTAssertNotNil(
            strategy,
            "failed factoring strategy ready")
    }
    
    func testFactoryLocationStrategyAuthWhenInUse()
    {
        let strategy:MCreateLocationStrategyReady.Type? = factoryStrategy(
            status:CLAuthorizationStatus.authorizedWhenInUse)
        
        XCTAssertNotNil(
            strategy,
            "failed factoring strategy ready")
    }
    
    func testFactoryLocationStrategyDenied()
    {
        let strategy:MCreateLocationStrategyDenied.Type? = factoryStrategy(
            status:CLAuthorizationStatus.denied)
        
        XCTAssertNotNil(
            strategy,
            "failed factoring strategy denied")
    }
    
    func testFactoryLocationStrategyNotDetermined()
    {
        let strategy:MCreateLocationStrategyUnknown.Type? = factoryStrategy(
            status:CLAuthorizationStatus.notDetermined)
        
        XCTAssertNotNil(
            strategy,
            "failed factoring strategy unknown")
    }
    
    func testFactoryLocationStrategyRestricted()
    {
        let strategy:MCreateLocationStrategyDenied.Type? = factoryStrategy(
            status:CLAuthorizationStatus.restricted)
        
        XCTAssertNotNil(
            strategy,
            "failed factoring strategy restricted")
    }
}
