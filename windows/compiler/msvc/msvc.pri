SUPPORT_XP = false
#Qt5.6.3 is the last version which support xp.
contains(QMAKE_HOST.arch, x86){
#    greaterThan(QT_MAJOR_VERSION, 4) {
#        lessThan(QT_MAJOR_VERSION, 6): lessThan(QT_MINOR_VERSION, 7): SUPPORT_XP = true
#    } else {
        SUPPORT_XP = true
#    }
}

equals(SUPPORT_XP, "true"){
    include($$PWD/xp.pri)
} else {
    message("The programme cannot run on Windows XP.")
}

if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {

} else {
    QMAKE_LFLAGS += /MANIFESTUAC:\"level=\'requireAdministrator\' uiAccess=\'false\'\"
}
