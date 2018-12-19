package com.yy.plugin

import com.android.build.gradle.AppExtension
import com.android.build.gradle.AppPlugin
import com.android.build.gradle.LibraryPlugin
import com.yy.plugin.extension.CheckMethodUsedExtension
import com.yy.plugin.transform.NoUsedMethodTransform
import com.yy.plugin.utils.Logger
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.Task

public class UselessPlugin implements Plugin<Project> {

    @Override
    void apply(Project project) {
        Logger.make(project)
        Logger.i("UselessPlugin apply project = ${project.getName()}")
        def hasApp = project.plugins.withType(AppPlugin)
        def hasLib = project.plugins.withType(LibraryPlugin)
        if (!hasApp && !hasLib) {
            throw new IllegalStateException("'android' or 'android-library' plugin required.")
        }

        project.extensions.create('uselessPluginExtension', com.yy.plugin.extension.UselessPluginExension)
        project.extensions.create('checkMethodUsedExtension', CheckMethodUsedExtension)

        AssembleTask assembleTask = getTaskInfo(project.gradle.startParameter.taskNames, project);
        //仅debug下进行代码注入
        if (assembleTask.isDebug || assembleTask.isSamllBuild) {
            def android = project.extensions.findByType(AppExtension)
            //根据开关来判断是否检查无用类
            boolean checkNotUsedMethod = Boolean.parseBoolean(project.properties.get("checkMethodNotUsed"))
            Logger.i("checkNotUsedMethod = " + checkNotUsedMethod)
            if (checkNotUsedMethod) {
                android.registerTransform(new NoUsedMethodTransform(project, project.checkMethodUsedExtension))
            }
            android.registerTransform(new com.yy.plugin.transform.UselessTransform(project, project.uselessPluginExtension))
        }
    }

    private AssembleTask getTaskInfo(List<String> taskNames, Project project) {
        AssembleTask assembleTask = new AssembleTask();
        for (String task : taskNames) {
            if (task.toUpperCase().contains("ASSEMBLE")
                    || task.contains("aR")
                    || task.toUpperCase().contains("RESGUARD")) {
                if (task.toUpperCase().contains("DEBUG")) {
                    assembleTask.isDebug = true;
                }
                assembleTask.isAssemble = true;
                break;
            }
        }
        for (Task task : project.tasks) {
            if ("preBuild" == task.name || ('prepareReleaseDependencies' == task.name)) {
                Logger.i("UselessPlugin get preBuild")
                assembleTask.isSamllBuild = true
                break
            }
        }
        return assembleTask
    }

    private class AssembleTask {
        boolean isAssemble = false;
        boolean isDebug = false;
        boolean isSamllBuild = false;
    }
}