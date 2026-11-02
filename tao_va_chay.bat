@echo off
setlocal
cd /d "%~dp0"

echo ==========================================
echo   STUDYFLOW - TAO FLUTTER PROJECT VA CHAY
echo ==========================================

where flutter >nul 2>nul
if errorlevel 1 (
  echo [LOI] Khong tim thay lenh flutter.
  echo Hay cai Flutter SDK va them thu muc bin vao PATH.
  echo Huong dan: https://docs.flutter.dev/get-started/install
  pause
  exit /b 1
)

if not exist generated_app (
  echo [1/4] Tao bo khung Flutter cho Android va Web...
  flutter create --platforms=android,web --project-name studyflow_demo generated_app
  if errorlevel 1 goto :failed
) else (
  echo [1/4] Su dung thu muc generated_app hien co...
)

echo [2/4] Cap nhat toan bo thu muc lib va cau hinh vao project...
if exist "generated_app\lib" rmdir /S /Q "generated_app\lib"
xcopy /E /I /Y "lib" "generated_app\lib" >nul
copy /Y "pubspec.yaml" "generated_app\pubspec.yaml" >nul
copy /Y "analysis_options.yaml" "generated_app\analysis_options.yaml" >nul
copy /Y "test\widget_test.dart" "generated_app\test\widget_test.dart" >nul

echo [3/4] Tai cac goi phu thuoc...
cd generated_app
call flutter pub get
if errorlevel 1 goto :failed

echo [4/4] Chay demo tren Chrome...
call flutter run -d chrome

goto :end

:failed
echo.
echo [LOI] Qua trinh tao hoac chay project that bai.
echo Hay doc README.md de xem cach chay thu cong.
pause
exit /b 1

:end
endlocal
