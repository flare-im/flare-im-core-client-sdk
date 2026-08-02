cmake_minimum_required(VERSION 3.16)

project(flare_core_harmony_arkts_sdk LANGUAGES CXX)

set(FLARE_CLIENT_SDK_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../../../..")
set(FLARE_CORE_FFI_HEADER_DIR "${FLARE_CLIENT_SDK_ROOT}/native/abi")
set(FLARE_CORE_FFI_LIBRARY "${CMAKE_CURRENT_LIST_DIR}/../libs/${OHOS_ARCH}/libflare_im_core_sdk_ffi.so")

add_library(flare_im_core_sdk_ffi SHARED IMPORTED)
set_target_properties(
    flare_im_core_sdk_ffi
    PROPERTIES IMPORTED_LOCATION "${FLARE_CORE_FFI_LIBRARY}"
)

add_library(flare_core_harmony_arkts_sdk SHARED napi_bridge.cpp)

target_include_directories(
    flare_core_harmony_arkts_sdk
    PRIVATE "${FLARE_CORE_FFI_HEADER_DIR}"
)

target_link_libraries(
    flare_core_harmony_arkts_sdk
    PRIVATE
        libace_napi.z.so
        libhilog_ndk.z.so
        flare_im_core_sdk_ffi
)
