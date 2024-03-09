#!/bin/bash

days_in_month(){
  [ "$#" == "2" ] && date -d "$1/01/$2 +1month -1day" +%d
  [ "$#" == "1" ] && days_in_month $1 `date +%Y`
  [ "$#" == "0" ] && days_in_month `date +'%m %Y'`
 }
