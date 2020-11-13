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
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.textfield.TextInputEditText
import com.google.android.material.textfield.TextInputLayout
import com.my.cctracker.singleton.Singleton


class PhotoActivity : AppCompatActivity() {

    private lateinit var mCurrentPhotoPath: Uri
    private val PERMISSION_CODE_GALLERY = 1001
    private val PERMISSION_CODE_CAMERA = 1012
    private val IMAGE_PICK_CODE = 1000
    private val TAKE_PHOTO_REQUEST = 1003

    lateinit var photoButton: Button
    lateinit var galleryButton: Button
    lateinit var applyButton: Button
    lateinit var imageView: ImageView
    lateinit var textInputLayout: TextInputLayout
    lateinit var textInputEditText: TextInputEditText

    private var isPhotoInImageView = false

    private val clickListener = View.OnClickListener { view ->

        when (view.id) {

            R.id.button_photo -> {
                launchCamera()
            }
            R.id.button_gallery -> {
                getPhotoFromGallery()
            }
            R.id.button_apply -> {
                returnToFlutter()
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

        textInputLayout = findViewById(R.id.text_input_layout)
        textInputEditText = findViewById(R.id.edit_text)

        photoButton.setOnClickListener(clickListener)
        galleryButton.setOnClickListener(clickListener)
        applyButton.setOnClickListener(clickListener)

        var toolbar = findViewById<Toolbar>(R.id.toolbar)
        setActionBar(toolbar)

        getSupportActionBar()!!.setHomeAsUpIndicator(R.drawable.button_back_v4)
        getSupportActionBar()!!.setDisplayHomeAsUpEnabled(true)

        Log.d("EEE", "on Create ---- OK")

    }



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
        if(checkPermissionForImage(PERMISSION_CODE_GALLERY)){

            val intent = Intent(Intent.ACTION_PICK)
            intent.type = "image/*"
            startActivityForResult(intent, IMAGE_PICK_CODE)
        }
    }


    private fun launchCamera() {

        if(checkPermissionForImage(PERMISSION_CODE_CAMERA)){
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


    private fun returnToFlutter(){
        if(checkIsNotEmptyData()){

            // prepare data and finish

        }
    }

    private fun checkIsNotEmptyData(): Boolean{
        if(!isPhotoInImageView){
            Log.d("EEE", "if(!isPhotoInImageView)")
            // toast
            Toast.makeText(applicationContext, "You need to add a photo", Toast.LENGTH_SHORT).show()
            imageView.setBackgroundResource(R.drawable.border_for_image_error)
        }
        if(textInputLayout.editText?.text!!.isEmpty()){
            textInputEditText.error = "You need to input a title"
        }

        if(isPhotoInImageView && textInputLayout.editText?.text!!.isNotEmpty()){
            return true
        }
        return false

    }


    private fun checkPermissionForImage(p_c_r: Int) :Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if ((checkSelfPermission(Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED)
                    && (checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED)
            ) {
                val permission = arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.WRITE_EXTERNAL_STORAGE)
                val permissionCoarse = arrayOf(Manifest.permission.WRITE_EXTERNAL_STORAGE)


                requestPermissions(permission, p_c_r)


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
            isPhotoInImageView = true
        }
        else if (resultCode == Activity.RESULT_OK && requestCode == TAKE_PHOTO_REQUEST) {
            imageView.setImageURI(mCurrentPhotoPath)
            isPhotoInImageView = true
        }
    }


    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {

        if (requestCode == PERMISSION_CODE_GALLERY) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                getPhotoFromGallery()
            }
        }
        else if (requestCode == PERMISSION_CODE_CAMERA) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                launchCamera()
            }
        }
    }





}