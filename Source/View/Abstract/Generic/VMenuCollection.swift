import UIKit

extension VMenu:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MMenuItemProtocol
    {
        let item:MMenuItemProtocol = controller.menu.items[index.item]
        
        return item
    }
    
    private func selectCurrent()
    {
        let indexSelected:Int = controller.menu.selected.rawValue
        let indexPath:IndexPath = IndexPath(
            item:indexSelected,
            section:0)
        
        collectionView.selectItem(
            at:indexPath,
            animated:false,
            scrollPosition:UICollectionViewScrollPosition())
    }
    
    //MARK: internal
    
    func factoryCollection()
    {
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.headerReferenceSize = CGSize.zero
        flow.footerReferenceSize = CGSize.zero
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        let collectionView:UICollectionView = UICollectionView(
            frame:CGRect.zero,
            collectionViewLayout:flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.clipsToBounds = true
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            VMenuCell.self,
            forCellWithReuseIdentifier:
            VMenuCell.reusableIdentifier)
        self.collectionView = collectionView
        
        addSubview(collectionView)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
        
        selectCurrent()
    }
    
    //MARK: collectionViewDelegate
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard
        
            let cellSize:CGSize = self.cellSize
        
        else
        {
            let countCells:CGFloat = CGFloat(controller.menu.items.count)
            let width:CGFloat = collectionView.bounds.width
            let widthPerCell:CGFloat = width / countCells
            let height:CGFloat = collectionView.bounds.height
            
            let cellSize:CGSize = CGSize(
                width:widthPerCell,
                height:height)
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    func numberOfSections(
        in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.menu.items.count
        
        return count
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MMenuItemProtocol = modelAtIndex(index:indexPath)
        let cell:VMenuCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VMenuCell.reusableIdentifier,
            for:indexPath) as! VMenuCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        let item:MMenuItemProtocol = modelAtIndex(index:indexPath)
        let order:MMenu.Order = item.order
        
        if order == controller.menu.selected
        {
            return false
        }
        
        return true
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:MMenuItemProtocol = modelAtIndex(index:indexPath)
        controller.menuSelected(item:item)
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kDeselectTime)
        { [weak collectionView] in
            
            collectionView?.isUserInteractionEnabled = true
        }
    }
}
