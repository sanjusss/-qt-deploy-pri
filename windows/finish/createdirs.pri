# remove and create dirs to project
for(target_dir, TRAGET_DIRS) {
    dir_path = $$shell_path($$absolute_path($$eval($$target_dir)))
    system(echo rd /S /Q \"$$dir_path\" >> \"$$AFTER_BAT\")
    system(echo md \"$$dir_path\" >> \"$$AFTER_BAT\")
}
