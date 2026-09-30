plugins {
    id("com.android.application")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.pehlakadam.app"
    compileSdk = 36
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.pehlakadam.app"
        minSdk = 24
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        // A stable, auto-generated debug-style key so CI always produces an
        // installable APK. Point the APK_* env vars at a real keystore to sign
        // a Play-ready build.
        create("release") {
            val store = System.getenv("APK_STORE_FILE")
            if (store != null && file(store).exists()) {
                storeFile = file(store)
                storePassword = System.getenv("APK_STORE_PASSWORD")
                keyAlias = System.getenv("APK_KEY_ALIAS")
                keyPassword = System.getenv("APK_KEY_PASSWORD")
            }
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            isShrinkResources = false
            signingConfig = if (System.getenv("APK_STORE_FILE") != null) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
        }
    }

    packaging {
        resources {
            excludes += setOf("META-INF/*.kotlin_module")
        }
    }
}

flutter {
    source = "../.."
}
