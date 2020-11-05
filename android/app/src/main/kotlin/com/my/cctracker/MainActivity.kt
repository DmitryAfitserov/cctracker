package com.my.cctracker

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.my.flutter/epic"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler{ methodCall, result ->
            if(methodCall.method == "Printy") {
                result.success("Kotlin OK")
            }
        }
    }
}
