package com.avs.hidratese.service

import android.app.*
import android.content.BroadcastReceiver
import android.content.Context
import android.media.MediaPlayer
import android.content.Intent as Intent
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat.getSystemService
import com.avs.hidratese.MainActivity
import com.avs.hidratese.R
import java.util.*

class AutoStartReceiver : BroadcastReceiver() {
    var TAG = "ALARMS"
    var CLASS = this.javaClass.simpleName + ": "
    private val chID = "Reminder"
    override fun onReceive(context: Context, intent: Intent) {
       //  if (Intent.ACTION_BOOT_COMPLETED == intent.action) {
             Log.d(
                 TAG,
                 "$CLASS-------------------------------------->BOOT_COMPLETED action has been received."
             )

//             val activityIntent = Intent(context.applicationContext, AutoStartService::class.java)
//             activityIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
//             if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//                 context.applicationContext.startForegroundService(activityIntent)
//             } else {
//                 context.startService(activityIntent)
//             }
                 // }
    }


}

class BroadcastForReminder : BroadcastReceiver() {
    lateinit var mp: MediaPlayer
    override fun onReceive(context: Context, intent: Intent) {
        mp = MediaPlayer.create(context, R.raw.alarm_beep)
        mp.start()
        val msg = intent.getStringExtra("startSoundAndVibration")
        if (intent.getStringExtra("startSoundAndVibration") != null && intent.getStringExtra("startSoundAndVibration") == msg) {
            val notMan =
                context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                val name = "REMINDER NOTIFICATION"
                val description = "Notification channel for notifying while reminder beeps."
                val importance = NotificationManager.IMPORTANCE_HIGH
                val channel = NotificationChannel(chID, name, importance)
                channel.description = description
                notMan.createNotificationChannel(channel)
            }
            val builder: NotificationCompat.Builder = NotificationCompat.Builder(context, chID)
                .setSmallIcon(android.R.drawable.alert_light_frame)
                .setContentTitle("It's time!")
                .setContentText(msg)
                .setPriority(NotificationCompat.PRIORITY_DEFAULT)
                .setAutoCancel(true)
            val i = Intent(context, MainActivity::class.java)
            val pendingIntent =
                PendingIntent.getActivity(context, 0, i, PendingIntent.FLAG_ONE_SHOT)
            builder.setContentIntent(pendingIntent)
            notMan.notify(1, builder.build())
        }
    }

    companion object {
        var mp: MediaPlayer? = null
        const val chID = "Reminder"
    }
}
