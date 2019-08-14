/**
 MIT License
 
 Copyright (c) 2018 MaherKSantina
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

public typealias XibItemsConfiguration = ([Any]?) -> Void

extension UIView {
    public func loadXibItems(xibBundle: Bundle? = nil, xibName: String? = nil, xibItemsConfiguration: XibItemsConfiguration? = nil) {
        let items = (xibBundle ?? Bundle(for: type(of: self))).loadNibNamed(xibName ?? String(describing: type(of: self)), owner: self, options: nil)
        xibItemsConfiguration?(items)
    }
    
    public func loadXibMainView(xibBundle: Bundle? = nil, xibName: String? = nil, constraintsConfiguration: ConstraintsConfiguration? = nil) {
        loadXibItems(xibBundle: xibBundle, xibName: xibName) { items in
            guard let firstView = items?.first as? UIView else {
                assertionFailure("First object in xib \(xibName ?? String(describing: type(of: self))) is not a view")
                return
            }
            self.addSubviewWithConstraints(firstView, constraintsConfiguration: constraintsConfiguration)
        }
    }
}

open class MSAutoView: UIView {
    public weak var tableViewCell: UITableViewCell?
    public weak var collectionViewCell: UICollectionViewCell?
    
    var xibName: String?
    var xibBundle: Bundle?
    var constraintsConfiguration: ConstraintsConfiguration?
    
    var indexPath: IndexPath?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    open func initView() {
        loadXibMainView(xibBundle: xibBundle, xibName: xibName, constraintsConfiguration: constraintsConfiguration)
    }
    
    open func updateView() {
        // Override
    }
    
    open func updateEmptyView() {
        // Override
    }
    
    open func prepareForReuse() {
        // Override
    }
    
}

/// Defines a way to embed a view in a UITableViewHeaderFooterView
protocol TableViewHeaderFooterEmbeddable {
    associatedtype View: UIView
    
    var tableViewHeaderFooterView: BaseTableViewHeaderFooterView<View> { get }
    
    static var tableViewHeaderFooterView: BaseTableViewHeaderFooterView<View>.Type { get }
}

extension TableViewHeaderFooterEmbeddable where Self: UIView {
    var tableViewHeaderFooterView: BaseTableViewHeaderFooterView<Self> {
        let v = BaseTableViewHeaderFooterView<Self>()
        v.addMainView(self)
        return v
    }
    
    static var tableViewHeaderFooterView: BaseTableViewHeaderFooterView<Self>.Type {
        return BaseTableViewHeaderFooterView<Self>.self
    }
}

// Make all views embeddable
extension UIView: TableViewHeaderFooterEmbeddable {}

/// Defines a way to embed a view in a UITableViewHeaderFooterView
protocol TableViewCellEmbeddable {
    associatedtype View: MSAutoView
    
    var tableViewCell: BaseTableViewCell<View> { get }
    
    static var tableViewCell: BaseTableViewCell<View>.Type { get }
}

extension TableViewCellEmbeddable where Self: MSAutoView {
    var tableViewCell: BaseTableViewCell<Self> {
        let v = BaseTableViewCell<Self>()
        v.addMainView(self)
        return v
    }
    
    static var tableViewCell: BaseTableViewCell<Self>.Type {
        return BaseTableViewCell<Self>.self
    }
}

// Make all views embeddable
extension MSAutoView: TableViewCellEmbeddable {
    typealias View = MSAutoView
}
