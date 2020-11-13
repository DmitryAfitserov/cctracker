package com.my.cctracker

import android.content.ActivityNotFoundException
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import com.my.cctracker.singleton.Singleton
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {

    private val CHANNEL_SETTINGS = "com.my.flutter/settings"
    private val CHANNEL_PHOTO = "com.my.flutter/photo"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_SETTINGS).setMethodCallHandler { methodCall, result ->

            when (methodCall.method) {
                "aboutApp" -> {
                    startBrowseIntent("https://coinmarketcap.com/")
                    result.success("Kotlin OK aboutApp")
                }
                "help" -> {
                    helpActivity()
                    result.success("Kotlin OK help")
                }
                "feedback" -> {
                    result.success("Kotlin OK feedback")
                }
                "shareApp" -> {
                    startShareIntent("https://play.google.com/store/apps/details?id=com.nasa.nasasratsnew&hl=ru&gl=US")
                    result.success("Kotlin OK shareApp")
                }
                "termsOfUse" -> {
                    result.success("Kotlin OK termsOfUse")
                }
                "privacyPolicy" -> {
                    startBrowseIntent("https://adncompany.github.io/nasastarsnews.html")
                    result.success("Kotlin OK privacyPolicy")
                }
                "rateApp" -> {
                    rateApp()
                    result.success("Kotlin OK rateApp")
                }

                else -> {
                    result.success("Kotlin OK, not action")
                }

            }

        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_PHOTO).setMethodCallHandler { methodCall, result ->
            Singleton.mch = result
            photoActivity()
        }



//        print("call configureFlutterEngine - OK")
//        flutterEngine
//                .platformViewsController
//                .registry
//                .registerViewFactory("<platform-view-type>", PhotoViewFactory())
    }




//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//      //  GeneratedPluginRegistrant.registerWith(this)
//
//    }

    private fun startBrowseIntent(url: String) {
        val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
        startActivity(browserIntent)
    }

    private fun startShareIntent(sharedText: String) {
        val sendIntent: Intent = Intent().apply {
            action = Intent.ACTION_SEND
            putExtra(Intent.EXTRA_TEXT, sharedText)
            type = "text/plain"
        }

        val shareIntent = Intent.createChooser(sendIntent, null)
        startActivity(shareIntent)
    }

    private fun rateApp() {
        val uri = Uri.parse("market://details?id=com.nasa.nasasratsnew")
        val myAppLinkToMarket = Intent(Intent.ACTION_VIEW, uri)
        startActivity(myAppLinkToMarket)

    }

    private fun helpActivity() {
        val intent = Intent(this, HelpActivity::class.java)

        // intent.putExtra("key", value)
        startActivity(intent)
    }

    private fun photoActivity() {
        val intent = Intent(this, PhotoActivity::class.java)
        // intent.putExtra("key", value)
        startActivity(intent)
    }

}
