#!/bin/sh
#
# Show current weather and temperature via OpenWeatherMap [1]. The weather
# icon requires a special font [2].
#
# [1] http://openweathermap.org/
# [2] http://erikflowers.github.io/weather-icons/

API="http://api.openweathermap.org/data/2.5/forecast?q=%s&units=imperial&mode=xml&appid=be22f778633d53500a0fe39dc09ba5d5"

today() {
    curl -s --connect-timeout 5 $(printf $API $@)
}

temperature() {
    xmllint --xpath 'string(//current/temperature/@value)' -
}

icon() {
    xmllint --xpath 'string(//current/weather/@icon)' -
}


main() {
    xml=$(today $1)

    case $(echo $xml | icon) in
        #== day ==#
        #
        # clear sky
        01d)
            printf " "
            ;;
        # few-clouds
        02d)
            printf " "
            ;;
        # scattered-clouds
        03d)
            printf " "
            ;;
        # broken-clouds
        04d)
            printf " "
            ;;
        # shower rain
        09d)
            printf " "
            ;;
        # rain
        10d)
            printf " "
            ;;
        # thunderstorm
        11d)
            printf " "
            ;;
        # snow
        13d)
            printf " "
            ;;
        # mist
        50d)
            printf " "
            ;;
        #== night ==#
        #
        # clear sky
        01n)
            printf " "
            ;;
        # few-clouds
        02n)
            printf " "
            ;;
        # scattered-clouds
        03n)
            printf " "
            ;;
        # broken-clouds
        04n)
            printf " "
            ;;
        # shower rain
        09n)
            printf " "
            ;;
        # rain
        10n)
            printf " "
            ;;
        # thunderstorm
        11n)
            printf " "
            ;;
        # snow
        13n)
            printf " "
            ;;
        # mist
        50n)
            printf " "
            ;;
    esac

    printf "%0.1f °F\n" $(echo $xml | temperature)
}

main $@
