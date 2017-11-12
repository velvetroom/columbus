import MapKit

extension VCreateSearchBaseListCell
{
    //MARK: private
    
    private func factoryTitle(
        model:MKLocalSearchCompletion) -> NSAttributedString
    {
        let highlightRanges:[NSValue] = model.titleHighlightRanges
        let string:NSMutableAttributedString = NSMutableAttributedString(
            string:model.title,
            attributes:attributesTitle)
        
        for highlightRange:NSValue in highlightRanges
        {
            let range:NSRange = highlightRange.rangeValue
            string.addAttributes(
                attributesTitleHighlighted,
                range:range)
        }
        
        return string
    }
    
    private func factorySubtitle(
        model:MKLocalSearchCompletion) -> NSAttributedString?
    {
        let subtitle:String = model.subtitle
        
        guard
        
            subtitle.count > 0
        
        else
        {
            return nil
        }
        
        let highlightRanges:[NSValue] = model.subtitleHighlightRanges
        let string:NSMutableAttributedString = NSMutableAttributedString(
            string:subtitle,
            attributes:attributesSubtitle)
        
        for highlightRange:NSValue in highlightRanges
        {
            let range:NSRange = highlightRange.rangeValue
            string.addAttributes(
                attributesSubtitleHighlighted,
                range:range)
        }
        
        return string
    }
    
    //MARK: internal
    
    func factoryText(
        model:MKLocalSearchCompletion) -> NSAttributedString
    {
        let title:NSAttributedString = factoryTitle(
            model:model)
        
        let string:NSMutableAttributedString = NSMutableAttributedString()
        string.append(title)
        
        if let subtitle:NSAttributedString = factorySubtitle(
            model:model)
        {
            string.append(breakLine)
            string.append(subtitle)
        }
        
        return string
    }
}
