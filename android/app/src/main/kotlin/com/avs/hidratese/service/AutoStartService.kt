package com.avs.hidratese.service

import android.app.*
import android.content.Context
import android.content.Intent
import android.media.MediaPlayer
import android.os.Build
import android.os.IBinder
import android.util.Log
import androidx.core.app.NotificationCompat
import com.avs.hidratese.MainActivity
import com.avs.hidratese.R
import java.util.*
import android.content.BroadcastReceiver;


class AutoStartService : Service() {

    private val chID = "Reminder"

    override fun onCreate() {
        super.onCreate()
        // listTime();
       // startNotification()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        super.onStartCommand(intent, flags, startId)
       // startNotification()
        listTime()
        val i = Intent(this, MainActivity::class.java)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            this.startForegroundService(i)
        }

        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? {
        // TODO: Return the communication channel to the service.
        throw UnsupportedOperationException("Not yet implemented")
    }

    private fun startNotification() {
        Log.d("NOTIFICATION'S", "------------------------------------>START NOTIFICATIOM")
        //        mp = MediaPlayer.create(this, R.raw.alarm_beep);
//        mp.start();
        val notMan = this.getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val name = "REMINDER NOTIFICATION"
            val description = "Notification channel for notifying while reminder beeps."
            val importance = NotificationManager.IMPORTANCE_HIGH
            val channel = NotificationChannel(chID, name, importance)
            channel.description = description
            notMan.createNotificationChannel(channel)
        }
        val builder = NotificationCompat.Builder(this, chID)
            .setSmallIcon(R.drawable.ic_launcher_adaptive_fore)
            .setContentTitle("It's time!")
            .setContentText("Ops funciounou")
            .setPriority(NotificationCompat.PRIORITY_DEFAULT)
        val i = Intent(this, MainActivity::class.java)
        val pendingIntent = PendingIntent.getActivity(this, 0, i, PendingIntent.FLAG_ONE_SHOT)
        builder.setContentIntent(pendingIntent)
        notMan.notify(1, builder.build())
        startForeground(1, builder.build())
        // }
    }

    private fun listTime() {
        //for(int i=1;i<=2;i++){
        val cal_alarm = Calendar.getInstance()
        cal_alarm[Calendar.HOUR_OF_DAY] = 1
        cal_alarm[Calendar.SECOND] = 28
        cal_alarm[Calendar.MILLISECOND] = 0
        showInfo(cal_alarm)

        cal_alarm[Calendar.HOUR_OF_DAY] = 1
        cal_alarm[Calendar.MINUTE] = 30
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
            this,
            BroadcastForReminder::class.java
        )
        intent.putExtra("startSoundAndVibration", true)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        val pi = PendingIntent.getBroadcast(
            getApplicationContext(),
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
}