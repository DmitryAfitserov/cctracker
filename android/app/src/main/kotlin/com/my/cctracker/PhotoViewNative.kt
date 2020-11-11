package com.my.cctracker

import android.app.Activity
import android.content.Context
import android.graphics.Color
import android.os.Build
import android.view.LayoutInflater
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.LinearLayout
import android.widget.RelativeLayout
import android.widget.TextView
import androidx.annotation.RequiresApi
import androidx.constraintlayout.widget.ConstraintLayout
import io.flutter.plugin.platform.PlatformView

internal class PhotoViewNative (private val context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {


    private var coordinatorLayout : (ConstraintLayout)? = null
    private var linearLayout : (LinearLayout)? = null
    private var textView : (TextView)? = null
    private var rootView : (View)? = null
    private var photoButton: Button? = null
    private var galleryButton: Button? = null
    private var applyButton: Button? = null

    private val clickListener = View.OnClickListener { view ->

        when (view.id) {

            R.id.button_photo -> {
                print("click button_photo")
                photoButton?.setText("photo 2")
            }
            R.id.button_gallery -> {
                print("click button_gallery")
            }
            R.id.button_apply -> {
                print("click button_apply")
            }
            R.id.id -> {
                print("click text view")
                textView?.setText("da blay")
            }

        }


    }


    override fun getView(): View {
        print("call getView coordinatorLayout - --- ---- ---")

        val inflater: LayoutInflater = LayoutInflater.from(context)
        var myView = View(context)
        var layout = RelativeLayout(context)


        rootView =  inflater.inflate(R.layout.activity_photo , null)



        layout?.addView(rootView)

        photoButton = rootView?.findViewById(R.id.button_photo)
        galleryButton = rootView?.findViewById(R.id.button_gallery)
        applyButton = rootView?.findViewById(R.id.button_apply)

        photoButton?.setOnClickListener(clickListener)
        galleryButton?.setOnClickListener(clickListener)
        applyButton?.setOnClickListener(clickListener)
        photoButton?.setText("photo 1")
//        linearLayout?.addView(rootView)
//        coordinatorLayout?.setOnTouchListener(object  :  View.OnTouchListener {
//
//            override fun onTouch(v: View?, event: MotionEvent?): Boolean {
//                return true
//            }
//        })


        return layout!!
    }

    override fun dispose() {}

    init {
        linearLayout = LinearLayout(context)
        linearLayout?.setBackgroundColor(Color.rgb(255, 255, 255))

        textView = TextView(context)
        textView?.id = R.id.id
        textView?.textSize = 72f
        textView?.setBackgroundColor(Color.rgb(255, 255, 255))
        textView?.text = "Rendered on a native Android view (id: $id)"
        textView?.setOnClickListener(clickListener)
       // create()
    }

    private fun create(){

       // coordinatorLayout = (context as Activity).findViewById(R.id.coordinator_layout)
        print("call create coordinatorLayout - --- ---- ---")
    }


}
