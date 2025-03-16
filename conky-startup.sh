#!/bin/bash
cd ~/.conky/my_theme

sleep 30 &
conky -c ./conkyrc_cpus &
conky -c ./conkyrc_time &
conky -c ./conkyrc_file &
conky -c ./conkyrc_weather &
exit 0
