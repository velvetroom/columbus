import UIKit

final class VHomeReadyBarHeader:View<ArchHome>
{
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.white
        
        guard
            
            let distance:String = factoryDistance(),
            let duration:String = factoryDuration()
            
        else
        {
            return
        }
        
        factoryViews(
            distance:distance,
            duration:duration)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryDistance() -> String?
    {
        guard
            
            let travels:[DPlanTravel] = controller.model.plan?.plan.travels?.array as? [DPlanTravel],
            let settings:DSettings = controller.model.settings
            
        else
        {
            return nil
        }
        
        let distance:String? = VFormat.factoryDistance(
            travels:travels,
            distanceSettings:settings.distance)
        
        return distance
    }
    
    private func factoryDuration() -> String?
    {
        guard
            
            let travels:[DPlanTravel] = controller.model.plan?.plan.travels?.array as? [DPlanTravel]
            
        else
        {
            return nil
        }
        
        let duration:String? = VFormat.factoryDuration(travels:travels)
        
        return duration
    }
    
    private func factoryViews(
        distance:String,
        duration:String)
    {
        let colourText:UIColor = UIColor.colourBackgroundDark.withAlphaComponent(0.45)
        let colourIcons:UIColor = UIColor.colourBackgroundDark.withAlphaComponent(0.2)
        
        let border:VBorder = VBorder(colour:UIColor.colourBackgroundGray)
        
        let iconDistance:UIImageView = UIImageView()
        iconDistance.translatesAutoresizingMaskIntoConstraints = false
        iconDistance.clipsToBounds = true
        iconDistance.contentMode = UIViewContentMode.center
        iconDistance.isUserInteractionEnabled = false
        iconDistance.image = #imageLiteral(resourceName: "assetMapDistance").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        iconDistance.tintColor = colourIcons
        
        let iconDuration:UIImageView = UIImageView()
        iconDuration.translatesAutoresizingMaskIntoConstraints = false
        iconDuration.clipsToBounds = true
        iconDuration.isUserInteractionEnabled = false
        iconDuration.contentMode = UIViewContentMode.center
        iconDuration.image = #imageLiteral(resourceName: "assetMapDuration").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        iconDuration.tintColor = colourIcons
        
        let labelDistance:UILabel = UILabel()
        labelDistance.isUserInteractionEnabled = false
        labelDistance.backgroundColor = UIColor.clear
        labelDistance.translatesAutoresizingMaskIntoConstraints = false
        labelDistance.textColor = colourText
        labelDistance.font = UIFont.regular(size:VHomeReadyBarListCell.Constants.fontSize)
        labelDistance.text = distance
        
        let labelDuration:UILabel = UILabel()
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.isUserInteractionEnabled = false
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.textColor = colourText
        labelDuration.font = UIFont.regular(size:VHomeReadyBarListCell.Constants.fontSize)
        labelDuration.text = duration
        
        addSubview(border)
        addSubview(labelDuration)
        addSubview(labelDistance)
        addSubview(iconDistance)
        addSubview(iconDuration)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:iconDistance,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:iconDistance,
            toView:self)
        NSLayoutConstraint.width(
            view:iconDistance,
            constant:VHomeReadyBarListCell.Constants.iconWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:iconDuration,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:iconDuration,
            toView:self)
        NSLayoutConstraint.width(
            view:iconDuration,
            constant:VHomeReadyBarListCell.Constants.iconWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelDistance,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:labelDistance,
            toView:iconDistance)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelDistance)
        
        NSLayoutConstraint.equalsVertical(
            view:labelDuration,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:labelDuration,
            toView:iconDuration)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelDuration)
    }
}
