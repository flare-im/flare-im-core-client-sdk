package com.flare.im.adapter.module

import com.flare.im.adapter.codec.*
import com.flare.im.api.user.UserApi
import com.flare.im.contract.NativeBridge
import com.flare.im.contract.NativeCallMap

/**
 * User profile cache facade. Business pushes identity (name/avatar) here; reads
 * batch-join the cache to render current identity. Operation `user.upsert_profiles`
 * goes through the JSON contract invoke boundary (`flare_sdk_invoke_json`).
 */
class DefaultUserApi(
    private val bridge: NativeBridge,
) : UserApi {

    override suspend fun upsertUserProfiles(request: Map<String, Any?>): Unit {
        invokeUnit(bridge, NativeCallMap.USER_UPSERT_PROFILES, request)
    }
}
