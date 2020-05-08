//
//  OnboardingPageViewController.swift
//  Yana
//
//  Created by Anderson Alencar on 30/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    // MARK: - Properties

    let contentManager = PresentationContent()
    var currentIndex = 0
    weak var onboardingPageDelegate: OnboardingPageViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let startController = getContentViewController(at: 0) {
            setViewControllers([startController], direction: .forward, animated: true, completion: nil)
        }
    }

    func getContentViewController(at index: Int) -> OnboardingContentViewController? {
        if index < 0 || index >= contentManager.titles.count {
           return nil
        }
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let onboardingContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewControllerID") as? OnboardingContentViewController {
            onboardingContentViewController.presentationData = contentManager.getContent(index: index)
            onboardingContentViewController.index = index
            return onboardingContentViewController
        } else {
            return nil
        }
    }

    func forwardPage() {
        currentIndex += 1
        if let nextController = getContentViewController(at: currentIndex) {
            setViewControllers([nextController], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // swiftlint:disable force_cast
        var index = (viewController as! OnboardingContentViewController).index
        // swiftlint:disable force_cast
        index -= 1
        return getContentViewController(at: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnboardingContentViewController).index
        index += 1
        return getContentViewController(at: index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentController = pageViewController.viewControllers?.first as? OnboardingContentViewController {
                currentIndex = contentController.index
                onboardingPageDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
}
