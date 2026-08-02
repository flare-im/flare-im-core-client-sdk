package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** Normalized RichDoc v2 payload aligned with core NormalizeOutput. */
data class RichDocV2Normalized(
    /** wire: `docJson`. Canonical RichDoc v2 JSON document. */
    val docJson: String = "",
    /** wire: `contentSchema`. Content schema, normally rich_doc. */
    val contentSchema: String = "",
    /** wire: `version`. RichDoc schema version. */
    val version: Int = 0,
    /** wire: `plainText`. Human-readable plain text extracted from the document. */
    val plainText: String = "",
    /** wire: `searchText`. Search-indexable text extracted from the document. */
    val searchText: String = "",
    /** wire: `renderHints`. Renderer hint object derived by core. */
    val renderHints: Map<String, Any?> = emptyMap(),
    /** wire: `inputFormat`. Original source format when known. */
    val inputFormat: String? = null,
    /** wire: `sourcePayload`. Original source payload snapshot keyed by format. */
    val sourcePayload: Map<String, Any?>? = null,
)
