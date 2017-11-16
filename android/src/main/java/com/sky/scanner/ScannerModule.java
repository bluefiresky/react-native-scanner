package com.sky.scanner;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;

/**
 * Created by sky on 2017/11/10.
 */

public class ScannerModule extends ReactContextBaseJavaModule implements ActivityEventListener {

  private final static String TAG = "ReactNativeJS";
  private ReactContext reactContext;
  private Promise promise;
  protected final static int requestCode = 11111;
  protected final static String resultLabel = "scanner-result";

  public ScannerModule(ReactApplicationContext reactContext){
    super(reactContext);
    this.reactContext = reactContext;
  }

  @ReactMethod
  public void show(Promise promise){
    this.reactContext.addActivityEventListener(this);
    this.promise = promise;

    Activity currentActivity = getCurrentActivity();
    if(currentActivity != null){
      Intent intent = new Intent();
      intent.setClass(getCurrentActivity(), ScannerActivity.class);
      currentActivity.startActivityForResult(intent, requestCode);
    }else{
      responseHelper(1, null);
    }
  }

  @Override
  public String getName() {
    return "ScannerModule";
  }

  @Override
  public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
    this.reactContext.removeActivityEventListener(this);
    if(requestCode == ScannerModule.requestCode){
      if(resultCode == Activity.RESULT_OK){
        String res = data.getStringExtra(resultLabel);
        if(res != null){
          responseHelper(0, res);
        }else{
          responseHelper(1, null);
        }
      }else{
        responseHelper(2, null);
      }
    }
  }

  @Override
  public void onNewIntent(Intent intent) {

  }

  /** Util **/
  private void responseHelper(int errorCode, String res){
    WritableMap map = Arguments.createMap();
    switch (errorCode){
      case 0:
        map.putString("result", res);
        break;
      case 1:
        map.putString("error", "扫码失败");
        break;
      case 2:
//        this.promise.resolve(null);
        return;
      default:
        map.putString("error", "扫码失败");
        break;
    }
    this.promise.resolve(map);
  }
}
