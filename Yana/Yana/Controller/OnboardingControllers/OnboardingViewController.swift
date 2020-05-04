//
//  OnboardingViewController.swift
//  Yana
//
//  Created by Anderson Alencar on 30/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!

    var onboardingPageViewController: OnboardingPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        configButtons()
        view.backgroundColor = .defaultBkg
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if let index = onboardingPageViewController?.currentIndex {
            switch index {
            case 0...1:
                onboardingPageViewController?.forwardPage()
            default:
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                if let loginViewController = storyboard.instantiateInitialViewController() {
                    present(loginViewController, animated: true, completion: nil)
                } else {
                    print("Erro ao acessar o fluxo de login")
                }
            }
        }
        updateUI()
    }

    @IBAction func skipButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        if let loginViewController = storyboard.instantiateInitialViewController() {
            present(loginViewController, animated: true, completion: nil)
        } else {
            print("Erro ao acessar o fluxo de login")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? OnboardingPageViewController {
            onboardingPageViewController = pageViewController
            onboardingPageViewController?.onboardingPageDelegate = self
        }
    }

    func updateUI() {
        if let index = onboardingPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("Next", for: .normal)
                skipButton.isHidden = false
            case 2:
                nextButton.setTitle("Get Started", for: .normal)
                skipButton.isHidden = true
            default: break
            }
            pageControl.currentPage = index
        }
    }

    func configButtons() {
        nextButton.layer.cornerRadius = 5
        nextButton.backgroundColor = .primaryColor

        skipButton.setTitleColor(.primaryColor, for: .normal)
    }
}

extension OnboardingViewController: OnboardingPageViewControllerDelegate {
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
}
