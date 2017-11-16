package com.sky.scanner;

import android.content.Intent;
import android.os.Vibrator;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import cn.bingoogolapple.qrcode.core.QRCodeView;
import cn.bingoogolapple.qrcode.zxing.ZXingView;

public class ScannerActivity extends AppCompatActivity implements QRCodeView.Delegate {

  private static final String TAG = "ReactNativeJS";
  private static final int REQUEST_CODE_CHOOSE_QRCODE_FROM_GALLERY = 666;

  private QRCodeView mQRCodeView;
  private Button close;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_scanner);

    mQRCodeView = (ZXingView) findViewById(R.id.zxingview);
    mQRCodeView.setDelegate(this);
    close = (Button)findViewById(R.id.close);
    close.setOnClickListener(this.closeListener);
  }

  @Override
  public void onScanQRCodeSuccess(String result) {
    scanResult(result);
  }

  @Override
  public void onScanQRCodeOpenCameraError() {
    scanResult(null);
  }

  private void scanResult(String result){
    Log.i(TAG, "ScannerActivity scan result -->> " + result);

    Intent intent = new Intent();
    intent.putExtra(ScannerModule.resultLabel, result);
    setResult(RESULT_OK, intent);
//  vibrate();
    mQRCodeView.startSpot();
    finish();
  }

  /** Base **/
  @Override
  protected void onStart() {
    super.onStart();
    mQRCodeView.startCamera();
//  mQRCodeView.startCamera(Camera.CameraInfo.CAMERA_FACING_FRONT);
    mQRCodeView.showScanRect();

    // 开始识别
    mQRCodeView.startSpot();
  }

  @Override
  protected void onStop() {
    mQRCodeView.stopCamera();
    // 停止识别
    mQRCodeView.stopSpot();
    super.onStop();
  }

  @Override
  protected void onDestroy() {
    mQRCodeView.onDestroy();
    super.onDestroy();
  }

  @Override
  public void onBackPressed() {
    super.onBackPressed();

  }

  /** Util */
  private void vibrate() {
    Vibrator vibrator = (Vibrator) getSystemService(VIBRATOR_SERVICE);
    vibrator.vibrate(200);
  }

  private View.OnClickListener closeListener = new View.OnClickListener() {
    @Override
    public void onClick(View v) {
      ScannerActivity.this.onBackPressed();
    }
  };

}
