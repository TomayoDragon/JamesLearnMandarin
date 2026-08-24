@rem Gradle startup script for Windows
@if "%DEBUG%"=="" @echo off
set DIR=%~dp0
set CLASSPATH=%DIR%gradle\wrapper\gradle-wrapper.jar
"%JAVA_HOME%\bin\java.exe" -Xmx64m -Xms64m -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*
