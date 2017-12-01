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
        addStops(stops:plan.stopsArray, view:view)
        view.viewMap.centreUser()
    }
}
