// MIT License
//
// Copyright (c) 2019 Anton Yereshchenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

//MARK: AYMonthNavigationView class
public class AYMonthNavigationView: UIView, NibView {
  
  //MARK: - components
  @IBOutlet public weak var lblText: UILabel!

  @IBOutlet public weak var btnNext: UIButton!
  @IBOutlet public weak var btnPrev: UIButton!
  
  //MARK: - methods
  public override func awakeFromNib() {
    super.awakeFromNib()
    let bundle = Bundle(for: AYMonthNavigationView.self)
    
    let imgNext = UIImage(named: "next.png", in: bundle, compatibleWith: nil)
    let imgPrev = UIImage(named: "prev.png", in: bundle, compatibleWith: nil)

    btnNext.setImage(imgNext, for: .normal)
    btnPrev.setImage(imgPrev, for: .normal)
  }
  
  public override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    btnNext.layer.cornerRadius = btnNext.bounds.height / 2
    btnPrev.layer.cornerRadius = btnPrev.bounds.height / 2
  }
}
