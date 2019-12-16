//
//  SkeletonView.swift
//  SkeletonView
//
//  Created by オムラユウキ on 2019/12/16.
//  Copyright © 2019 オムラユウキ. All rights reserved.
//

import UIKit

final class SkeletonView: UIView {
    
    private struct Constant {
        static let labelHeight: CGFloat = UIMarginResource.small
        static let labelCornerRadius: CGFloat = UISizeResource.standardCornerRadius
        static let imageCornerRadius: CGFloat = UISizeResource.zeroCornerRadius
        static let defaultBackgroundColor: UIColor = GeneralColorResources.loadingPulseDark
        static let highlightedBackgroundColor: UIColor = GeneralColorResources.loadingPulseLight
    }
    
    private enum SkeletonKind {
        case image
        case label
    }
    
    var shouldAnimateBlink: Bool = true
    
    private var viewParts: [(reference: UIView, skeleton: UIView, kind: SkeletonKind)] = [(UIView, UIView, SkeletonKind)]()
    
    init(parentFrame: CGRect, labels: [UIView] = [], images: [UIView] = []) {
        super.init(frame: parentFrame)
        translatesAutoresizingMaskIntoConstraints = false
        
        isUserInteractionEnabled = true
        backgroundColor = GeneralColorResources.viewControllerBackgroundLight

        setupParts(referenceParts: labels, kind: SkeletonKind.label)
        setupParts(referenceParts: images, kind: SkeletonKind.image)
        setupObservers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToSuperview() {
        guard let superview = self.superview else { return }
        setupConstraints(superview: superview)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { }
    
    func show() {
        if shouldAnimateBlink {
            blinkSkeletonParts()
        }
        alpha = 1.0
        isHidden = false
    }
    
    func hide(animated: Bool = true) {
        let hideHandler = {
            self.stopBlinkingSkeletonParts()
            self.alpha = 0.0
            self.isHidden = true
        }
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.alpha = 0.0
            }, completion: { _ in
                hideHandler()
            })
        } else {
            hideHandler()
        }
    }
    
    private func setupParts(referenceParts: [UIView], kind: SkeletonKind) {
        for referencePart in referenceParts {
            let skeletonPart = UIView(frame: referencePart.frame)
            skeletonPart.translatesAutoresizingMaskIntoConstraints = false
            skeletonPart.backgroundColor = Constant.defaultBackgroundColor
            switch kind {
            case .label:
                skeletonPart.layer.cornerRadius = Constant.labelCornerRadius
            case .image:
                skeletonPart.layer.cornerRadius = Constant.imageCornerRadius
            }
            addSubview(skeletonPart)
            viewParts.append((referencePart, skeletonPart, kind))
        }
    }
    
    private func setupObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(removeAnimation),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(resumeAnimation),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil)
    }
    
    private func setupConstraints(superview: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
        
        for viewPart in viewParts {
            let horizontalConstraints = [
                viewPart.skeleton.leadingAnchor.constraint(equalTo: viewPart.reference.leadingAnchor),
                viewPart.skeleton.trailingAnchor.constraint(equalTo: viewPart.reference.trailingAnchor)
            ]
            let verticalConstraints: [NSLayoutConstraint]
            switch viewPart.kind {
            case .label:
                verticalConstraints = [
                    viewPart.skeleton.centerYAnchor.constraint(equalTo: viewPart.reference.centerYAnchor),
                    viewPart.skeleton.heightAnchor.constraint(equalToConstant: Constant.labelHeight)
                ]
            case .image:
                verticalConstraints = [
                    viewPart.skeleton.topAnchor.constraint(equalTo: viewPart.reference.topAnchor),
                    viewPart.skeleton.bottomAnchor.constraint(equalTo: viewPart.reference.bottomAnchor)
                ]
            }
            NSLayoutConstraint.activate(horizontalConstraints + verticalConstraints)
        }
    }
    
    private func blinkSkeletonParts() {
        for viewPart in self.viewParts {
            viewPart.skeleton.backgroundColor = Constant.defaultBackgroundColor
        }
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.repeat, .autoreverse, .curveEaseInOut, .allowUserInteraction],
                       animations: {
                        for viewPart in self.viewParts {
                            viewPart.skeleton.backgroundColor = Constant.highlightedBackgroundColor
                        }
        })
    }
    
    private func stopBlinkingSkeletonParts() {
        for viewPart in self.viewParts {
            viewPart.skeleton.layer.removeAllAnimations()
        }
    }

    @objc
    private func removeAnimation() {
        stopBlinkingSkeletonParts()
    }

    @objc
    private func resumeAnimation() {
        if shouldAnimateBlink {
            blinkSkeletonParts()
        }
    }
}

