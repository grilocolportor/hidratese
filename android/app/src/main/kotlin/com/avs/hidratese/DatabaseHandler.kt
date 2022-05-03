package com.avs.hidratese

import android.content.ContentValues
import android.content.Context
import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteException
import android.database.sqlite.SQLiteOpenHelper

class DatabaseHandler (context: Context): SQLiteOpenHelper(context,DATABASE_NAME,null,DATABASE_VERSION) {
    companion object {
        private val DATABASE_VERSION = 1
        private val DATABASE_NAME = "Hidratese"
        //table user
        private val TABLE_USER = "User"
        private val KEY_ID = "id"
        private val KEY_SEXO = "sexo"
        private val KEY_ACORDAR = "acordar"
        private val KEY_DORMIR = "dormir"

        //table hsitorico
        private val TABLE_HISTORIC = "Historico"
        private val KEY_ID_HISTORIC = "id"
        private val KEY_DATE_HISTORIC = "date"
        private val KEY_TIME_HISTORIC = "time"
        private val KEY_ML_HISTORIC = "ml"
        private val KEY_NAME_HISTORIC = "name"

        //table glass
        private val TABLE_GLASS = "Glass"
        private val KEY_ID_GLASS = "id"
        private val KEY_NAME_GLASS = "name"
        private val KEY_ML_GLASS = "ml"
        private val KEY_ASSETS_GLASS = "image"

        //table historico by day
        private val TABLE_DAYLE_TARGET = "Dayle_target"
        private val KEY_DAYLE_TARGET_ID = "dayle_target_id"
        private val KEY_DATE = "date"
        private val kEY_TARGET = "dayle_target"
        private val KEY_WEATHER_TEMP = "weather_temp"
        private val KEY_WEATHER_HUMIDITY = "weather_humidity"
        private val KEY_LIFE_STYLE = "life_style"


        //table param by day 
        private val TABLE_DAYLE_CHECK = "Dayle_check"
        private val TABLE_DAYLE_CHECK_ID = "Dayle_check_id"
        private val KEY_DATE_CHECK = "date"
        private val KEY_PESO = "peso"
        private val KEY_TEMPERATURA = "temperatura"
        private val KEY_HUMIDADE = "humidade"
        private val KEY_ESTILO_VIDA = "estilo_vida"

    }

    override fun onCreate(db: SQLiteDatabase?) {
        // TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
        //creating table with fields

        val CREATE_USER_TABLE = ("CREATE TABLE " + TABLE_USER + "("
                + KEY_ID + " INTEGER PRIMARY KEY  AUTOINCREMENT,"
                + KEY_SEXO + " TEXT,"
                + KEY_ACORDAR + " TEXT,"
                + KEY_DORMIR + " TEXT" + ")")
        db?.execSQL(CREATE_USER_TABLE)

        val CREATE_HISTORIC_TABLE = ("CREATE TABLE " + TABLE_HISTORIC + "(" +
                KEY_ID_HISTORIC + " INTEGER PRIMARY KEY  AUTOINCREMENT," +
                KEY_DATE_HISTORIC + " TEXT, " +
                KEY_TIME_HISTORIC + " TEXT, " +
                KEY_ML_HISTORIC + " TEXT, " +
                KEY_NAME_HISTORIC + " TEXT)")
        db?.execSQL(CREATE_HISTORIC_TABLE)

        val CREATE_GLASS_TABLE = ("CREATE TABLE " + TABLE_GLASS + "(" +
                KEY_ID_GLASS + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                KEY_NAME_GLASS + " TEXT, " +
                KEY_ASSETS_GLASS + " TEXT, " +
                KEY_ML_GLASS + " TEXT)")
        db?.execSQL(CREATE_GLASS_TABLE)

        val CREATE_DAYLE_TARGET_TABLE = ("CREATE TABLE " + TABLE_DAYLE_TARGET + "(" +
                KEY_DAYLE_TARGET_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                KEY_DATE + " TEXT, " +
                kEY_TARGET + " TEXT, " +
                KEY_WEATHER_HUMIDITY + " TEXT, " +
                KEY_LIFE_STYLE + " TEXT, " +
                KEY_WEATHER_TEMP + " TEXT)")
        db?.execSQL(CREATE_DAYLE_TARGET_TABLE)

        val CREATE_DAYLE_CHECK = ("CREATE TABLE " + TABLE_DAYLE_CHECK + "("
                + TABLE_DAYLE_CHECK_ID + " INTEGER PRIMARY KEY  AUTOINCREMENT,"
                + KEY_DATE_CHECK + " TEXT,"
                + KEY_PESO + " TEXT,"
                + KEY_TEMPERATURA + " TEXT,"
                + KEY_HUMIDADE + " TEXT,"
                + KEY_ESTILO_VIDA + " TEXT" + ")")
        db?.execSQL(CREATE_DAYLE_CHECK)

    }

    override fun onUpgrade(db: SQLiteDatabase?, oldVersion: Int, newVersion: Int) {
        db!!.execSQL("DROP TABLE IF EXISTS " + TABLE_USER)
        db!!.execSQL("DROP TABLE IF EXISTS " +  TABLE_GLASS)
        db!!.execSQL("DROP TABLE IF EXISTS " +  TABLE_HISTORIC)
        db!!.execSQL("DROP TABLE IF EXISTS " +  TABLE_DAYLE_TARGET)
        db!!.execSQL("DROP TABLE IF EXISTS " +  TABLE_DAYLE_CHECK)
        onCreate(db)
        
    }

    //method to insert data

    fun addGlass():Long{
        val db = this.writableDatabase

        val contentValues = ContentValues()

        contentValues.put(KEY_NAME_GLASS, "Copo")
        contentValues.put(KEY_ML_GLASS, "190ml")
        contentValues.put(KEY_ASSETS_GLASS, "assets/images/copo_190ml.png")
        var success = db.insert(TABLE_GLASS, null, contentValues)

        contentValues.put(KEY_NAME_GLASS, "Copo")
        contentValues.put(KEY_ML_GLASS,"210ml")
        contentValues.put(KEY_ASSETS_GLASS, "assets/images/copo_210ml.png")
        success = db.insert(TABLE_GLASS, null, contentValues)

        contentValues.put(KEY_NAME_GLASS, "Chá")
        contentValues.put(KEY_ML_GLASS,"240ml")
        contentValues.put(KEY_ASSETS_GLASS, "assets/images/xicara_cha_240ml.png")
        success = db.insert(TABLE_GLASS, null, contentValues)

        contentValues.put(KEY_NAME_GLASS, "Lata")
        contentValues.put(KEY_ML_GLASS,"350ml")
        contentValues.put(KEY_ASSETS_GLASS, "assets/images/lata_350ml.png")
        success = db.insert(TABLE_GLASS, null, contentValues)

        contentValues.put(KEY_NAME_GLASS, "Caneca")
        contentValues.put(KEY_ML_GLASS, "400ml")
        contentValues.put(KEY_ASSETS_GLASS, "assets/images/caneca_400ml.png")
        success = db.insert(TABLE_GLASS, null, contentValues)

        contentValues.put(KEY_NAME_GLASS, "Garrafa")
        contentValues.put(KEY_ML_GLASS,"500ml")
        contentValues.put(KEY_ASSETS_GLASS, "assets/images/garrafa_500ml.png")
        success = db.insert(TABLE_GLASS, null, contentValues)

        contentValues.put(KEY_NAME_GLASS, "Garrafa")
        contentValues.put(KEY_ML_GLASS,"1000ml")
        contentValues.put(KEY_ASSETS_GLASS, "assets/images/garrafa_1000ml.png")
        success = db.insert(TABLE_GLASS, null, contentValues)

        db.close() // Closing database connection
        return success

    }
//    fun addUser(usr: UserModelClass):Long{
//        var db = this.writableDatabase
//        var contentValues = ContentValues()
//        contentValues.put(KEY_ID, usr.userId)
//        contentValues.put(KEY_SEXO, usr.sexo) // EmpModelClass Name
//        contentValues.put(KEY_PESO, usr.peso)
//        contentValues.put(KEY_ACORDAR, usr.acordar)
//        contentValues.put(KEY_QUANDO_LEMBRAR, usr.lembrar)
//        contentValues.put(KEY_LITROS_POR_DIA, usr.litro)
//        // EmpModelClass Phone
//        // Inserting Row
//        var success = db.insert(TABLE_USER, null, contentValues)
//        //2nd argument is String containing nullColumnHack
//        db.close() // Closing database connection
//        return success
//    }

//    fun viewUser():List<UserModelClass>{
//        var usrList:ArrayList<UserModelClass> = ArrayList<UserModelClass>()
//        var selectQuery = "SELECT  * FROM $TABLE_USER"
//        var db = this.readableDatabase
//        var cursor: Cursor? = null
//        try{
//            cursor = db.rawQuery(selectQuery, null)
//        }catch (e: SQLiteException) {
//            db.execSQL(selectQuery)
//            return ArrayList()
//        }
//        var userId: Int
//        var sexo: String
//        var peso: String
//        var acordar: String
//        var dormir: String
//        var lembrar: String
//        var litros: String
//        if (cursor.moveToFirst()) {
//            do {
//                userId = cursor.getInt(cursor.getColumnIndex("id"))
//                sexo = cursor.getString(cursor.getColumnIndex("sexo"))
//                peso = cursor.getString(cursor.getColumnIndex("peso"))
//                acordar = cursor.getString(cursor.getColumnIndex("acordar"))
//                dormir = cursor.getString(cursor.getColumnIndex("dormir"))
//                lembrar = cursor.getString(cursor.getColumnIndex("lembrar"))
//                litros = cursor.getString(cursor.getColumnIndex("litros"))
//                val usr= UserModelClass(
//                    userId = userId,
//                    sexo = sexo,
//                    peso = peso,
//                    acordar = acordar,
//                    dormir = dormir,
//                    lembrar = lembrar,
//                    litro = litros
//                )
//                usrList.add(usr)
//            } while (cursor.moveToNext())
//        }
//        return usrList
//    }
//
//    fun updateUser(usr: UserModelClass):Int{
//        var db = this.writableDatabase
//        var contentValues = ContentValues()
//        contentValues.put(KEY_ID, usr.userId)
//        contentValues.put(KEY_SEXO, usr.sexo) // EmpModelClass Name
//        contentValues.put(KEY_PESO, usr.peso)
//        contentValues.put(KEY_ACORDAR, usr.acordar)
//        contentValues.put(KEY_DORMIR, usr.dormir)
//        contentValues.put(KEY_LITROS_POR_DIA, usr.litro)
//        contentValues.put(KEY_QUANDO_LEMBRAR, usr.lembrar)
//        // Updating Row
//        var success = db.update(TABLE_USER, contentValues,"id="+usr.userId,null)
//        //2nd argument is String containing nullColumnHack
//        db.close() // Closing database connection
//        return success
//    }
//    //method to delete data
//    fun deleteUser(usr: UserModelClass):Int{
//        var db = this.writableDatabase
//        var contentValues = ContentValues()
//        contentValues.put(KEY_ID, usr.userId) // EmpModelClass UserId
//        // Deleting Row
//        var success = db.delete(TABLE_USER,"id="+usr.userId,null)
//        //2nd argument is String containing nullColumnHack
//        db.close() // Closing database connection
//        return success
//    }
}