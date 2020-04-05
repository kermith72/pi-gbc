#!/bin/sh
#read status gpio
# statusgpio num BCM
# Result Name Mode Valeur

case $1 in
  0)CHAINE="SDA.0"
    COLONNE="R"
    ;;
  1)CHAINE="SCL.0"
    COLONNE="L"
    ;;
  2)CHAINE="SDA.1"
    COLONNE="R"
    ;;
  3)CHAINE="SCL.1"
    COLONNE="R"
    ;;
  4)CHAINE="GPIO. 7"
    COLONNE="R"
    ;;
  5)CHAINE="GPIO.21"
    COLONNE="R"
    ;;
  6)CHAINE="GPIO.22"
    COLONNE="R"
    ;;
  7)CHAINE="CE1"
    COLONNE="L"
    ;;
  8)CHAINE="CE0"
    COLONNE="L"
    ;;
  9)CHAINE="MISO"
    COLONNE="R"
    ;;
  10)CHAINE="MOSI"
    COLONNE="R"
    ;;
  11)CHAINE="SCLK"
    COLONNE="R"
    ;;
  12)CHAINE="GPIO.26"
    COLONNE="L"
    ;;
  13)CHAINE="GPIO.23"
    COLONNE="R"
    ;;
  14)CHAINE="TxD"
    COLONNE="L"
    ;;
  15)CHAINE="RxD"
    COLONNE="L"
    ;;
  16)CHAINE="GPIO.27"
    COLONNE="L"
    ;;
  17)CHAINE="GPIO. 0"
    COLONNE="R"
    ;;
  18)CHAINE="GPIO. 1"
    COLONNE="L"
    ;;
  19)CHAINE="GPIO.24"
    COLONNE="R"
    ;;
  20)CHAINE="GPIO.28"
    COLONNE="L"
    ;;
  21)CHAINE="GPIO.29"
    COLONNE="L"
    ;;
  22)CHAINE="GPIO. 3"
    COLONNE="R"
    ;;
  23)CHAINE="GPIO. 4"
    COLONNE="R"
    ;;
  24)CHAINE="GPIO. 5"
    COLONNE="L"
    ;;
  25)CHAINE="GPIO. 6"
    COLONNE="L"
    ;;
  26)CHAINE="GPIO.25"
    COLONNE="R"
    ;;
  27)CHAINE="GPIO. 2"
    COLONNE="R"
    ;;
esac

if [ $COLONNE = "R" ]
then
  MODE=$(gpio readall | grep "$CHAINE" | cut -d\| -f5)
else
  MODE=$(gpio readall | grep "$CHAINE" | cut -d\| -f11)
fi

VALEUR=$(gpio -g read $1)

echo "Name "$CHAINE" mode "$MODE" valeur "$VALEUR
