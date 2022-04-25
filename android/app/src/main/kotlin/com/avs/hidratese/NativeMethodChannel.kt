package com.avs.hidratese

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

object NativeMethodChannel {

    private const val CHANNEL_NAME = "channel"
    private lateinit var methodChannel: MethodChannel

    fun configureChannel(flutterEngine: FlutterEngine, context: Context) {
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
                .setMethodCallHandler { methodCall, result ->
                    if (methodCall.method.equals("setPermission")) {
                        Utils.setPermissions(context.applicationContext)
                        result.success("")
                    } else if (methodCall.method.equals("checkDeviceManufacturer")) {
                        val retorno = Utils.checkDeviceManufacturer()
                        result.success(retorno)
                    } else if (methodCall.method.equals("setAutoStart")) {
                        Utils.setAutoStart(context.applicationContext)
                        result.success("success")
                    } else {
                        result.notImplemented()
                    }

//                    else if (methodCall.method.equals("startingServices")) {
//                    Utils.startingServices(context.applicationContext)
//                    result.success("success")
                }
    }

    // add the following method, it passes a string to flutter
    fun showNewIdea(idea: String) {
        methodChannel.invokeMethod("showNewIdea", idea)
    }
}
