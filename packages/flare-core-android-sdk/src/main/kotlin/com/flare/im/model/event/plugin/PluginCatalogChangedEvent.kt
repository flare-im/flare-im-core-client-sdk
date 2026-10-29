package com.flare.im.model.event.plugin

/** GENERATED. Do not edit by hand. */
/** The tenant's plugin catalog changed; the SDK has already invalidated its plugin catalog. */
data class PluginCatalogChangedEvent(
    /** wire: `version`. Plugin authorization projection version Core announced. */
    val version: String = "",
)
