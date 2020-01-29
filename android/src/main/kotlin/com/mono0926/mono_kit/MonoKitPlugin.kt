package com.mono0926.mono_kit

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import android.content.pm.PackageManager
import android.app.Activity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

public class MonoKitPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

  private lateinit var activity: Activity

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mono_kit")
    channel.setMethodCallHandler(MonoKitPlugin());
  }

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "mono_kit")
      val plugin = MonoKitPlugin()
      plugin.activity = registrar.activity()
      channel.setMethodCallHandler(plugin)
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    val method = call.method
    val info = method.split('/');
    val group = info[0]
    val path = info[1]
    val arguments = call.arguments as Map<String, String>
    when (group) {
      "installation_checker" -> when (path) {
        "is_installed" -> {
          val packageName = arguments.getValue("package_name")
          val isInstalled = isInstalled(packageName, activity.packageManager);
          result.success(isInstalled)
        }
        else -> result.notImplemented()
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {}

  override fun onDetachedFromActivity() {}
  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}
  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }
  override fun onDetachedFromActivityForConfigChanges() {}
}

private fun isInstalled(packageName: String, packageManager: PackageManager): Boolean {
  return try {
    packageManager.getPackageInfo(packageName, 0)
    true
  } catch (e: PackageManager.NameNotFoundException) {
    false
  }
}