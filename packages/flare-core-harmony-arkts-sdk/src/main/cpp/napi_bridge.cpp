#include <stdint.h>
#include <stddef.h>

#include <string>

#include "flare_im_core_sdk_ffi.h"
#include "napi/native_api.h"

namespace {

std::string copy_flare_string(FlareString value) {
    if (value.ptr == nullptr || value.len == 0) {
        return {};
    }
    return std::string(value.ptr, value.len);
}

napi_value make_string(napi_env env, const std::string &value) {
    napi_value out = nullptr;
    napi_create_string_utf8(env, value.c_str(), value.size(), &out);
    return out;
}

napi_value make_number(napi_env env, double value) {
    napi_value out = nullptr;
    napi_create_double(env, value, &out);
    return out;
}

napi_value make_bool(napi_env env, bool value) {
    napi_value out = nullptr;
    napi_get_boolean(env, value, &out);
    return out;
}

uint64_t uint64_arg(napi_env env, napi_callback_info info, size_t index) {
    size_t argc = 8;
    napi_value argv[8] = {};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (index >= argc) {
        return 0;
    }
    double value = 0;
    napi_get_value_double(env, argv[index], &value);
    return static_cast<uint64_t>(value);
}

napi_value create_rejected_promise(napi_env env, const char *message) {
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);
    napi_value error_message = make_string(env, message);
    napi_value error = nullptr;
    napi_create_error(env, nullptr, error_message, &error);
    napi_reject_deferred(env, deferred, error);
    return promise;
}

napi_value create(napi_env env, napi_callback_info /*info*/) {
    return make_number(env, static_cast<double>(flare_sdk_create()));
}

napi_value release(napi_env env, napi_callback_info info) {
    flare_sdk_release(static_cast<FlareHandle>(uint64_arg(env, info, 0)));
    napi_value out = nullptr;
    napi_get_undefined(env, &out);
    return out;
}

napi_value hard_reset(napi_env env, napi_callback_info /*info*/) {
    flare_sdk_hard_reset();
    napi_value out = nullptr;
    napi_get_undefined(env, &out);
    return out;
}

napi_value connection_state(napi_env env, napi_callback_info info) {
    return make_number(env, static_cast<double>(flare_sdk_state(static_cast<FlareHandle>(uint64_arg(env, info, 0)))));
}

napi_value is_connected(napi_env env, napi_callback_info info) {
    return make_bool(env, flare_sdk_is_connected(static_cast<FlareHandle>(uint64_arg(env, info, 0))));
}

napi_value session_active(napi_env env, napi_callback_info info) {
    return make_bool(env, flare_sdk_session_active(static_cast<FlareHandle>(uint64_arg(env, info, 0))));
}

napi_value sdk_version(napi_env env, napi_callback_info /*info*/) {
    FlareString value = flare_sdk_version();
    std::string text = copy_flare_string(value);
    flare_string_free(value);
    return make_string(env, text);
}

napi_value ffi_contract_version(napi_env env, napi_callback_info /*info*/) {
    FlareString value = flare_sdk_ffi_contract_version();
    std::string text = copy_flare_string(value);
    flare_string_free(value);
    return make_string(env, text);
}

napi_value subscribe_events(napi_env env, napi_callback_info info) {
    auto handle = static_cast<FlareHandle>(uint64_arg(env, info, 0));
    auto subscription = flare_event_subscribe(handle, nullptr, nullptr);
    return make_number(env, static_cast<double>(subscription));
}

void event_batch_callback(void * /*context*/, size_t /*event_count*/, FlareString events_json) {
    flare_string_free(events_json);
}

napi_value subscribe_events_batch(napi_env env, napi_callback_info info) {
    auto handle = static_cast<FlareHandle>(uint64_arg(env, info, 0));
    auto subscription = flare_event_subscribe_batch(handle, nullptr, event_batch_callback);
    return make_number(env, static_cast<double>(subscription));
}

napi_value unsubscribe_events(napi_env env, napi_callback_info info) {
    flare_event_unsubscribe(static_cast<FlareSubscriptionHandle>(uint64_arg(env, info, 0)));
    napi_value out = nullptr;
    napi_get_undefined(env, &out);
    return out;
}

napi_value unsubscribe_all_events(napi_env env, napi_callback_info /*info*/) {
    flare_event_unsubscribe_all();
    napi_value out = nullptr;
    napi_get_undefined(env, &out);
    return out;
}

napi_value unsupported_async(napi_env env, napi_callback_info /*info*/) {
    return create_rejected_promise(
        env,
        "HarmonyOS NAPI async C ABI callback bridge is not wired yet. Sync lifecycle symbols are linked."
    );
}

napi_value init(napi_env env, napi_value exports) {
    napi_property_descriptor descriptors[] = {
        {"create", nullptr, create, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"release", nullptr, release, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hardReset", nullptr, hard_reset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"connectionState", nullptr, connection_state, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isConnected", nullptr, is_connected, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sessionActive", nullptr, session_active, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkVersion", nullptr, sdk_version, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ffiContractVersion", nullptr, ffi_contract_version, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"messageDispatchJson", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkInvokeJson", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"messageBuildJson", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkInit", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkUninit", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkLogin", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkLogout", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkUpdateAccessToken", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkCurrentUserId", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkDisconnect", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sdkDataRoot", nullptr, unsupported_async, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"subscribeEvents", nullptr, subscribe_events, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"subscribeEventsBatch", nullptr, subscribe_events_batch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unsubscribeEvents", nullptr, unsubscribe_events, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unsubscribeAllEvents", nullptr, unsubscribe_all_events, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(descriptors) / sizeof(descriptors[0]), descriptors);
    return exports;
}

}  // namespace

static napi_module flare_core_harmony_arkts_sdk_module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = init,
    .nm_modname = "flare_core_harmony_arkts_sdk",
    .nm_priv = nullptr,
    .reserved = {nullptr},
};

extern "C" __attribute__((constructor)) void RegisterFlareCoreHarmonyArktsSdkModule() {
    napi_module_register(&flare_core_harmony_arkts_sdk_module);
}
