package com.my.cctracker

import android.content.ActivityNotFoundException
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

            when (methodCall.method){
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
                "activity_photo" -> {
                    result.success("Kotlin OK activity_photo")
                    photoActivity()
                }
                else -> {
                    result.success("Kotlin OK, not action")
                }

            }

        }
    }

    private fun startBrowseIntent(url: String){
        val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
        startActivity(browserIntent)
    }

    private fun startShareIntent(sharedText: String){
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

    private fun helpActivity(){
        val intent = Intent(this, HelpActivity::class.java)
       // intent.putExtra("key", value)
        startActivity(intent)
    }

    private fun photoActivity(){
        val intent = Intent(this, PhotoActivity::class.java)
        // intent.putExtra("key", value)
        startActivity(intent)
    }

}
