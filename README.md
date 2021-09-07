# Gradle-18212
Reproduce Gradle 7.x + ARM64 platform issue with GitHub Actions and Docker images. CI tries to build simple `Hello World` application using Gradle with Kotlin DSL and launch it. 

#### Description

* Standard build on AMD64: https://github.com/dzikoysk/gradle-18212/blob/main/.github/workflows/docker-amd64.yml
* Standard run of Java process on ARM64: https://github.com/dzikoysk/gradle-18212/blob/main/.github/workflows/docker-arm64-without-gradle.yml
* Attemp to launch Gradle on ARM64 (fails): https://github.com/dzikoysk/gradle-18212/blob/main/.github/workflows/docker-arm64.yml

![image](https://user-images.githubusercontent.com/4235722/132345007-61203422-b6f2-4e52-9409-337b84a88c90.png)

Gradle is never able to spawn process in ARM64 env and always fails with:

```bash
 #8 21.16 Caused by: net.rubygrapefruit.platform.NativeException: Could not start '/usr/java/openjdk-16/bin/java'
#8 21.16 	at net.rubygrapefruit.platform.internal.DefaultProcessLauncher.start(DefaultProcessLauncher.java:27)
#8 21.17 	at net.rubygrapefruit.platform.internal.WrapperProcessLauncher.start(WrapperProcessLauncher.java:36)
#8 21.17 	at org.gradle.process.internal.ExecHandleRunner.startProcess(ExecHandleRunner.java:98)
#8 21.17 	at org.gradle.process.internal.ExecHandleRunner.run(ExecHandleRunner.java:71)
#8 21.17 	... 7 more
#8 21.18 Caused by: java.io.IOException: Cannot run program "/usr/java/openjdk-16/bin/java" (in directory "/root/.gradle/daemon/7.1"): error=0, Failed to exec spawn helper: pid: 72, exit value: 1
#8 21.18 	at java.base/java.lang.ProcessBuilder.start(ProcessBuilder.java:1142)
#8 21.18 	at java.base/java.lang.ProcessBuilder.start(ProcessBuilder.java:1073)
#8 21.18 	at net.rubygrapefruit.platform.internal.DefaultProcessLauncher.start(DefaultProcessLauncher.java:25)
#8 21.18 	... 10 more
#8 21.18 Caused by: java.io.IOException: error=0, Failed to exec spawn helper: pid: 72, exit value: 1
#8 21.18 	at java.base/java.lang.ProcessImpl.forkAndExec(Native Method)
#8 21.18 	at java.base/java.lang.ProcessImpl.<init>(ProcessImpl.java:313)
#8 21.18 	at java.base/java.lang.ProcessImpl.start(ProcessImpl.java:244)
#8 21.18 	at java.base/java.lang.ProcessBuilder.start(ProcessBuilder.java:1109)
#8 21.18 	... 12 more
#8 21.18 
#8 21.18 
#8 21.18 * Get more help at https://help.gradle.org
```

Full log:

* https://github.com/dzikoysk/gradle-18212/runs/3533671856
