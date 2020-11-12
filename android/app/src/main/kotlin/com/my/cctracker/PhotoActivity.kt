package com.my.cctracker


import android.Manifest
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.view.MenuItem
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.Toolbar
import androidx.appcompat.app.AppCompatActivity
import com.my.cctracker.singleton.Singleton


class PhotoActivity : AppCompatActivity() {

    private val PERMISSION_CODE_READ = 1001
    private val PERMISSION_CODE_WRITE = 1002
    private val IMAGE_PICK_CODE = 1000


    lateinit var photoButton: Button
    lateinit var galleryButton: Button
    lateinit var applyButton: Button
    lateinit var imageView: ImageView

    private val clickListener = View.OnClickListener { view ->

        when (view.id) {

            R.id.button_photo -> {

                photoButton.setText("photoButton")

            }
            R.id.button_gallery -> {

                getPhotoFromGallery()
            }
            R.id.button_apply -> {

                Singleton.mch?.success("back_without_save")
                finish()
            }

        }


    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_photo)
        photoButton = findViewById(R.id.button_photo)
        galleryButton = findViewById(R.id.button_gallery)
        applyButton = findViewById(R.id.button_apply)

        imageView = findViewById(R.id.image_view_photo)

        photoButton.setOnClickListener(clickListener)
        galleryButton.setOnClickListener(clickListener)
        applyButton.setOnClickListener(clickListener)

        var toolbar = findViewById<Toolbar>(R.id.toolbar)
        setActionBar(toolbar)

        getSupportActionBar()!!.setHomeAsUpIndicator(R.drawable.button_back_v1);
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
                Singleton.mch?.success("back_without_save")
                finish()
            }


        }

        return super.onOptionsItemSelected(item)
    }

    private fun getPhotoFromGallery(){
    if(checkPermissionForImage()){

        val intent = Intent(Intent.ACTION_PICK)
        intent.type = "image/*"
        startActivityForResult(intent, IMAGE_PICK_CODE)

    }


    }

    private fun checkPermissionForImage() :Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if ((checkSelfPermission(Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED)
                    && (checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED)
            ) {
                val permission = arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE)
                val permissionCoarse = arrayOf(Manifest.permission.WRITE_EXTERNAL_STORAGE)


                requestPermissions(permission, PERMISSION_CODE_READ) // GIVE AN INTEGER VALUE FOR PERMISSION_CODE_READ LIKE 1001

                requestPermissions(permissionCoarse, PERMISSION_CODE_WRITE) // GIVE AN INTEGER VALUE FOR PERMISSION_CODE_WRITE LIKE 1002
                return false
            } else {
                return true
            }
        } else {
            return true
        }

    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK && requestCode == IMAGE_PICK_CODE) {

            imageView.setImageURI(data?.data)
        } else if(resultCode == Activity.RESULT_OK && requestCode == PERMISSION_CODE_READ){
            getPhotoFromGallery()
        }
    }


}