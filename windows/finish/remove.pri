# remove files
for(remove_obj, REMOVEFILES) {
    remove = $$shell_path($$absolute_path($$remove_obj, $$ABSOLUTE_ROOT))
    system(echo del /F /Q \"$$remove\" >> \"$$AFTER_BAT\")
}

#remove dirs
for(remove_obj, REMOVEDIRS) {
    remove = $$shell_path($$absolute_path($$remove_obj, $$ABSOLUTE_ROOT))
    system(echo rd /S /Q \"$$remove\" >> \"$$AFTER_BAT\")
}
