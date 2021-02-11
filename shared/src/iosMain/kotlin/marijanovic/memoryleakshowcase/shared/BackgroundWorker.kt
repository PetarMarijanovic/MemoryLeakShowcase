package marijanovic.memoryleakshowcase.shared

import kotlin.native.concurrent.TransferMode
import kotlin.native.concurrent.Worker
import kotlin.native.concurrent.freeze

class BackgroundWorker {

    private val worker = Worker.start(errorReporting = false)

    init {
        freeze()
    }

    fun execute(block: () -> Unit) {
        worker.execute(TransferMode.SAFE, block::freeze) { it() }
    }

    fun destroy() {
        worker.requestTermination(processScheduledJobs = false)
    }
}
