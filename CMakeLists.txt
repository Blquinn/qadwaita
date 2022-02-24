cmake_minimum_required(VERSION 3.14)

project(qdwaita-test VERSION 0.1 LANGUAGES CXX)

set(CMAKE_PREFIX_PATH "D:/SDK/Qt/6.0.1/msvc2019_64/lib/cmake/")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core Quick Core5Compat REQUIRED)

set(PROJECT_SOURCES
        main.cpp
        qml.qrc
)

message("QT Version ${QT_VERSION_MAJOR}")

qt_add_executable(qdwaita-test
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
)

target_compile_definitions(qdwaita-test
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(qdwaita-test
  PRIVATE
  Qt6::Core
  Qt6::Quick
  Qt6::Core5Compat
)

set_target_properties(qdwaita-test PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

qt_import_qml_plugins(qdwaita-test)
qt_finalize_executable(qdwaita-test)
