COMPILER_PLATFORM = $$dirname(QMAKESPEC)
COMPILER_PLATFORM = $$dirname(COMPILER_PLATFORM)
COMPILER_PLATFORM = $$basename(COMPILER_PLATFORM)

msvc: include($$PWD/msvc/msvc.pri)
!contains(CONFIG, "staticlib") {
    equals(COMPILER_PLATFORM, "msvc2015") | equals(COMPILER_PLATFORM, "msvc2017") | equals(COMPILER_PLATFORM, "msvc2019"): include($$PWD/msvc2015/msvc2015.pri)
    equals(COMPILER_PLATFORM, "msvc2013")|equals(COMPILER_PLATFORM, "msvc2013_opengl") : include($$PWD/msvc2013/msvc2013.pri)
}
