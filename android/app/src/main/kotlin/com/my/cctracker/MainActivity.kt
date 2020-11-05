package com.my.cctracker

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.my.flutter/epic"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler{ methodCall, result ->
            if(methodCall.method == "aboutApp") {
                val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse("https://coinmarketcap.com/"))
                startActivity(browserIntent)
                result.success("Kotlin OK aboutApp")
            } else if(methodCall.method == "help"){
                result.success("Kotlin OK help")
            } else {
                result.error("1", "error mes", 0)
            }

        }
    }
}
