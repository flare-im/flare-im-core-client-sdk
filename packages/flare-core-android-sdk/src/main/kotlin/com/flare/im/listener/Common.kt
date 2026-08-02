package com.flare.im.listener

/** GENERATED. Do not edit by hand. */
typealias EventCallback<T> = (T) -> Unit

/** Disposable local listener registration returned by high-level `on*` APIs. */
interface EventSubscription {
    val id: Any
    fun unsubscribe()
}
