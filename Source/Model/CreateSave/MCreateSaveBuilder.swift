import Foundation

final class MCreateSaveBuilder
{
    weak var model:MCreateSave?
    var renders:[MCreateSaveRender]
    var urls:[URL]
    let directory:URL
    private(set) weak var timer:Timer?
    private let kTimeout:TimeInterval = 9
    
    init(renders:[MCreateSaveRender], directory:URL)
    {
        self.renders = renders
        self.directory = directory
        urls = []
    }
    
    deinit
    {
        timer?.invalidate()
    }
    
    //MARK: selectors
    
    @objc
    private func selectorTimeout(sender timer:Timer)
    {
        timer.invalidate()
        model?.buildingError()
    }
    
    //MARK: private
    
    private func asyncStartTimer()
    {
        let timer:Timer = Timer.scheduledTimer(
            timeInterval:kTimeout,
            target:self,
            selector:#selector(selectorTimeout(sender:)),
            userInfo:nil,
            repeats:false)
        
        self.timer = timer
    }
    
    //MARK: internal
    
    func startTimer()
    {
        timer?.invalidate()
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncStartTimer()
        }
    }
}
