package com.my.cctracker


import android.Manifest
import android.app.Activity
import android.content.ContentValues
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.MediaStore
import android.util.Log
import android.view.MenuItem
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.Toolbar
import androidx.appcompat.app.AppCompatActivity
import com.my.cctracker.singleton.Singleton


class PhotoActivity : AppCompatActivity() {

    private lateinit var mCurrentPhotoPath: Uri
    private val PERMISSION_CODE_READ_GALLERY = 1001
    private val PERMISSION_CODE_WRITE_GALLERY = 1002
    private val PERMISSION_CODE_WRITE_CAMERA = 1011
    private val PERMISSION_CODE_READ_CAMERA = 1012
    private val IMAGE_PICK_CODE = 1000
    private val TAKE_PHOTO_REQUEST = 1003

    lateinit var photoButton: Button
    lateinit var galleryButton: Button
    lateinit var applyButton: Button
    lateinit var imageView: ImageView

    private val clickListener = View.OnClickListener { view ->

        when (view.id) {

            R.id.button_photo -> {
                launchCamera()
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

        getSupportActionBar()!!.setHomeAsUpIndicator(R.drawable.button_back_v4)
        getSupportActionBar()!!.setDisplayHomeAsUpEnabled(true)

        Log.d("EEE", "on Create ---- OK")

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
        if(checkPermissionForImage(PERMISSION_CODE_READ_GALLERY, PERMISSION_CODE_WRITE_GALLERY)){

            val intent = Intent(Intent.ACTION_PICK)
            intent.type = "image/*"
            startActivityForResult(intent, IMAGE_PICK_CODE)
        }
    }


    private fun launchCamera() {

        if(checkPermissionForImage(PERMISSION_CODE_READ_CAMERA, PERMISSION_CODE_WRITE_CAMERA)){
            val values = ContentValues(1)
            values.put(MediaStore.Images.Media.MIME_TYPE, "image/jpg")
            val fileUri = contentResolver
                    .insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                            values)
            val intent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
            if(intent.resolveActivity(packageManager) != null) {
                mCurrentPhotoPath = fileUri!!
                intent.putExtra(MediaStore.EXTRA_OUTPUT, fileUri)
                intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
                        or Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
                startActivityForResult(intent, TAKE_PHOTO_REQUEST)
            }
        }

    }


    private fun checkPermissionForImage(p_c_r: Int, p_c_w : Int) :Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if ((checkSelfPermission(Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED)
                    && (checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED)
            ) {
                val permission = arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE)
                val permissionCoarse = arrayOf(Manifest.permission.WRITE_EXTERNAL_STORAGE)


                requestPermissions(permission, p_c_r)

                requestPermissions(permissionCoarse, p_c_w)
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
        }
        else if (resultCode == Activity.RESULT_OK && requestCode == TAKE_PHOTO_REQUEST) {
            imageView.setImageURI(mCurrentPhotoPath)
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
      //  super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        Log.d("EEE", "onRequestPermissionsResult ---- body")
        if (requestCode == PERMISSION_CODE_READ_GALLERY) {
            Log.d("EEE", "PERMISSION_CODE_READ_GALLERY ---- body")
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Log.d("EEE", "PERMISSION_CODE_READ_GALLERY PERMISSION_GRANTED ---- body")
                getPhotoFromGallery()
            }
        } else if (requestCode == PERMISSION_CODE_READ_CAMERA) {
            Log.d("EEE", "PERMISSION_CODE_WRITE_CAMERA ---- body")
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Log.d("EEE", "PERMISSION_CODE_WRITE_CAMERA PERMISSION_GRANTED ---- body")
                launchCamera()
            }
        }
    }





}