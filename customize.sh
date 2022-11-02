REPLACE="
"

[ -x "$(which magisk)" ] && MIRRORPATH=$(magisk --path)/.magisk/mirror || unset MIRRORPATH
FILES="fonts.xml fonts_base.xml"
FILEPATHS="/system/etc/ /system_ext/etc/"

for FILE in $FILES; do
  for FILEPATH in $FILEPATHS; do
    if [ $API -ge "26" ] && [ -f $MIRRORPATH$FILEPATH$FILE ]; then
      ui_print "- Migrating $FILE"

      mkdir -p $MODPATH$FILEPATH
      cp -af $MIRRORPATH$FILEPATH$FILE $MODPATH$FILEPATH$FILE

      sed -i 's/<alias name="serif-bold" to="serif" weight="700" \/>/<alias name="serif-thin" to="serif" weight="100" \/>\n<alias name="serif-light" to="serif" weight="300" \/>\n<alias name="serif-medium" to="serif" weight="400" \/>\n<alias name="serif-semi-bold" to="serif" weight="500" \/>\n<alias name="serif-bold" to="serif" weight="700" \/>\n<alias name="serif-black" to="serif" weight="900" \/>/g
' $MODPATH$FILEPATH$FILE

      # SF-Pro-Display (Defualt is Helvetica)
      sed -r -i '/<family>/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family>(.*Roboto-Regular.*)<\/family>/<family>\n<font weight="100" style="normal">SF-Pro-Display-Ultralight.otf<\/font>\n<font weight="200" style="normal">SF-Pro-Display-Thin.otf<\/font>\n<font weight="300" style="normal">SF-Pro-Display-Light.otf<\/font>\n<font weight="400" style="normal">SF-Pro-Display-Regular.otf<\/font>\n<font weight="500" style="normal">SF-Pro-Display-Medium.otf<\/font>\n<font weight="600" style="normal">SF-Pro-Display-Semibold.otf<\/font>\n<font weight="700" style="normal">SF-Pro-Display-Bold.otf<\/font>\n<font weight="800" style="normal">SF-Pro-Display-Heavy.otf<\/font>\n<font weight="900" style="normal">SF-Pro-Display-Black.otf<\/font>\n<font weight="100" style="italic">SF-Pro-Display-UltralightItalic.otf<\/font>\n<font weight="200" style="italic">SF-Pro-Display-ThinItalic.otf<\/font>\n<font weight="300" style="italic">SF-Pro-Display-LightItalic.otf<\/font>\n<font weight="400" style="italic">SF-Pro-Display-RegularItalic.otf<\/font>\n<font weight="500" style="italic">SF-Pro-Display-MediumItalic.otf<\/font>\n<font weight="600" style="italic">SF-Pro-Display-SemiboldItalic.otf<\/font>\n<font weight="700" style="italic">SF-Pro-Display-BoldItalic.otf<\/font>\n<font weight="800" style="italic">SF-Pro-Display-HeavyItalic.otf<\/font>\n<font weight="900" style="italic">SF-Pro-Display-BlackItalic.otf<\/font>\n<\/family>\n<family>\1<\/family>/};
' $MODPATH$FILEPATH$FILE

      # SF-Mono (Defualt is Menlo)
      # monospace
      sed -r -i '/<family name=\"monospace\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family name=\"monospace\">(.*)<\/family>/<family name="monospace">\n<font weight="100" style="normal">SF-Mono-Light.otf<\/font>\n<font weight="300" style="normal">SF-Mono-Regular.otf<\/font>\n<font weight="400" style="normal">SF-Mono-Medium.otf<\/font>\n<font weight="500" style="normal">SF-Mono-Semibold.otf<\/font>\n<font weight="700" style="normal">SF-Mono-Bold.otf<\/font>\n<font weight="900" style="normal">SF-Mono-Heavy.otf<\/font>\n<font weight="100" style="italic">SF-Mono-LightItalic.otf<\/font>\n<font weight="300" style="italic">SF-Mono-RegularItalic.otf<\/font>\n<font weight="400" style="italic">SF-Mono-MediumItalic.otf<\/font>\n<font weight="500" style="italic">SF-Mono-SemiboldItalic.otf<\/font>\n<font weight="700" style="italic">SF-Mono-BoldItalic.otf<\/font>\n<font weight="900" style="italic">SF-Mono-HeavyItalic.otf<\/font>\n<\/family>\n<family name="monospace">\1<\/family>/};
' $MODPATH$FILEPATH$FILE

      # PingFangSC
      # zh-Hans
      sed -r -i '/<family lang=\"zh-Hans\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Hans\">(.*Noto.*CJK.*)<\/family>/<family lang="zh-Hans">\n<font weight="100" style="normal" index="5">PingFangSC.ttc<\/font>\n<font weight="200" style="normal" index="4">PingFangSC.ttc<\/font>\n<font weight="300" style="normal" index="3">PingFangSC.ttc<\/font>\n<font weight="400" style="normal" index="0">PingFangSC.ttc<\/font>\n<font weight="500" style="normal" index="1">PingFangSC.ttc<\/font>\n<font weight="700" style="normal" index="1">PingFangSC.ttc<\/font>\n<font weight="900" style="normal" index="2">PingFangSC.ttc<\/font>\n<\/family>\n<family lang=\"zh-Hans\">\1<\/family>/};
' $MODPATH$FILEPATH$FILE

      # PingFangHK
      # zh-Hant
      sed -r -i '/<family lang=\"zh-Hant\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Hant\">(.*Noto.*CJK.*)<\/family>/<family lang="zh-Hant">\n<font weight="100" style="normal" index="5">PingFangHK.ttc<\/font>\n<font weight="200" style="normal" index="4">PingFangHK.ttc<\/font>\n<font weight="300" style="normal" index="3">PingFangHK.ttc<\/font>\n<font weight="400" style="normal" index="0">PingFangHK.ttc<\/font>\n<font weight="500" style="normal" index="1">PingFangHK.ttc<\/font>\n<font weight="700" style="normal" index="1">PingFangHK.ttc<\/font>\n<font weight="900" style="normal" index="2">PingFangHK.ttc<\/font>\n<\/family>\n<family lang=\"zh-Hans\">\1<\/family>/};
' $MODPATH$FILEPATH$FILE

      # zh-Bopo
      sed -r -i '/<family lang=\"zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Bopo\">(.*Noto.*CJK.*)<\/family>/<family lang="zh-Bopo">\n<font weight="100" style="normal" index="5">PingFangHK.ttc<\/font>\n<font weight="200" style="normal" index="4">PingFangHK.ttc<\/font>\n<font weight="300" style="normal" index="3">PingFangHK.ttc<\/font>\n<font weight="400" style="normal" index="0">PingFangHK.ttc<\/font>\n<font weight="500" style="normal" index="1">PingFangHK.ttc<\/font>\n<font weight="700" style="normal" index="1">PingFangHK.ttc<\/font>\n<font weight="900" style="normal" index="2">PingFangHK.ttc<\/font>\n<\/family>\n<family lang=\"zh-Hant\">\1<\/family>/};
' $MODPATH$FILEPATH$FILE

      # zh-Hant zh-Bopo
      sed -r -i '/<family lang=\"zh-Hant zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Hant zh-Bopo\">(.*Noto.*CJK.*)<\/family>/<family lang="zh-Hant zh-Bopo">\n<font weight="100" style="normal" index="5">PingFangHK.ttc<\/font>\n<font weight="200" style="normal" index="4">PingFangHK.ttc<\/font>\n<font weight="300" style="normal" index="3">PingFangHK.ttc<\/font>\n<font weight="400" style="normal" index="0">PingFangHK.ttc<\/font>\n<font weight="500" style="normal" index="1">PingFangHK.ttc<\/font>\n<font weight="700" style="normal" index="1">PingFangHK.ttc<\/font>\n<font weight="900" style="normal" index="2">PingFangHK.ttc<\/font>\n<\/family>\n<family lang=\"zh-Hant zh-Bopo\">\1<\/family>/};
' $MODPATH$FILEPATH$FILE

      # zh-Hant,zh-Bopo
      sed -r -i '/<family lang=\"zh-Hant,zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
s/<family lang=\"zh-Hant,zh-Bopo\">(.*Noto.*CJK.*)<\/family>/<family lang="zh-Hant,zh-Bopo">\n<font weight="100" style="normal" index="5">PingFangHK.ttc<\/font>\n<font weight="200" style="normal" index="4">PingFangHK.ttc<\/font>\n<font weight="300" style="normal" index="3">PingFangHK.ttc<\/font>\n<font weight="400" style="normal" index="0">PingFangHK.ttc<\/font>\n<font weight="500" style="normal" index="1">PingFangHK.ttc<\/font>\n<font weight="700" style="normal" index="1">PingFangHK.ttc<\/font>\n<font weight="900" style="normal" index="2">PingFangHK.ttc<\/font>\n<\/family>\n<family lang=\"zh-Hant,zh-Bopo\">\1<\/family>/};
' $MODPATH$FILEPATH$FILE

    fi
  done
done
