// ViewController.swift

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        let controller = UIHostingController(rootView: SavingHistory())
        guard let savingView = controller.view else { return }

        view.addSubview(savingView)
        savingView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(500)
        }
    }
}
