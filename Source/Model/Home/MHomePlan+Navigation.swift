import Foundation

extension MHomePlan
{
    //MARK: private
    
    private func addStops(
        stops:[DPlanStop],
        view:VHomeReady)
    {
        for stop:DPlanStop in stops
        {
            view.viewMap.addStop(stop:stop)
        }
    }
    
    //MARK: internal
    
    func addMapNavigation(view:VHomeReady)
    {
        guard
        
            let stops:[DPlanStop] = plan.stops?.array as? [DPlanStop]
        
        else
        {
            return
        }
        
        addStops(stops:stops, view:view)
        view.viewMap.centreUser()
    }
}
