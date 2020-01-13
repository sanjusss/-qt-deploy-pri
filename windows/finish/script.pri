# creat script
if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
    AFTER_BAT = $$BAT_PATH\\debug-after.bat
} else {
    AFTER_BAT = $$BAT_PATH\\release-after.bat
}
system(echo rem do after build > \"$$AFTER_BAT\")

# set the start time of "after" script
!count(QMAKE_POST_LINK, 0) : warning(The command will be ignore : $$QMAKE_POST_LINK)
QMAKE_POST_LINK = call \"$$AFTER_BAT\"
