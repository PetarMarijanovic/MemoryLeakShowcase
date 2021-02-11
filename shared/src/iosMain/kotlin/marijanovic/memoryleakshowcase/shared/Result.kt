package marijanovic.memoryleakshowcase.shared

import kotlin.native.concurrent.freeze

actual class Result(val result: Int) {
    init {
        freeze()
    }
}
