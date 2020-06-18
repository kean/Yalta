// The MIT License (MIT)
//
// Copyright (c) 2017-2020 Alexander Grebenyuk (github.com/kean).

import XCTest
import Align


class AnchorCollectionCenterTests: XCTestCase {
    let container = View()
    let view = View()

    override func setUp() {
        super.setUp()

        container.addSubview(view)
    }

    func testCore() {
        XCTAssertEqualConstraints(
            view.anchors.center.equal(container.anchors.center),
            [NSLayoutConstraint(item: view, attribute: .centerX, toItem: container, attribute: .centerX),
            NSLayoutConstraint(item: view, attribute: .centerY, toItem: container, attribute: .centerY)]
        )

        XCTAssertEqualConstraints(
            view.anchors.center.equal(container.anchors.center, offset: CGPoint(x: 10, y: 20)),
            [NSLayoutConstraint(item: view, attribute: .centerX, toItem: container, attribute: .centerX, constant: 10),
            NSLayoutConstraint(item: view, attribute: .centerY, toItem: container, attribute: .centerY, constant: 20)]
        )

        XCTAssertEqualConstraints(
            view.anchors.center.greaterThanOrEqual(container.anchors.center),
            [NSLayoutConstraint(item: view, attribute: .centerX, relation: .greaterThanOrEqual, toItem: container, attribute: .centerX),
            NSLayoutConstraint(item: view, attribute: .centerY, relation: .greaterThanOrEqual, toItem: container, attribute: .centerY)]
        )
    }

    func testAlign() {
        XCTAssertEqualConstraints(
            view.anchors.center.align(with: container),
            [NSLayoutConstraint(item: view, attribute: .centerX, toItem: container, attribute: .centerX),
             NSLayoutConstraint(item: view, attribute: .centerY, toItem: container, attribute: .centerY)]
        )
    }

    func testAlignWithSuperview() {
        XCTAssertEqualConstraints(
            view.anchors.center.align(),
            [NSLayoutConstraint(item: view, attribute: .centerX, toItem: container, attribute: .centerX),
             NSLayoutConstraint(item: view, attribute: .centerY, toItem: container, attribute: .centerY)]
        )
    }
}
