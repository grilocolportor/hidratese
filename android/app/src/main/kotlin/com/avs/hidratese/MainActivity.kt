package com.avs.hidratese

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Intent
import android.database.Cursor
import android.database.sqlite.SQLiteException
import android.media.MediaPlayer
import android.os.Build
import android.os.Bundle
import android.util.Log
import com.avs.hidratese.service.AutoStartReceiver
import com.avs.hidratese.service.AutoStartService
import com.avs.hidratese.service.BroadcastForReminder
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import java.util.*


class MainActivity : FlutterActivity() {

    lateinit var mp: MediaPlayer

    var databaseHandler: DatabaseHandler? = null;



    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        NativeMethodChannel.configureChannel(flutterEngine, this)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }

    override fun onStart() {
        super.onStart()

       // stopService()

        databaseHandler = DatabaseHandler(this)

        val selectQuery = "SELECT name FROM sqlite_master WHERE type='table'"
        var c: Cursor? = null

        val db = databaseHandler?.readableDatabase
        try {
            if (db != null) {
                c = db.rawQuery(selectQuery, null, null)
            }

            if (c != null) {
                if (c.moveToFirst()) {
                    if (c != null) {
                        while (!c.isAfterLast) {
                            Log.d("table", c.getString(0))
                            c.moveToNext()
                        }
                    }
                }
            }
        } catch (e: SQLiteException) {
            db?.execSQL(selectQuery)

        }

        val getUserQuery = "SELECT * FROM User"

        try {

            if (db != null) {
                c = db.rawQuery(getUserQuery, null, null)
            }
            if (c != null) {
                if (c.moveToFirst()) {
                    while (!c.isAfterLast) {
                        Log.d("Perfil", c.getString(5))
                            c.moveToNext()
                    }
                }
            }

        } catch (e: SQLiteException) {
            if (db != null) {
                db.execSQL(selectQuery)
            }

        }

        val countGlass = "SELECT * FROM Glass"

        try {

            if (db != null) {
                c = db.rawQuery(countGlass, null, null)
            }
            if (c != null) {
                if (c.count ==0) {
                    databaseHandler!!.addGlass()
                }
            }

        } catch (e: SQLiteException) {
            if (db != null) {
                db.execSQL(selectQuery)
            }

        }
      //  listTime()

//        val iin = intent
//        val startSoundAndVibration = iin.getBooleanExtra("startSoundAndVibration", false)
//
//        if (startSoundAndVibration) {
//
//            mp = MediaPlayer.create(this, R.raw.alarm_beep)
//            mp.start()
//        }
//
//        val notificationIntent = Intent(this, AutoStartReceiver::class.java)
//        notificationIntent.addCategory("android.intent.category.DEFAULT")
//
//        val broadcast: PendingIntent = PendingIntent.getBroadcast(
//            this,
//            100,
//            notificationIntent,
//            PendingIntent.FLAG_UPDATE_CURRENT
//        )


        //setPermissions()

        //startingServices()

    }

    private fun listTime() {
        //for(int i=1;i<=2;i++){
        val cal_alarm = Calendar.getInstance()
        cal_alarm[Calendar.HOUR_OF_DAY] = 8
        cal_alarm[Calendar.SECOND] = 35
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 9
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 10
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 11
        cal_alarm[Calendar.MINUTE] = 6
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 12
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 13
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 14
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 15
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 16
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 17
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 18
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 19
        cal_alarm[Calendar.MINUTE] = 0
        cal_alarm[Calendar.SECOND] = 0
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)
    }
    private fun showInfo(cal_alarm: Calendar) {
        Log.d(
            "NOTIFICACION",
            "------------------------------------>ALARM MANAGER: " + System.currentTimeMillis()
                .toInt()
        )
        val intent = Intent(
            applicationContext,
            BroadcastForReminder::class.java
        )
        intent.putExtra("startSoundAndVibration", "Alguma coisa")
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        val pi = PendingIntent.getBroadcast(
            applicationContext,
            System.currentTimeMillis().toInt(), intent, 0
        )
        val am = getSystemService(ALARM_SERVICE) as AlarmManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, cal_alarm.timeInMillis, pi)
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            am.setExact(AlarmManager.RTC_WAKEUP, cal_alarm.timeInMillis, pi)
        }else{
            am.set(AlarmManager.RTC_WAKEUP, cal_alarm.timeInMillis, pi)
        }
    }

//    public fun setPermissions(){
//
//        if(AutoStartPermissionHelper.getInstance().isAutoStartPermissionAvailable(context)){
//            AutoStartPermissionHelper.getInstance().getAutoStartPermission(context)
//        }
//
//        val inte = Intent("miui.intent.action.APP_PERM_EDITOR")
//        val manufacturer = Build.MANUFACTURER
//        if ("xiaomi".equals(manufacturer, ignoreCase = true)) {
//            inte.component = ComponentName(
//                "com.miui.securitycenter",
//                "com.miui.permcenter.permissions.PermissionsEditorActivity"
//            )
//            inte.putExtra("extra_pkgname", packageName)
//            startActivity(inte)
//        }
//
//        getInstance().getAutoStartPermission(
//            applicationContext, true, true
//        )
//
//
//    }

  

     fun stopService() {
        val serviceIntent = Intent(this, AutoStartService::class.java)
        stopService(serviceIntent)
    }


    override fun onDestroy() {
        super.onDestroy()
        //call close() of the helper class
        databaseHandler?.close()
    }



}




