if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {

} else {
    msvc2015_support_bin.src.dirs = $$PWD/bin
    msvc2015_support_bin.des = $$DESTDIR
    COPIES += msvc2015_support_bin

    REMOVEFILES += \
        $$BIN_DIR/vcredist_x86.exe \
        $$BIN_DIR/vc_redist.x86.exe
}
