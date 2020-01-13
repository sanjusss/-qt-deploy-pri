include($$PWD/script.pri)
include($$PWD/createdirs.pri)
include($$PWD/package.pri)
include($$PWD/copy.pri)
include($$PWD/remove.pri)

system(echo rem finish >> \"$$AFTER_BAT\")
system(echo exit /b 0 >> \"$$AFTER_BAT\")
