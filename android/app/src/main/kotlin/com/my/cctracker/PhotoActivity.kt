package com.my.cctracker

import android.app.Activity
import android.os.Bundle
import android.view.View
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class PhotoActivity : AppCompatActivity() {

    lateinit var photoButton: Button
    lateinit var galleryButton: Button
    lateinit var applyButton: Button

    private val clickListener = View.OnClickListener { view ->

        when (view.id) {

            R.id.button_photo -> {
                print("click button_photo")

            }
            R.id.button_gallery -> {
                print("click button_gallery")
            }
            R.id.button_apply -> {
                print("click button_apply")
            }

        }


    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_photo)
        photoButton = findViewById(R.id.button_photo)
        galleryButton = findViewById(R.id.button_gallery)
        applyButton = findViewById(R.id.button_apply)
        photoButton.setOnClickListener(clickListener)
        galleryButton.setOnClickListener(clickListener)
        applyButton.setOnClickListener(clickListener)


    }



}