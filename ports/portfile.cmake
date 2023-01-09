vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO nikitalita/cppdap
  REF 952d6e2f991812291c8eb2b5ae0707505110dc31
  SHA512 97399187f5457c3e811c77b295340fc5cd15baeb1430b860a76583972ac6e12a610ad1c41de804e5f6b20bfa45872b7c9b439d323b81d1f75a409a8dd1b9db65
  HEAD_REF master
)
# Check if one or more features are a part of a package installation.
# See /docs/maintainers/vcpkg_check_features.md for more details
vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES
    use-nlohmann-json CPPDAP_USE_EXTERNAL_NLOHMANN_JSON_PACKAGE
    use-rapidjson CPPDAP_USE_EXTERNAL_RAPIDJSON_PACKAGE
)

if (NOT CPPDAP_USE_EXTERNAL_NLOHMANN_JSON_PACKAGE AND NOT CPPDAP_USE_EXTERNAL_RAPIDJSON_PACKAGE)
  message(FATAL_ERROR "Must set either \"use-nlohmann-json\" or \"use-rapidjson\" feature.")
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME cppdap CONFIG_PATH lib/cmake/cppdap)
file(
        INSTALL "${SOURCE_PATH}/LICENSE"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
