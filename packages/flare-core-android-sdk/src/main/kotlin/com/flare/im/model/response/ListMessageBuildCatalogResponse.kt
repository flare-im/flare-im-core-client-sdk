package com.flare.im.model.response

import com.flare.im.model.catalog.MessageBuildCatalogEntry

/** GENERATED. Do not edit by hand. */
/** Catalog of all supported message build operations. */
data class ListMessageBuildCatalogResponse(
    /** wire: `entries`. Supported build operations. */
    val entries: List<MessageBuildCatalogEntry> = emptyList(),
)
