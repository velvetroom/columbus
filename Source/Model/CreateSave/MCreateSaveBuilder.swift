import Foundation

final class MCreateSaveBuilder
{
    weak var model:MCreateSave?
    var renders:[MCreateSaveRender]
    var urls:[URL]
    let directory:URL
    private(set) weak var timer:Timer?
    private let totalRenders:Float
    
    init(renders:[MCreateSaveRender], directory:URL)
    {
        self.renders = renders
        self.directory = directory
        totalRenders = Float(renders.count)
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
            timeInterval:MCreateSave.Constants.saveTimeout,
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
    
    func progress() -> Float
    {
        let current:Float = totalRenders - Float(renders.count)
        let percent:Float = current / totalRenders
        
        return percent
    }
}
