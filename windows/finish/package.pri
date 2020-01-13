# package programme
if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {

} else {
    !contains(CONFIG, "staticlib") {
        COPY_RUNTIME = true
    }

    REMOVEFILES += \
        $$BIN_DIR/*.lib \
        $$BIN_DIR/*.a \
        $$BIN_DIR/*.pdb \
        $$BIN_DIR/*.ilk \
        $$BIN_DIR/*.exp
}

package_bin.src.dirs = $$DESTDIR
package_bin.des = $$BIN_DIR
COPIES += package_bin

equals(TEMPLATE, "lib") {
    package_lib.src.files = \
        $$DESTDIR/*.lib \
        $$DESTDIR/*.a

    package_lib.des = $$LIB_DIR
    COPIES += package_lib
}

# copy qt runtime
equals(COPY_RUNTIME, "true") {
    dest_dir = $$shell_path($$absolute_path($$DESTDIR))
    dest_target = $$dest_dir\\$$TARGET
    package_qml = --qmldir \"%QTDIR%\\qml\"
    defined(PACKAGE_QML, var) {
        PACKAGE_PARAMS = $$PACKAGE_PARAMS $$package_qml
    }

    equals(TEMPLATE, "lib") {
        system(echo "%QTDIR%\\bin\\windeployqt" \"$${dest_target}.dll\" $$PACKAGE_PARAMS >> \"$$AFTER_BAT\")
    }
    equals(TEMPLATE, "app") {
        system(echo "%QTDIR%\\bin\\windeployqt" \"$${dest_target}.exe\" $$PACKAGE_PARAMS >> \"$$AFTER_BAT\")
    }

    contains(QT, "location") {
        location_qml_target = $$dest_dir\\QtLocation
        location_qml_source_dir = %QTDIR%\\qml\\QtLocation
        system(echo md \"$$location_qml_target\" >> \"$$AFTER_BAT\")
        system(echo copy /Y \"$$location_qml_source_dir\\plugins.qmltypes\" \"$$location_qml_target\" >> \"$$AFTER_BAT\")
        system(echo copy /Y \"$$location_qml_source_dir\\qmldir\" \"$$location_qml_target\" >> \"$$AFTER_BAT\")

        postioning_qml_target = $$dest_dir\\QtPositioning
        postioning_qml_source_dir = %QTDIR%\\qml\\QtPositioning
        system(echo md \"$$postioning_qml_target\" >> \"$$AFTER_BAT\")
        system(echo copy /Y \"$$postioning_qml_source_dir\\plugins.qmltypes\" \"$$postioning_qml_target\" >> \"$$AFTER_BAT\")
        system(echo copy /Y \"$$postioning_qml_source_dir\\qmldir\" \"$$postioning_qml_target\" >> \"$$AFTER_BAT\")

        if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
            location_source = %QTDIR%\\bin\\Qt5Locationd.dll
            location_target = $$shell_path($$absolute_path($$dest_dir\\Qt5Locationd.dll))
            position_source = %QTDIR%\\bin\\Qt5PositioningQuickd.dll
            position_target = $$shell_path($$absolute_path($$dest_dir\\Qt5PositioningQuickd.dll))
            system(echo copy /Y \"$$location_qml_source_dir\\declarative_locationd.dll\" \"$$location_qml_target\" >> \"$$AFTER_BAT\")
            system(echo copy /Y \"$$postioning_qml_source_dir\\declarative_positioningd.dll\" \"$$postioning_qml_target\" >> \"$$AFTER_BAT\")
        } else {
            location_source = %QTDIR%\\bin\\Qt5Location.dll
            location_target = $$shell_path($$absolute_path($$dest_dir\\Qt5Location.dll))
            position_source = %QTDIR%\\bin\\Qt5PositioningQuick.dll
            position_target = $$shell_path($$absolute_path($$dest_dir\\Qt5PositioningQuick.dll))
            system(echo copy /Y \"$$location_qml_source_dir\\declarative_location.dll\" \"$$location_qml_target\" >> \"$$AFTER_BAT\")
            system(echo copy /Y \"$$postioning_qml_source_dir\\declarative_positioning.dll\" \"$$postioning_qml_target\" >> \"$$AFTER_BAT\")
        }

        system(echo md \"$$dest_dir\" >> \"$$AFTER_BAT\")
        system(echo copy /Y \"$$location_source\" \"$$location_target\" >> \"$$AFTER_BAT\")
        system(echo copy /Y \"$$position_source\" \"$$position_target\" >> \"$$AFTER_BAT\")
        system(echo "%QTDIR%\\bin\\windeployqt" \"$$location_target\" -geoservices $$package_qml >> \"$$AFTER_BAT\")
    }
}
