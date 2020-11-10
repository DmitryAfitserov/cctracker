package com.my.cctracker

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding

class PlatformViewPlugin : FlutterPlugin {
    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
//        binding
//                .platformViewRegistry
//                .registerViewFactory("<platform-view-type>", PhotoViewFactory())
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {}
}