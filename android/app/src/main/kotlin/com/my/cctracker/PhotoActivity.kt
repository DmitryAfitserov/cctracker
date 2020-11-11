package com.my.cctracker

import android.app.Activity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.widget.Button
import android.widget.Toolbar
import androidx.appcompat.app.AppCompatActivity

class PhotoActivity : AppCompatActivity() {

    lateinit var photoButton: Button
    lateinit var galleryButton: Button
    lateinit var applyButton: Button

    private val clickListener = View.OnClickListener { view ->

        when (view.id) {

            R.id.button_photo -> {
                print("click button_photo")
                photoButton.setText("photoButton")

            }
            R.id.button_gallery -> {
                print("click button_gallery")
                galleryButton.setText("galleryButton")
            }
            R.id.button_apply -> {
                print("click button_apply")
                applyButton.setText("applyButton")
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

        var toolbar = findViewById<Toolbar>(R.id.toolbar)
        setActionBar(toolbar)

        getSupportActionBar()!!.setHomeAsUpIndicator(R.mipmap.ic_launcher);// set drawable icon
        getSupportActionBar()!!.setDisplayHomeAsUpEnabled(true);

    }

//    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
//        menuInflater.inflate(R.menu.menu_photo, menu);
//        return true
//
//    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when(item.itemId){
            android.R.id.home -> {
                finish()
            }


        }

        return super.onOptionsItemSelected(item)
    }
}