vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO nikitalita/cppdap
  REF 405334879169f14f7b4b4a97638030fc832b5344
  SHA512 163280e5f50017423dd7abc46d9bf4b490b2d756b6421f3771b8896bc3ed0b5ac09bb113d0b28bdd5366ea2faa884fb581891fe3e8a210e40af302d61b65f81a
  HEAD_REF master
)
# Check if one or more features are a part of a package installation.
# See /docs/maintainers/vcpkg_check_features.md for more details
vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES
    use-nlohmann-json CPPDAP_USE_EXTERNAL_NLOHMANN_JSON_PACKAGE
    use-rapidjson CPPDAP_USE_EXTERNAL_RAPIDJSON_PACKAGE
)
message(STATUS "FEATURE OPTIONS = ${FEATURE_OPTIONS}")
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
