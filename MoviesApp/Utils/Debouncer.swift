//
//  Debouncer.swift
//  MoviesApp
//
//  Created by Takasur Home on 31/05/2024.
//

import Foundation

class Debouncer {
    let delay: TimeInterval
    var timer: Timer?

    init(delay: TimeInterval) {
        self.delay = delay
    }

    func run(action: @escaping () -> Void) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            action()
        }
    }
}
