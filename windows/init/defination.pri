# This file must be included before any other pri files.

# temp output path of build result
if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
    DESTDIR = $$_PRO_FILE_PWD_/build-debug-run

    # include dir
    INCLUDE_DIR = $$_PRO_FILE_PWD_/build-debug-include

    # lib file dir
    LIB_DIR = $$_PRO_FILE_PWD_/build-debug-lib

    # bin dir
    BIN_DIR = $$_PRO_FILE_PWD_/build-debug-bin
} else {
    DESTDIR = $$_PRO_FILE_PWD_/build-release-run

    # include dir
    INCLUDE_DIR = $$_PRO_FILE_PWD_/build-release-include

    # lib file dir
    LIB_DIR = $$_PRO_FILE_PWD_/build-release-lib

    # bin dir
    BIN_DIR = $$_PRO_FILE_PWD_/build-release-bin
}

# create destdir before link
mkpath($$DESTDIR)
dest_path = $$shell_path($$absolute_path($$DESTDIR))
if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
    BEFORE_BAT = $$BAT_PATH\\debug-before.bat
} else {
    BEFORE_BAT = $$BAT_PATH\\release-before.bat
}

!count(QMAKE_PRE_LINK, 0) : warning(The command will be ignore : $$QMAKE_PRE_LINK)
system(echo rem do before build > \"$$BEFORE_BAT\")
system(echo if not exist \"$$dest_path\" \(md \"$$dest_path\"\) >> \"$$BEFORE_BAT\")
system(echo rem end before build >> \"$$BEFORE_BAT\")
system(echo exit /b 0 >> \"$$BEFORE_BAT\")
QMAKE_PRE_LINK = call \"$$BEFORE_BAT\"

unset(dest_path)

# dirs will be remove and create after build, absolute dir path
TRAGET_DIRS = BIN_DIR
equals(TEMPLATE, "lib") {
    TRAGET_DIRS += INCLUDE_DIR LIB_DIR
}

# dirs copy to bin dir after build
# COPIES
#
#   example:
#
#       A.src.files = *.h *.cpp                     #relative or absolute path, files
#       A.src.dirs = testa testb                    #relative or absolute path, dirs
#       A.des = $$basename(_PRO_FILE_) path2        #relative or absolute dir paths.
#                                       #empty equals root path.
#
#       COPIES += A

COPIES =

# files to remove, after the action of copy.
# REMOVES
#
#   example:
#   REMOVES += *.pdb *.ilk #relative or absolute path, files

REMOVEFILES =
REMOVEDIRS =
