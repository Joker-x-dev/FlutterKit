plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.joker.flutterkit"
    // permission_handler_android 要求编译 SDK 不低于 37，高于 Flutter 默认的 36
    compileSdk = 37
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // java.time 等新 API 在低版本 Android 上依赖核心库脱糖
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.joker.flutterkit"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        // Uses the version code from pubspec.yaml. When using split APKs, 1000 * ABI_VERSION
        // is added automatically by Flutter. (https://developer.android.com/studio/build/configure-apk-splits#configure-APK-versions)
        // You can force using the value of versionCode by specifying the `-P force-version-code-ignoring-abi=true`
        // flag during build.
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // 仅包括中文必要的语言资源
        androidResources {
            localeFilters += listOf("zh")
        }
    }

    buildTypes {
        debug {
            // debug 下的签名配置
            signingConfig = signingConfigs.getByName("debug")
            // debug 模式下包名后缀
            applicationIdSuffix = ".debug"
        }

        release {
            // release 下的签名配置
            signingConfig = signingConfigs.getByName("debug")
            // 是否启用代码压缩
            isMinifyEnabled = true
            // 资源压缩
            isShrinkResources = true
            // 配置ProGuard规则文件
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    // 打包选项 - 排除不必要的文件
    packaging {
        resources {
            excludes += setOf(
                "META-INF/DEPENDENCIES",
                "META-INF/LICENSE",
                "META-INF/LICENSE.txt",
                "META-INF/license.txt",
                "META-INF/NOTICE",
                "META-INF/NOTICE.txt",
                "META-INF/notice.txt",
                "META-INF/ASL2.0",
                "META-INF/*.kotlin_module"
            )
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
