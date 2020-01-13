win32 {
    QT_BUILD_PRI_PATH = windows
} else {
    error(Unsupported system.)
}

CONFIG += c++11
ABSOLUTE_ROOT = $$shell_path($$absolute_path($$_PRO_FILE_PWD_))
ABSOLUTE_PRO = $$shell_path($$absolute_path($$_PRO_FILE_))

BAT_PATH = $$_PRO_FILE_PWD_/build-bat
mkpath($$BAT_PATH)
BAT_PATH = $$shell_path($$absolute_path($$BAT_PATH))

include($$PWD/$$QT_BUILD_PRI_PATH/init/defination.pri)
include($$PWD/$$QT_BUILD_PRI_PATH/init/create_reference.pri)
