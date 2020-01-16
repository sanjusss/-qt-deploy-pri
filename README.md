# qt-deploy-pri是什么？
qt-deploy-pri是一组用于Qt/QMake工程的包含文件（pri文件）。

# qt-deploy-pri能做什么？
qt-deploy-pri在被Qt/QMake工程（动态库、静态库或应用程序）包含后，可以方便的生成引用包含文件，并在构建成功后自动复制相关依赖文件。保证了release模式下的生成文件夹可以直接复制到  
qt-deploy-pri还提供一套在构建后复制、删除文件的框架，方便程序员添加自定义文件到程序生成目录。

# qt-deploy-pri支持哪些平台和对应程序版本？
### qt-deploy-pri支持以下操作系统：
- Windows xp（Qt5.5及以上版本需要重新编译Qt库）
- Windows 7及以上版本

### qt-deploy-pri支持以下Qt版本：
- Qt5.4至Qt5.14（已测试）
- Qt5.0至5.3（未测试，不保证能正常构建）

### qt-deploy-pri支持以下编译器：
- msvc2013
- msvc2015
- msvc2017
- msvc2017
- mingw

# 如何使用qt-deploy-pri？
### 静态库/动态库/应用程序自动打包
待补充

### 引用其他使用qt-deploy-pri的静态库/动态库/应用程序
待补充

### 复制文件/文件夹到生成目录
待补充

### 删除生成目录下的指定文件夹
待补充

# 未来的开发计划
待补充

# 如何为qt-deploy-pri添加代码？
尽管pr。