import XCTest
@testable import columbus

final class UTMCreateLoad:XCTestCase
{
    private var model:MCreate?
    private let kWait:TimeInterval = 1
    
    override func setUp()
    {
        super.setUp()
        
        model = MCreate()
    }
    
    //MARK: internal
    
    func testLoadSettings()
    {
        let settingsExpectation:XCTestExpectation = expectation(
            description:"settings expectation")
        
        let bundle:Bundle = Bundle(for:UTMCreateLoad.self)
        model?.loadSettings(bundle:bundle)
        {
            settingsExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWait)
        { [weak self] (error:Error?) in
            
            XCTAssertNotNil(
                self?.model?.database,
                "failed loading database")
            
            XCTAssertNotNil(
                self?.model?.settings,
                "failed loading settings")
        }
    }
}
