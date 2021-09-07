plugins {
    kotlin("jvm") version "1.5.21"
    application
}

group = "x.y.z"
version = "1.0.0"

application {
    mainClass.set("ApplicationKt")

}
repositories {
    mavenCentral()
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.5.21")
}