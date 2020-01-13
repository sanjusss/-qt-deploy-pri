create_lib_reference_exe = $$shell_path($$absolute_path($$PWD/../../tools/create-lib-reference.exe))
if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
    BIN_TYPE = debug
} else {
    BIN_TYPE = release
}

equals(TEMPLATE, "lib") {
    lib_path = $$shell_path($$absolute_path($$LIB_DIR/$${TARGET}.lib))
    include_path = $$shell_path($$absolute_path($$INCLUDE_DIR))
    contains(CONFIG, "staticlib") {
        system(call \"$$create_lib_reference_exe\" \"$$BIN_TYPE\" \"$$lib_path\" \"$$include_path\" \"$$ABSOLUTE_PRO\")
    } else {
        dll_path = $$shell_path($$absolute_path($$BIN_DIR/$${TARGET}.dll))
        system(call \"$$create_lib_reference_exe\" \"$$BIN_TYPE\" \"$$lib_path\" \"$$dll_path\" \"$$include_path\" \"$$ABSOLUTE_PRO\")
    }
}
equals(TEMPLATE, "app") {
    exe_path = $$shell_path($$absolute_path($$BIN_DIR/$${TARGET}.exe))
    system(call \"$$create_lib_reference_exe\" \"$$BIN_TYPE\" \"$$exe_path\" \"$$ABSOLUTE_PRO\")
}
