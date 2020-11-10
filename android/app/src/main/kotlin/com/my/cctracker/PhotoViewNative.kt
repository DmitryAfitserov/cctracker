package com.my.cctracker

import android.app.Activity
import android.content.Context
import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import androidx.constraintlayout.widget.ConstraintLayout
import io.flutter.plugin.platform.PlatformView

internal class PhotoViewNative (private val context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {


    private var coordinatorLayout : (ConstraintLayout)? = null
    private var layouut : LinearLayout? = null

    override fun getView(): View {
        print("call getView coordinatorLayout - --- ---- ---")
     //   coordinatorLayout = (context as Activity).findViewById(R.id.coordinator_layout)
      //  layouut = LinearLayout(context)
      //  layouut!!.layoutParams = LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
      //          LinearLayout.LayoutParams.MATCH_PARENT)

      //  layouut!!.orientation = LinearLayout.HORIZONTAL
      //  layouut!!.setBackgroundColor(Color.rgb(255, 255, 255))
      //  layouut!! =
        val inflater: LayoutInflater = LayoutInflater.from(context)
        coordinatorLayout =  inflater.inflate(R.layout.activity_photo, null, false) as (ConstraintLayout)
        print("call getView - --- ---- ---")
        return coordinatorLayout!!
    }

    override fun dispose() {}

    init {
//        textView = TextView(context)
//        textView.textSize = 72f
//        textView.setBackgroundColor(Color.rgb(255, 255, 255))
//        textView.text = "Rendered on a native Android view (id: $id)"
        create()
    }

    private fun create(){

       // coordinatorLayout = (context as Activity).findViewById(R.id.coordinator_layout)
        print("call create coordinatorLayout - --- ---- ---")
    }


}
