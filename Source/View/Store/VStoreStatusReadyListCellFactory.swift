import UIKit

extension VStoreStatusReadyListCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let gradient:VGradient = VGradient.vertical(
            colourTop:UIColor.colourGradientDark,
            colourBottom:UIColor.colourGradientLight)
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView = imageView
        
        addSubview(gradient)
        addSubview(imageView)
        
        NSLayoutConstraint.topToTop(
            view:gradient,
            toView:self)
        NSLayoutConstraint.height(
            view:gradient,
            constant:kImageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:gradient,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self)
        NSLayoutConstraint.height(
            view:imageView,
            constant:kImageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self)
    }
}
