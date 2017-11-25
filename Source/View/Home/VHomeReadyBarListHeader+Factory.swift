import UIKit

extension VHomeReadyBarListHeader
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(colour:UIColor(white:0, alpha:0.2))
        
        let labelDistance:UILabel = UILabel()
        labelDistance.isUserInteractionEnabled = false
        labelDistance.backgroundColor = UIColor.clear
        labelDistance.translatesAutoresizingMaskIntoConstraints = false
        labelDistance.textColor = UIColor.colourBackgroundDark
        self.labelDistance = labelDistance
        
        let labelDuration:UILabel = UILabel()
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.isUserInteractionEnabled = false
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.textColor = UIColor.colourBackgroundDark
        self.labelDuration = labelDuration
        
        addSubview(border)
        addSubview(labelDuration)
        addSubview(labelDistance)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
}
