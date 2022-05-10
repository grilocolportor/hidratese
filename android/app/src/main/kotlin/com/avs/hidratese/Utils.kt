package com.avs.hidratese

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.core.content.ContextCompat
import com.avs.hidratese.service.AutoStartService

object Utils {

    fun setAutoStart(context: Context): String {

        if (AutoStartPermissionHelper.getInstance().isAutoStartPermissionAvailable(context)) {
            AutoStartPermissionHelper.getInstance().getAutoStartPermission(context, true, true)
        }

        return "Sucesso"
    }

    fun checkDeviceManufacturer(): String {
        val manufacturer = Build.MANUFACTURER
        if ("xiaomi".equals(manufacturer, ignoreCase = true)) {
            return "Xiaomi"
        }else{
            return manufacturer
        }
    }

    fun setPermissions(context: Context): String {

        val manufacturer = Build.MANUFACTURER
        if ("xiaomi".equals(manufacturer, ignoreCase = true)) {
            val intent = Intent("miui.intent.action.APP_PERM_EDITOR")
            intent.component =
                    ComponentName(
                            "com.miui.securitycenter",
                            "com.miui.permcenter.permissions.PermissionsEditorActivity"
                    )
            intent.putExtra("extra_pkgname", context.packageName)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent)
            
        }

        return "Sucesso"
    }

    fun startingServices(context: Context): String {
        val intent = Intent(context.applicationContext, AutoStartService::class.java)
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            ContextCompat.startForegroundService(context.applicationContext, intent)
        } else {
            context.startService(intent)
        }
        return "Service ok"
    }
}
