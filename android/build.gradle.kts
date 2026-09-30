allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Flutter looks for APKs under <repo-root>/build/app/outputs/..., so point the
// root build directory there. Uses `layout.buildDirectory` (not the removed
// `buildDir` property) so it works on Gradle 8.x and 9.x alike.
rootProject.layout.buildDirectory.value(
    rootProject.layout.projectDirectory.dir("../build"),
)

subprojects {
    layout.buildDirectory.value(
        rootProject.layout.buildDirectory.dir(project.name),
    )
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
