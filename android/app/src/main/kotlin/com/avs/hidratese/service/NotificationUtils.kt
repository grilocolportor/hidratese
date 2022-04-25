package com.avs.hidratese.service

import android.annotation.TargetApi
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.graphics.Color
import android.media.RingtoneManager
import android.os.Build
import androidx.core.app.NotificationCompat
import com.avs.hidratese.MainActivity
import com.avs.hidratese.R

class NotificationUtils (base: Context) : ContextWrapper(base) {

   
//    fun getNotificationBuilder(pendingIntent: PendingIntent): NotificationCompat.Builder {
//
//
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//            try {
//                with(
//                    NotificationChannel(
//                        "TESTE DE LOCAL NOTIFICATION",
//                        getString(R.string.app_name),
//                        NotificationManager.IMPORTANCE_DEFAULT
//                    )
//                ) { NotificationCompat.Builder(applicationContext, MYCHANNEL_ID)
//                    .setContentTitle("Alarm!")
//                    .setContentText("Your AlarmManager is working.")
//                    .setSmallIcon(R.drawable.ic_launcher_adaptive_fore)
//                    .setColor(Color.YELLOW)
//                    .setContentIntent(pendingIntent)
//                    .setSound(RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION))
//                    .setAutoCancel(true)}
//            }catch (
//                ignored: Exception
//            ){}
//
//        }
//
//        with(
//            NotificationCompat.Builder(
//                this,
//                "TESTE DE LOCAL NOTIFICATION"
//            )
//        ){
//            setContentTitle("Alarm!")
//                .setContentText("Your AlarmManager is working.")
//                .setSmallIcon(R.drawable.ic_launcher_adaptive_fore)
//                .setColor(Color.YELLOW)
//                .setContentIntent(notePendingIntent)
//                .setSound(RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION))
//                .setAutoCancel(true)
//            priority = Notification.VISIBILITY_PUBLIC
//            setContentIntent(notePendingIntent)
//            addAction(
//                NotificationCompat.Action(
//                    0,
//                    getString(R.string.default_notification_title),
//                    notePendingIntent
//                )
//            )
//            startForeground(2, build())
//        }
//    }
}