# copy files
for(copy_obj, COPIES) {
    copy_des_dirs =
    count($${copy_obj}.des, 0) {
        copy_des_dirs = $$ABSOLUTE_ROOT
    } else {
        copy_des_temp = $$eval($$$${copy_obj}.des)
        for (copy_des_dir, copy_des_temp) {
            copy_des_dirs += $$shell_path($$absolute_path($$copy_des_dir, $$ABSOLUTE_ROOT))
        }
    }

    for (copy_des, copy_des_dirs) {
        system(echo md \"$$copy_des\" >> \"$$AFTER_BAT\")
    }

    copy_src_files = $$eval($$$${copy_obj}.src.files)
    for(copy_src_file, copy_src_files) {
        copy_src = $$shell_path($$absolute_path($$copy_src_file, $$ABSOLUTE_ROOT))
        for (copy_des, copy_des_dirs) {
            system(echo copy /Y \"$$copy_src\" \"$$copy_des\" >> \"$$AFTER_BAT\")
        }
    }

    copy_src_dirs = $$eval($$$${copy_obj}.src.dirs)
    for(copy_src_dir, copy_src_dirs) {
        copy_src = $$shell_path($$absolute_path($$copy_src_dir, $$ABSOLUTE_ROOT))
        for (copy_des, copy_des_dirs) {
            system(echo xcopy /E /Y /Q \"$$copy_src\" \"$$copy_des\" >> \"$$AFTER_BAT\")
        }
    }
}
