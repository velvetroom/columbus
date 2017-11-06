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
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.bold(size:kTitleFontSize)
        labelTitle.textColor = UIColor.white
        self.labelTitle = labelTitle
        
        let labelDescr:UILabel = UILabel()
        labelDescr.translatesAutoresizingMaskIntoConstraints = false
        labelDescr.backgroundColor = UIColor.clear
        labelDescr.isUserInteractionEnabled = false
        labelDescr.numberOfLines = 0
        self.labelDescr = labelDescr
        
        addSubview(gradient)
        addSubview(imageView)
        addSubview(labelTitle)
        addSubview(labelDescr)
        
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
        
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:imageView)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelDescr,
            toView:self,
            constant:kDescrMargin)
        layoutDescrHeight = NSLayoutConstraint.height(
            view:labelDescr)
        NSLayoutConstraint.equalsHorizontal(
            view:labelDescr,
            toView:self,
            margin:kDescrMargin)
    }
}
