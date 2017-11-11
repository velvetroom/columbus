import XCTest
@testable import columbus

final class UTMCreateLocationStrategyReady:XCTestCase
{
    private var model:MCreate?
    private let kWait:TimeInterval = 1
    private let kAsyncAfter:TimeInterval = 0.4
    
    override func setUp()
    {
        super.setUp()
        
        model = MCreate()
        model?.changeLocationStrategy(
            locationStrategyType:MCreateLocationStrategyReady.self)
    }
    
    //MARK: private
    
    private func loadSettingsDeletePerks(
        completion:@escaping(() -> ()))
    {
        loadSettings
        { [weak self] in
                
            self?.deletePerks
            {
                completion()
            }
        }
    }
    
    private func loadSettings(
        completion:@escaping(() -> ()))
    {
        let bundle:Bundle = Bundle(for:UTMCreateLoad.self)
        model?.loadSettings(bundle:bundle)
        {
            completion()
        }
    }
    
    private func deletePerks(
        completion:@escaping(() -> ()))
    {
        model?.database?.fetch
        { [weak self] (perks:[DPerk]) in
            
            self?.deletePerks(
                perks:perks,
                completion:completion)
        }
    }
    
    private func deletePerks(
        perks:[DPerk],
        completion:@escaping(() -> ()))
    {
        guard
        
            let database:Database = model?.database
        
        else
        {
            return
        }
        
        for perk:DPerk in perks
        {
            database.delete(data:perk) { }
        }
        
        database.save
        {
            completion()
        }
    }
    
    private func createPlan(
        completion:@escaping(() -> ()))
    {
        model?.database?.create
        { (plan:DPlan) in
            
            completion()
        }
    }
    
    private func nextStep(
        completion:@escaping(() -> ()))
    {
        guard
        
            let model:MCreate = self.model
        
        else
        {
            return
        }
        
        model.locationStrategy?.nextStep(model:model)
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAsyncAfter)
        {
            completion()
        }
    }
    
    //MARK: tests
    
    func testDatabaseError()
    {
        guard
            
            let model:MCreate = self.model
        
        else
        {
            return
        }
        
        model.locationStrategy?.nextStep(model:model)
        
        let status:MCreateStatusErrorDatabase? = model.status as? MCreateStatusErrorDatabase
        
        XCTAssertNotNil(
            status,
            "status should be error database")
    }
    
    func testAvailabilityError()
    {
        let errorExpectation:XCTestExpectation = expectation(
            description:"error expectation failed")
        
        loadSettingsDeletePerks
        { [weak self] in
            
            self?.createPlan
            { [weak self] in
                
                self?.nextStep
                {
                    errorExpectation.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout:kWait)
        { [weak self] (error:Error?) in
            
            let status:MCreateStatusErrorAvailability? = self?.model?.status as? MCreateStatusErrorAvailability
            
            XCTAssertNotNil(
                status,
                "status should be availability error")
        }
    }
    
    func testAvailable()
    {
        let availableExpectation:XCTestExpectation = expectation(
            description:"error expectation failed")
        
        loadSettingsDeletePerks
        { [weak self] in
                
            self?.nextStep
            {
                availableExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWait)
        { [weak self] (error:Error?) in
            
            XCTAssertNotNil(
                self?.model?.plan,
                "failed creating plan")
            
            let mapStatus:MCreateMapStatusContracted? = self?.model?.mapStatus as? MCreateMapStatusContracted
            
            XCTAssertNotNil(
                mapStatus,
                "map status should be contracted")
            
            let status:MCreateStatusReady? = self?.model?.status as? MCreateStatusReady
            
            XCTAssertNotNil(
                status,
                "status should be ready")
        }
    }
}
