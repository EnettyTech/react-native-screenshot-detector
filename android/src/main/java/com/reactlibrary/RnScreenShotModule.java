package com.reactlibrary;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import android.view.WindowManager;
import android.app.Activity;

public class RnScreenShotModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public RnScreenShotModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }


    @Override
    public String getName() {
        return "RnScreenShot";
    }

    @ReactMethod
    public void DisableScreenShot() {
       final Activity activity = getCurrentActivity();
       if (activity == null){
           return;
       }
       activity.runOnUiThread(new Runnable() {
           @Override
           public void run() {
               activity.getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);
           }
       });

    }

    @ReactMethod
    public void EnableScreenshot(){
        final Activity activity =getCurrentActivity();
        if (activity == null){
            return;
        }
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
            }
        });
    }
}
