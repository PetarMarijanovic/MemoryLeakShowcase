import UIKit
import shared

public class OtherViewController: UIViewController {

    private let worker = BackgroundWorker()

    private let callback = Callback(DispatchQueue.main, { result in
        print(result)
    })

    public override func viewDidLoad() {
        let textView = UITextView()
        view.backgroundColor = .white
        view.addSubview(textView)

        textView.text = "Go back and Debug Memory Graph. All Results should be garbage collected but still remain in memory."
        textView.frame.size.width = 300
        textView.frame.size.height = 300
        textView.center = self.view.center

        for i in 0...10 {

            worker.execute { [weak self] in
                guard let self = self else { return }

                let result: Result = Result(result: Int32(i))

                self.callback.listenerExecutor.sync {
                    self.callback.listener(result)
                }
            }
        }
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        worker.destroy()
    }
}

private class Callback {

    let listenerExecutor: DispatchQueue
    let listener: (Result) -> ()

    init(_ listenerExecutor: DispatchQueue, _ listener: @escaping (Result) -> ()) {
        self.listenerExecutor = listenerExecutor
        self.listener = listener
    }
}
