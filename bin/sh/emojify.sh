#!/usr/bin/env bash
#
# emojify
# https://github.com/mrowa44/emojify
#
# Substitutes emoji aliases (like :sparkling_heart:) to emoji raw characters.
#
# emojify takes input from argument list or from the pipeline.
#
#
# For instance, to emojify git log run:
#   $ git log --oneline --color | emojify | less
# (you need to specify color option if you want colors)
#
# To have an alias that does that for you, add something like:
#   log = ! git log --oneline --color | emojify | less
# to your .gitconfig
#
# Or, you could do something silly like:
#   $ emojify "Hey, I just :raising_hand: you, and this is :scream: , but
#     here's my :calling: , so :telephone_receiver: me, maybe?"


# Regex for emoji names like :sparkling_heart:
regex=':([A-Za-z1-9_])+:'

# Gets emoji from 'hash'
# Returns raw emoji character or word
to_emoji () {
  local key=$1
  for (( x=0; x < ${#keys[@]}; x++ )); do
    if [ $key == "${keys[$x]}" ]; then
      echo -n "${values[$x]}"
      local value="${values[$x]}"
      break
    fi
  done
  if [ -z $value ]; then
    echo $key
  fi
}

# If line contains emoji, turn line into array,
# else just add whole line to emojified.
# Then check each word against regex,
# if it doesn't match just add word to emojified.
# Returns emojified line
emojify () {
  local line=$1
  local emojified=$'\b'

  if [[ $line =~ $regex ]]; then
    IFS=' ' read -a line_arr <<< $line

    for word in "${line_arr[@]}"; do
      if [[ $word =~ $regex ]]; then
        emojified+=$(to_emoji $word)
      else
        emojified+=$word
      fi
      emojified+=' '
    done

  else
    local emojified=$line
  fi

  echo $emojified | tr -d '\b'
}

# Emoji in something like a hash or associative array
# As there is no such thing in Bash below version 4
# Taken from: https://github.com/github/gemoji
typeset -a keys
typeset -a values
keys[0]=':smile:'; values[0]='😄'
keys[1]=':smiley:'; values[1]='😃'
keys[2]=':grinning:'; values[2]='😀'
keys[3]=':blush:'; values[3]='😊'
keys[4]=':relaxed:'; values[4]='☺️'
keys[5]=':wink:'; values[5]='😉'
keys[6]=':heart_eyes:'; values[6]='😍'
keys[7]=':kissing_heart:'; values[7]='😘'
keys[8]=':kissing_closed_eyes:'; values[8]='😚'
keys[9]=':kissing:'; values[9]='😗'
keys[10]=':kissing_smiling_eyes:'; values[10]='😙'
keys[11]=':stuck_out_tongue_winking_eye:'; values[11]='😜'
keys[12]=':stuck_out_tongue_closed_eyes:'; values[12]='😝'
keys[13]=':stuck_out_tongue:'; values[13]='😛'
keys[14]=':flushed:'; values[14]='😳'
keys[15]=':grin:'; values[15]='😁'
keys[16]=':pensive:'; values[16]='😔'
keys[17]=':relieved:'; values[17]='😌'
keys[18]=':unamused:'; values[18]='😒'
keys[19]=':disappointed:'; values[19]='😞'
keys[20]=':persevere:'; values[20]='😣'
keys[21]=':cry:'; values[21]='😢'
keys[22]=':joy:'; values[22]='😂'
keys[23]=':sob:'; values[23]='😭'
keys[24]=':sleepy:'; values[24]='😪'
keys[25]=':disappointed_relieved:'; values[25]='😥'
keys[26]=':cold_sweat:'; values[26]='😰'
keys[27]=':sweat_smile:'; values[27]='😅'
keys[28]=':sweat:'; values[28]='😓'
keys[29]=':weary:'; values[29]='😩'
keys[30]=':tired_face:'; values[30]='😫'
keys[31]=':fearful:'; values[31]='😨'
keys[32]=':scream:'; values[32]='😱'
keys[33]=':angry:'; values[33]='😠'
keys[34]=':rage:'; values[34]='😡'
keys[35]=':triumph:'; values[35]='😤'
keys[36]=':confounded:'; values[36]='😖'
keys[37]=':laughing:'; values[37]='😆'
keys[38]=':satisfied:'; values[38]='😆'
keys[39]=':yum:'; values[39]='😋'
keys[40]=':mask:'; values[40]='😷'
keys[41]=':sunglasses:'; values[41]='😎'
keys[42]=':sleeping:'; values[42]='😴'
keys[43]=':dizzy_face:'; values[43]='😵'
keys[44]=':astonished:'; values[44]='😲'
keys[45]=':worried:'; values[45]='😟'
keys[46]=':frowning:'; values[46]='😦'
keys[47]=':anguished:'; values[47]='😧'
keys[48]=':smiling_imp:'; values[48]='😈'
keys[49]=':imp:'; values[49]='👿'
keys[50]=':open_mouth:'; values[50]='😮'
keys[51]=':grimacing:'; values[51]='😬'
keys[52]=':neutral_face:'; values[52]='😐'
keys[53]=':confused:'; values[53]='😕'
keys[54]=':hushed:'; values[54]='😯'
keys[55]=':no_mouth:'; values[55]='😶'
keys[56]=':innocent:'; values[56]='😇'
keys[57]=':smirk:'; values[57]='😏'
keys[58]=':expressionless:'; values[58]='😑'
keys[59]=':man_with_gua_pi_mao:'; values[59]='👲'
keys[60]=':man_with_turban:'; values[60]='👳'
keys[61]=':cop:'; values[61]='👮'
keys[62]=':construction_worker:'; values[62]='👷'
keys[63]=':guardsman:'; values[63]='💂'
keys[64]=':baby:'; values[64]='👶'
keys[65]=':boy:'; values[65]='👦'
keys[66]=':girl:'; values[66]='👧'
keys[67]=':man:'; values[67]='👨'
keys[68]=':woman:'; values[68]='👩'
keys[69]=':older_man:'; values[69]='👴'
keys[70]=':older_woman:'; values[70]='👵'
keys[71]=':person_with_blond_hair:'; values[71]='👱'
keys[72]=':angel:'; values[72]='👼'
keys[73]=':princess:'; values[73]='👸'
keys[74]=':smiley_cat:'; values[74]='😺'
keys[75]=':smile_cat:'; values[75]='😸'
keys[76]=':heart_eyes_cat:'; values[76]='😻'
keys[77]=':kissing_cat:'; values[77]='😽'
keys[78]=':smirk_cat:'; values[78]='😼'
keys[79]=':scream_cat:'; values[79]='🙀'
keys[80]=':crying_cat_face:'; values[80]='😿'
keys[81]=':joy_cat:'; values[81]='😹'
keys[82]=':pouting_cat:'; values[82]='😾'
keys[83]=':japanese_ogre:'; values[83]='👹'
keys[84]=':japanese_goblin:'; values[84]='👺'
keys[85]=':see_no_evil:'; values[85]='🙈'
keys[86]=':hear_no_evil:'; values[86]='🙉'
keys[87]=':speak_no_evil:'; values[87]='🙊'
keys[88]=':skull:'; values[88]='💀'
keys[89]=':alien:'; values[89]='👽'
keys[90]=':hankey:'; values[90]='💩'
keys[91]=':poop:'; values[91]='💩'
keys[92]=':shit:'; values[92]='💩'
keys[93]=':fire:'; values[93]='🔥'
keys[94]=':sparkles:'; values[94]='✨'
keys[95]=':star2:'; values[95]='🌟'
keys[96]=':dizzy:'; values[96]='💫'
keys[97]=':boom:'; values[97]='💥'
keys[98]=':collision:'; values[98]='💥'
keys[99]=':anger:'; values[99]='💢'
keys[100]=':sweat_drops:'; values[100]='💦'
keys[101]=':droplet:'; values[101]='💧'
keys[102]=':zzz:'; values[102]='💤'
keys[103]=':dash:'; values[103]='💨'
keys[104]=':ear:'; values[104]='👂'
keys[105]=':eyes:'; values[105]='👀'
keys[106]=':nose:'; values[106]='👃'
keys[107]=':tongue:'; values[107]='👅'
keys[108]=':lips:'; values[108]='👄'
keys[109]=':+1:'; values[109]='👍'
keys[110]=':thumbsup:'; values[110]='👍'
keys[111]=':-1:'; values[111]='👎'
keys[112]=':thumbsdown:'; values[112]='👎'
keys[113]=':ok_hand:'; values[113]='👌'
keys[114]=':facepunch:'; values[114]='👊'
keys[115]=':punch:'; values[115]='👊'
keys[116]=':fist:'; values[116]='✊'
keys[117]=':v:'; values[117]='✌️'
keys[118]=':wave:'; values[118]='👋'
keys[119]=':hand:'; values[119]='✋'
keys[120]=':raised_hand:'; values[120]='✋'
keys[121]=':open_hands:'; values[121]='👐'
keys[122]=':point_up_2:'; values[122]='👆'
keys[123]=':point_down:'; values[123]='👇'
keys[124]=':point_right:'; values[124]='👉'
keys[125]=':point_left:'; values[125]='👈'
keys[126]=':raised_hands:'; values[126]='🙌'
keys[127]=':pray:'; values[127]='🙏'
keys[128]=':point_up:'; values[128]='☝️'
keys[129]=':clap:'; values[129]='👏'
keys[130]=':muscle:'; values[130]='💪'
keys[131]=':walking:'; values[131]='🚶'
keys[132]=':runner:'; values[132]='🏃'
keys[133]=':running:'; values[133]='🏃'
keys[134]=':dancer:'; values[134]='💃'
keys[135]=':couple:'; values[135]='👫'
keys[136]=':family:'; values[136]='👪'
keys[137]=':two_men_holding_hands:'; values[137]='👬'
keys[138]=':two_women_holding_hands:'; values[138]='👭'
keys[139]=':couplekiss:'; values[139]='💏'
keys[140]=':couple_with_heart:'; values[140]='💑'
keys[141]=':dancers:'; values[141]='👯'
keys[142]=':ok_woman:'; values[142]='🙆'
keys[143]=':no_good:'; values[143]='🙅'
keys[144]=':information_desk_person:'; values[144]='💁'
keys[145]=':raising_hand:'; values[145]='🙋'
keys[146]=':massage:'; values[146]='💆'
keys[147]=':haircut:'; values[147]='💇'
keys[148]=':nail_care:'; values[148]='💅'
keys[149]=':bride_with_veil:'; values[149]='👰'
keys[150]=':person_with_pouting_face:'; values[150]='🙎'
keys[151]=':person_frowning:'; values[151]='🙍'
keys[152]=':bow:'; values[152]='🙇'
keys[153]=':tophat:'; values[153]='🎩'
keys[154]=':crown:'; values[154]='👑'
keys[155]=':womans_hat:'; values[155]='👒'
keys[156]=':athletic_shoe:'; values[156]='👟'
keys[157]=':mans_shoe:'; values[157]='👞'
keys[158]=':shoe:'; values[158]='👞'
keys[159]=':sandal:'; values[159]='👡'
keys[160]=':high_heel:'; values[160]='👠'
keys[161]=':boot:'; values[161]='👢'
keys[162]=':shirt:'; values[162]='👕'
keys[163]=':tshirt:'; values[163]='👕'
keys[164]=':necktie:'; values[164]='👔'
keys[165]=':womans_clothes:'; values[165]='👚'
keys[166]=':dress:'; values[166]='👗'
keys[167]=':running_shirt_with_sash:'; values[167]='🎽'
keys[168]=':jeans:'; values[168]='👖'
keys[169]=':kimono:'; values[169]='👘'
keys[170]=':bikini:'; values[170]='👙'
keys[171]=':briefcase:'; values[171]='💼'
keys[172]=':handbag:'; values[172]='👜'
keys[173]=':pouch:'; values[173]='👝'
keys[174]=':purse:'; values[174]='👛'
keys[175]=':eyeglasses:'; values[175]='👓'
keys[176]=':ribbon:'; values[176]='🎀'
keys[177]=':closed_umbrella:'; values[177]='🌂'
keys[178]=':lipstick:'; values[178]='💄'
keys[179]=':yellow_heart:'; values[179]='💛'
keys[180]=':blue_heart:'; values[180]='💙'
keys[181]=':purple_heart:'; values[181]='💜'
keys[182]=':green_heart:'; values[182]='💚'
keys[183]=':heart:'; values[183]='❤️'
keys[184]=':broken_heart:'; values[184]='💔'
keys[185]=':heartpulse:'; values[185]='💗'
keys[186]=':heartbeat:'; values[186]='💓'
keys[187]=':two_hearts:'; values[187]='💕'
keys[188]=':sparkling_heart:'; values[188]='💖'
keys[189]=':revolving_hearts:'; values[189]='💞'
keys[190]=':cupid:'; values[190]='💘'
keys[191]=':love_letter:'; values[191]='💌'
keys[192]=':kiss:'; values[192]='💋'
keys[193]=':ring:'; values[193]='💍'
keys[194]=':gem:'; values[194]='💎'
keys[195]=':bust_in_silhouette:'; values[195]='👤'
keys[196]=':busts_in_silhouette:'; values[196]='👥'
keys[197]=':speech_balloon:'; values[197]='💬'
keys[198]=':footprints:'; values[198]='👣'
keys[199]=':thought_balloon:'; values[199]='💭'
keys[200]=':dog:'; values[200]='🐶'
keys[201]=':wolf:'; values[201]='🐺'
keys[202]=':cat:'; values[202]='🐱'
keys[203]=':mouse:'; values[203]='🐭'
keys[204]=':hamster:'; values[204]='🐹'
keys[205]=':rabbit:'; values[205]='🐰'
keys[206]=':frog:'; values[206]='🐸'
keys[207]=':tiger:'; values[207]='🐯'
keys[208]=':koala:'; values[208]='🐨'
keys[209]=':bear:'; values[209]='🐻'
keys[210]=':pig:'; values[210]='🐷'
keys[211]=':pig_nose:'; values[211]='🐽'
keys[212]=':cow:'; values[212]='🐮'
keys[213]=':boar:'; values[213]='🐗'
keys[214]=':monkey_face:'; values[214]='🐵'
keys[215]=':monkey:'; values[215]='🐒'
keys[216]=':horse:'; values[216]='🐴'
keys[217]=':sheep:'; values[217]='🐑'
keys[218]=':elephant:'; values[218]='🐘'
keys[219]=':panda_face:'; values[219]='🐼'
keys[220]=':penguin:'; values[220]='🐧'
keys[221]=':bird:'; values[221]='🐦'
keys[222]=':baby_chick:'; values[222]='🐤'
keys[223]=':hatched_chick:'; values[223]='🐥'
keys[224]=':hatching_chick:'; values[224]='🐣'
keys[225]=':chicken:'; values[225]='🐔'
keys[226]=':snake:'; values[226]='🐍'
keys[227]=':turtle:'; values[227]='🐢'
keys[228]=':bug:'; values[228]='🐛'
keys[229]=':bee:'; values[229]='🐝'
keys[230]=':honeybee:'; values[230]='🐝'
keys[231]=':ant:'; values[231]='🐜'
keys[232]=':beetle:'; values[232]='🐞'
keys[233]=':snail:'; values[233]='🐌'
keys[234]=':octopus:'; values[234]='🐙'
keys[235]=':shell:'; values[235]='🐚'
keys[236]=':tropical_fish:'; values[236]='🐠'
keys[237]=':fish:'; values[237]='🐟'
keys[238]=':dolphin:'; values[238]='🐬'
keys[239]=':flipper:'; values[239]='🐬'
keys[240]=':whale:'; values[240]='🐳'
keys[241]=':whale2:'; values[241]='🐋'
keys[242]=':cow2:'; values[242]='🐄'
keys[243]=':ram:'; values[243]='🐏'
keys[244]=':rat:'; values[244]='🐀'
keys[245]=':water_buffalo:'; values[245]='🐃'
keys[246]=':tiger2:'; values[246]='🐅'
keys[247]=':rabbit2:'; values[247]='🐇'
keys[248]=':dragon:'; values[248]='🐉'
keys[249]=':racehorse:'; values[249]='🐎'
keys[250]=':goat:'; values[250]='🐐'
keys[251]=':rooster:'; values[251]='🐓'
keys[252]=':dog2:'; values[252]='🐕'
keys[253]=':pig2:'; values[253]='🐖'
keys[254]=':mouse2:'; values[254]='🐁'
keys[255]=':ox:'; values[255]='🐂'
keys[256]=':dragon_face:'; values[256]='🐲'
keys[257]=':blowfish:'; values[257]='🐡'
keys[258]=':crocodile:'; values[258]='🐊'
keys[259]=':camel:'; values[259]='🐫'
keys[260]=':dromedary_camel:'; values[260]='🐪'
keys[261]=':leopard:'; values[261]='🐆'
keys[262]=':cat2:'; values[262]='🐈'
keys[263]=':poodle:'; values[263]='🐩'
keys[264]=':feet:'; values[264]='🐾'
keys[265]=':paw_prints:'; values[265]='🐾'
keys[266]=':bouquet:'; values[266]='💐'
keys[267]=':cherry_blossom:'; values[267]='🌸'
keys[268]=':tulip:'; values[268]='🌷'
keys[269]=':four_leaf_clover:'; values[269]='🍀'
keys[270]=':rose:'; values[270]='🌹'
keys[271]=':sunflower:'; values[271]='🌻'
keys[272]=':hibiscus:'; values[272]='🌺'
keys[273]=':maple_leaf:'; values[273]='🍁'
keys[274]=':leaves:'; values[274]='🍃'
keys[275]=':fallen_leaf:'; values[275]='🍂'
keys[276]=':herb:'; values[276]='🌿'
keys[277]=':ear_of_rice:'; values[277]='🌾'
keys[278]=':mushroom:'; values[278]='🍄'
keys[279]=':cactus:'; values[279]='🌵'
keys[280]=':palm_tree:'; values[280]='🌴'
keys[281]=':evergreen_tree:'; values[281]='🌲'
keys[282]=':deciduous_tree:'; values[282]='🌳'
keys[283]=':chestnut:'; values[283]='🌰'
keys[284]=':seedling:'; values[284]='🌱'
keys[285]=':blossom:'; values[285]='🌼'
keys[286]=':globe_with_meridians:'; values[286]='🌐'
keys[287]=':sun_with_face:'; values[287]='🌞'
keys[288]=':full_moon_with_face:'; values[288]='🌝'
keys[289]=':new_moon_with_face:'; values[289]='🌚'
keys[290]=':new_moon:'; values[290]='🌑'
keys[291]=':waxing_crescent_moon:'; values[291]='🌒'
keys[292]=':first_quarter_moon:'; values[292]='🌓'
keys[293]=':moon:'; values[293]='🌔'
keys[294]=':waxing_gibbous_moon:'; values[294]='🌔'
keys[295]=':full_moon:'; values[295]='🌕'
keys[296]=':waning_gibbous_moon:'; values[296]='🌖'
keys[297]=':last_quarter_moon:'; values[297]='🌗'
keys[298]=':waning_crescent_moon:'; values[298]='🌘'
keys[299]=':last_quarter_moon_with_face:'; values[299]='🌜'
keys[300]=':first_quarter_moon_with_face:'; values[300]='🌛'
keys[301]=':crescent_moon:'; values[301]='🌙'
keys[302]=':earth_africa:'; values[302]='🌍'
keys[303]=':earth_americas:'; values[303]='🌎'
keys[304]=':earth_asia:'; values[304]='🌏'
keys[305]=':volcano:'; values[305]='🌋'
keys[306]=':milky_way:'; values[306]='🌌'
keys[307]=':stars:'; values[307]='🌠'
keys[308]=':star:'; values[308]='⭐'
keys[309]=':sunny:'; values[309]='☀️'
keys[310]=':partly_sunny:'; values[310]='⛅'
keys[311]=':cloud:'; values[311]='☁️'
keys[312]=':zap:'; values[312]='⚡'
keys[313]=':umbrella:'; values[313]='☔'
keys[314]=':snowflake:'; values[314]='❄️'
keys[315]=':snowman:'; values[315]='⛄'
keys[316]=':cyclone:'; values[316]='🌀'
keys[317]=':foggy:'; values[317]='🌁'
keys[318]=':rainbow:'; values[318]='🌈'
keys[319]=':ocean:'; values[319]='🌊'
keys[320]=':bamboo:'; values[320]='🎍'
keys[321]=':gift_heart:'; values[321]='💝'
keys[322]=':dolls:'; values[322]='🎎'
keys[323]=':school_satchel:'; values[323]='🎒'
keys[324]=':mortar_board:'; values[324]='🎓'
keys[325]=':flags:'; values[325]='🎏'
keys[326]=':fireworks:'; values[326]='🎆'
keys[327]=':sparkler:'; values[327]='🎇'
keys[328]=':wind_chime:'; values[328]='🎐'
keys[329]=':rice_scene:'; values[329]='🎑'
keys[330]=':jack_o_lantern:'; values[330]='🎃'
keys[331]=':ghost:'; values[331]='👻'
keys[332]=':santa:'; values[332]='🎅'
keys[333]=':christmas_tree:'; values[333]='🎄'
keys[334]=':gift:'; values[334]='🎁'
keys[335]=':tanabata_tree:'; values[335]='🎋'
keys[336]=':tada:'; values[336]='🎉'
keys[337]=':confetti_ball:'; values[337]='🎊'
keys[338]=':balloon:'; values[338]='🎈'
keys[339]=':crossed_flags:'; values[339]='🎌'
keys[340]=':crystal_ball:'; values[340]='🔮'
keys[341]=':movie_camera:'; values[341]='🎥'
keys[342]=':camera:'; values[342]='📷'
keys[343]=':video_camera:'; values[343]='📹'
keys[344]=':vhs:'; values[344]='📼'
keys[345]=':cd:'; values[345]='💿'
keys[346]=':dvd:'; values[346]='📀'
keys[347]=':minidisc:'; values[347]='💽'
keys[348]=':floppy_disk:'; values[348]='💾'
keys[349]=':computer:'; values[349]='💻'
keys[350]=':iphone:'; values[350]='📱'
keys[351]=':phone:'; values[351]='☎️'
keys[352]=':telephone:'; values[352]='☎️'
keys[353]=':telephone_receiver:'; values[353]='📞'
keys[354]=':pager:'; values[354]='📟'
keys[355]=':fax:'; values[355]='📠'
keys[356]=':satellite:'; values[356]='📡'
keys[357]=':tv:'; values[357]='📺'
keys[358]=':radio:'; values[358]='📻'
keys[359]=':loud_sound:'; values[359]='🔊'
keys[360]=':sound:'; values[360]='🔉'
keys[361]=':speaker:'; values[361]='🔈'
keys[362]=':mute:'; values[362]='🔇'
keys[363]=':bell:'; values[363]='🔔'
keys[364]=':no_bell:'; values[364]='🔕'
keys[365]=':loudspeaker:'; values[365]='📢'
keys[366]=':mega:'; values[366]='📣'
keys[367]=':hourglass_flowing_sand:'; values[367]='⏳'
keys[368]=':hourglass:'; values[368]='⌛'
keys[369]=':alarm_clock:'; values[369]='⏰'
keys[370]=':watch:'; values[370]='⌚'
keys[371]=':unlock:'; values[371]='🔓'
keys[372]=':lock:'; values[372]='🔒'
keys[373]=':lock_with_ink_pen:'; values[373]='🔏'
keys[374]=':closed_lock_with_key:'; values[374]='🔐'
keys[375]=':key:'; values[375]='🔑'
keys[376]=':mag_right:'; values[376]='🔎'
keys[377]=':bulb:'; values[377]='💡'
keys[378]=':flashlight:'; values[378]='🔦'
keys[379]=':high_brightness:'; values[379]='🔆'
keys[380]=':low_brightness:'; values[380]='🔅'
keys[381]=':electric_plug:'; values[381]='🔌'
keys[382]=':battery:'; values[382]='🔋'
keys[383]=':mag:'; values[383]='🔍'
keys[384]=':bathtub:'; values[384]='🛁'
keys[385]=':bath:'; values[385]='🛀'
keys[386]=':shower:'; values[386]='🚿'
keys[387]=':toilet:'; values[387]='🚽'
keys[388]=':wrench:'; values[388]='🔧'
keys[389]=':nut_and_bolt:'; values[389]='🔩'
keys[390]=':hammer:'; values[390]='🔨'
keys[391]=':door:'; values[391]='🚪'
keys[392]=':smoking:'; values[392]='🚬'
keys[393]=':bomb:'; values[393]='💣'
keys[394]=':gun:'; values[394]='🔫'
keys[395]=':hocho:'; values[395]='🔪'
keys[396]=':knife:'; values[396]='🔪'
keys[397]=':pill:'; values[397]='💊'
keys[398]=':syringe:'; values[398]='💉'
keys[399]=':moneybag:'; values[399]='💰'
keys[400]=':yen:'; values[400]='💴'
keys[401]=':dollar:'; values[401]='💵'
keys[402]=':pound:'; values[402]='💷'
keys[403]=':euro:'; values[403]='💶'
keys[404]=':credit_card:'; values[404]='💳'
keys[405]=':money_with_wings:'; values[405]='💸'
keys[406]=':calling:'; values[406]='📲'
keys[407]=':e-mail:'; values[407]='📧'
keys[408]=':inbox_tray:'; values[408]='📥'
keys[409]=':outbox_tray:'; values[409]='📤'
keys[410]=':email:'; values[410]='✉️'
keys[411]=':envelope:'; values[411]='✉️'
keys[412]=':envelope_with_arrow:'; values[412]='📩'
keys[413]=':incoming_envelope:'; values[413]='📨'
keys[414]=':postal_horn:'; values[414]='📯'
keys[415]=':mailbox:'; values[415]='📫'
keys[416]=':mailbox_closed:'; values[416]='📪'
keys[417]=':mailbox_with_mail:'; values[417]='📬'
keys[418]=':mailbox_with_no_mail:'; values[418]='📭'
keys[419]=':postbox:'; values[419]='📮'
keys[420]=':package:'; values[420]='📦'
keys[421]=':memo:'; values[421]='📝'
keys[422]=':pencil:'; values[422]='📝'
keys[423]=':page_facing_up:'; values[423]='📄'
keys[424]=':page_with_curl:'; values[424]='📃'
keys[425]=':bookmark_tabs:'; values[425]='📑'
keys[426]=':bar_chart:'; values[426]='📊'
keys[427]=':chart_with_upwards_trend:'; values[427]='📈'
keys[428]=':chart_with_downwards_trend:'; values[428]='📉'
keys[429]=':scroll:'; values[429]='📜'
keys[430]=':clipboard:'; values[430]='📋'
keys[431]=':date:'; values[431]='📅'
keys[432]=':calendar:'; values[432]='📆'
keys[433]=':card_index:'; values[433]='📇'
keys[434]=':file_folder:'; values[434]='📁'
keys[435]=':open_file_folder:'; values[435]='📂'
keys[436]=':scissors:'; values[436]='✂️'
keys[437]=':pushpin:'; values[437]='📌'
keys[438]=':paperclip:'; values[438]='📎'
keys[439]=':black_nib:'; values[439]='✒️'
keys[440]=':pencil2:'; values[440]='✏️'
keys[441]=':straight_ruler:'; values[441]='📏'
keys[442]=':triangular_ruler:'; values[442]='📐'
keys[443]=':closed_book:'; values[443]='📕'
keys[444]=':green_book:'; values[444]='📗'
keys[445]=':blue_book:'; values[445]='📘'
keys[446]=':orange_book:'; values[446]='📙'
keys[447]=':notebook:'; values[447]='📓'
keys[448]=':notebook_with_decorative_cover:'; values[448]='📔'
keys[449]=':ledger:'; values[449]='📒'
keys[450]=':books:'; values[450]='📚'
keys[451]=':book:'; values[451]='📖'
keys[452]=':open_book:'; values[452]='📖'
keys[453]=':bookmark:'; values[453]='🔖'
keys[454]=':name_badge:'; values[454]='📛'
keys[455]=':microscope:'; values[455]='🔬'
keys[456]=':telescope:'; values[456]='🔭'
keys[457]=':newspaper:'; values[457]='📰'
keys[458]=':art:'; values[458]='🎨'
keys[459]=':clapper:'; values[459]='🎬'
keys[460]=':microphone:'; values[460]='🎤'
keys[461]=':headphones:'; values[461]='🎧'
keys[462]=':musical_score:'; values[462]='🎼'
keys[463]=':musical_note:'; values[463]='🎵'
keys[464]=':notes:'; values[464]='🎶'
keys[465]=':musical_keyboard:'; values[465]='🎹'
keys[466]=':violin:'; values[466]='🎻'
keys[467]=':trumpet:'; values[467]='🎺'
keys[468]=':saxophone:'; values[468]='🎷'
keys[469]=':guitar:'; values[469]='🎸'
keys[470]=':space_invader:'; values[470]='👾'
keys[471]=':video_game:'; values[471]='🎮'
keys[472]=':black_joker:'; values[472]='🃏'
keys[473]=':flower_playing_cards:'; values[473]='🎴'
keys[474]=':mahjong:'; values[474]='🀄'
keys[475]=':game_die:'; values[475]='🎲'
keys[476]=':dart:'; values[476]='🎯'
keys[477]=':football:'; values[477]='🏈'
keys[478]=':basketball:'; values[478]='🏀'
keys[479]=':soccer:'; values[479]='⚽'
keys[480]=':baseball:'; values[480]='⚾️'
keys[481]=':tennis:'; values[481]='🎾'
keys[482]=':8ball:'; values[482]='🎱'
keys[483]=':rugby_football:'; values[483]='🏉'
keys[484]=':bowling:'; values[484]='🎳'
keys[485]=':golf:'; values[485]='⛳'
keys[486]=':mountain_bicyclist:'; values[486]='🚵'
keys[487]=':bicyclist:'; values[487]='🚴'
keys[488]=':checkered_flag:'; values[488]='🏁'
keys[489]=':horse_racing:'; values[489]='🏇'
keys[490]=':trophy:'; values[490]='🏆'
keys[491]=':ski:'; values[491]='🎿'
keys[492]=':snowboarder:'; values[492]='🏂'
keys[493]=':swimmer:'; values[493]='🏊'
keys[494]=':surfer:'; values[494]='🏄'
keys[495]=':fishing_pole_and_fish:'; values[495]='🎣'
keys[496]=':coffee:'; values[496]='☕'
keys[497]=':tea:'; values[497]='🍵'
keys[498]=':sake:'; values[498]='🍶'
keys[499]=':baby_bottle:'; values[499]='🍼'
keys[500]=':beer:'; values[500]='🍺'
keys[501]=':beers:'; values[501]='🍻'
keys[502]=':cocktail:'; values[502]='🍸'
keys[503]=':tropical_drink:'; values[503]='🍹'
keys[504]=':wine_glass:'; values[504]='🍷'
keys[505]=':fork_and_knife:'; values[505]='🍴'
keys[506]=':pizza:'; values[506]='🍕'
keys[507]=':hamburger:'; values[507]='🍔'
keys[508]=':fries:'; values[508]='🍟'
keys[509]=':poultry_leg:'; values[509]='🍗'
keys[510]=':meat_on_bone:'; values[510]='🍖'
keys[511]=':spaghetti:'; values[511]='🍝'
keys[512]=':curry:'; values[512]='🍛'
keys[513]=':fried_shrimp:'; values[513]='🍤'
keys[514]=':bento:'; values[514]='🍱'
keys[515]=':sushi:'; values[515]='🍣'
keys[516]=':fish_cake:'; values[516]='🍥'
keys[517]=':rice_ball:'; values[517]='🍙'
keys[518]=':rice_cracker:'; values[518]='🍘'
keys[519]=':rice:'; values[519]='🍚'
keys[520]=':ramen:'; values[520]='🍜'
keys[521]=':stew:'; values[521]='🍲'
keys[522]=':oden:'; values[522]='🍢'
keys[523]=':dango:'; values[523]='🍡'
keys[524]=':egg:'; values[524]='🍳'
keys[525]=':bread:'; values[525]='🍞'
keys[526]=':doughnut:'; values[526]='🍩'
keys[527]=':custard:'; values[527]='🍮'
keys[528]=':icecream:'; values[528]='🍦'
keys[529]=':ice_cream:'; values[529]='🍨'
keys[530]=':shaved_ice:'; values[530]='🍧'
keys[531]=':birthday:'; values[531]='🎂'
keys[532]=':cake:'; values[532]='🍰'
keys[533]=':cookie:'; values[533]='🍪'
keys[534]=':chocolate_bar:'; values[534]='🍫'
keys[535]=':candy:'; values[535]='🍬'
keys[536]=':lollipop:'; values[536]='🍭'
keys[537]=':honey_pot:'; values[537]='🍯'
keys[538]=':apple:'; values[538]='🍎'
keys[539]=':green_apple:'; values[539]='🍏'
keys[540]=':tangerine:'; values[540]='🍊'
keys[541]=':lemon:'; values[541]='🍋'
keys[542]=':cherries:'; values[542]='🍒'
keys[543]=':grapes:'; values[543]='🍇'
keys[544]=':watermelon:'; values[544]='🍉'
keys[545]=':strawberry:'; values[545]='🍓'
keys[546]=':peach:'; values[546]='🍑'
keys[547]=':melon:'; values[547]='🍈'
keys[548]=':banana:'; values[548]='🍌'
keys[549]=':pear:'; values[549]='🍐'
keys[550]=':pineapple:'; values[550]='🍍'
keys[551]=':sweet_potato:'; values[551]='🍠'
keys[552]=':eggplant:'; values[552]='🍆'
keys[553]=':tomato:'; values[553]='🍅'
keys[554]=':corn:'; values[554]='🌽'
keys[555]=':house:'; values[555]='🏠'
keys[556]=':house_with_garden:'; values[556]='🏡'
keys[557]=':school:'; values[557]='🏫'
keys[558]=':office:'; values[558]='🏢'
keys[559]=':post_office:'; values[559]='🏣'
keys[560]=':hospital:'; values[560]='🏥'
keys[561]=':bank:'; values[561]='🏦'
keys[562]=':convenience_store:'; values[562]='🏪'
keys[563]=':love_hotel:'; values[563]='🏩'
keys[564]=':hotel:'; values[564]='🏨'
keys[565]=':wedding:'; values[565]='💒'
keys[566]=':church:'; values[566]='⛪'
keys[567]=':department_store:'; values[567]='🏬'
keys[568]=':european_post_office:'; values[568]='🏤'
keys[569]=':city_sunrise:'; values[569]='🌇'
keys[570]=':city_sunset:'; values[570]='🌆'
keys[571]=':japanese_castle:'; values[571]='🏯'
keys[572]=':european_castle:'; values[572]='🏰'
keys[573]=':tent:'; values[573]='⛺'
keys[574]=':factory:'; values[574]='🏭'
keys[575]=':tokyo_tower:'; values[575]='🗼'
keys[576]=':japan:'; values[576]='🗾'
keys[577]=':mount_fuji:'; values[577]='🗻'
keys[578]=':sunrise_over_mountains:'; values[578]='🌄'
keys[579]=':sunrise:'; values[579]='🌅'
keys[580]=':night_with_stars:'; values[580]='🌃'
keys[581]=':statue_of_liberty:'; values[581]='🗽'
keys[582]=':bridge_at_night:'; values[582]='🌉'
keys[583]=':carousel_horse:'; values[583]='🎠'
keys[584]=':ferris_wheel:'; values[584]='🎡'
keys[585]=':fountain:'; values[585]='⛲'
keys[586]=':roller_coaster:'; values[586]='🎢'
keys[587]=':ship:'; values[587]='🚢'
keys[588]=':boat:'; values[588]='⛵'
keys[589]=':sailboat:'; values[589]='⛵'
keys[590]=':speedboat:'; values[590]='🚤'
keys[591]=':rowboat:'; values[591]='🚣'
keys[592]=':anchor:'; values[592]='⚓'
keys[593]=':rocket:'; values[593]='🚀'
keys[594]=':airplane:'; values[594]='✈️'
keys[595]=':seat:'; values[595]='💺'
keys[596]=':helicopter:'; values[596]='🚁'
keys[597]=':steam_locomotive:'; values[597]='🚂'
keys[598]=':tram:'; values[598]='🚊'
keys[599]=':station:'; values[599]='🚉'
keys[600]=':mountain_railway:'; values[600]='🚞'
keys[601]=':train2:'; values[601]='🚆'
keys[602]=':bullettrain_side:'; values[602]='🚄'
keys[603]=':bullettrain_front:'; values[603]='🚅'
keys[604]=':light_rail:'; values[604]='🚈'
keys[605]=':metro:'; values[605]='🚇'
keys[606]=':monorail:'; values[606]='🚝'
keys[607]=':train:'; values[607]='🚋'
keys[608]=':railway_car:'; values[608]='🚃'
keys[609]=':trolleybus:'; values[609]='🚎'
keys[610]=':bus:'; values[610]='🚌'
keys[611]=':oncoming_bus:'; values[611]='🚍'
keys[612]=':blue_car:'; values[612]='🚙'
keys[613]=':oncoming_automobile:'; values[613]='🚘'
keys[614]=':car:'; values[614]='🚗'
keys[615]=':red_car:'; values[615]='🚗'
keys[616]=':taxi:'; values[616]='🚕'
keys[617]=':oncoming_taxi:'; values[617]='🚖'
keys[618]=':articulated_lorry:'; values[618]='🚛'
keys[619]=':truck:'; values[619]='🚚'
keys[620]=':rotating_light:'; values[620]='🚨'
keys[621]=':police_car:'; values[621]='🚓'
keys[622]=':oncoming_police_car:'; values[622]='🚔'
keys[623]=':fire_engine:'; values[623]='🚒'
keys[624]=':ambulance:'; values[624]='🚑'
keys[625]=':minibus:'; values[625]='🚐'
keys[626]=':bike:'; values[626]='🚲'
keys[627]=':aerial_tramway:'; values[627]='🚡'
keys[628]=':suspension_railway:'; values[628]='🚟'
keys[629]=':mountain_cableway:'; values[629]='🚠'
keys[630]=':tractor:'; values[630]='🚜'
keys[631]=':barber:'; values[631]='💈'
keys[632]=':busstop:'; values[632]='🚏'
keys[633]=':ticket:'; values[633]='🎫'
keys[634]=':vertical_traffic_light:'; values[634]='🚦'
keys[635]=':traffic_light:'; values[635]='🚥'
keys[636]=':warning:'; values[636]='⚠️'
keys[637]=':construction:'; values[637]='🚧'
keys[638]=':beginner:'; values[638]='🔰'
keys[639]=':fuelpump:'; values[639]='⛽'
keys[640]=':izakaya_lantern:'; values[640]='🏮'
keys[641]=':lantern:'; values[641]='🏮'
keys[642]=':slot_machine:'; values[642]='🎰'
keys[643]=':hotsprings:'; values[643]='♨️'
keys[644]=':moyai:'; values[644]='🗿'
keys[645]=':circus_tent:'; values[645]='🎪'
keys[646]=':performing_arts:'; values[646]='🎭'
keys[647]=':round_pushpin:'; values[647]='📍'
keys[648]=':triangular_flag_on_post:'; values[648]='🚩'
keys[649]=':jp:'; values[649]='🇯🇵'
keys[650]=':kr:'; values[650]='🇰🇷'
keys[651]=':de:'; values[651]='🇩🇪'
keys[652]=':cn:'; values[652]='🇨🇳'
keys[653]=':us:'; values[653]='🇺🇸'
keys[654]=':fr:'; values[654]='🇫🇷'
keys[655]=':es:'; values[655]='🇪🇸'
keys[656]=':it:'; values[656]='🇮🇹'
keys[657]=':ru:'; values[657]='🇷🇺'
keys[658]=':gb:'; values[658]='🇬🇧'
keys[659]=':uk:'; values[659]='🇬🇧'
keys[660]=':one:'; values[660]='1️⃣'
keys[661]=':two:'; values[661]='2️⃣'
keys[662]=':three:'; values[662]='3️⃣'
keys[663]=':four:'; values[663]='4️⃣'
keys[664]=':five:'; values[664]='5️⃣'
keys[665]=':six:'; values[665]='6️⃣'
keys[666]=':seven:'; values[666]='7️⃣'
keys[667]=':eight:'; values[667]='8️⃣'
keys[668]=':nine:'; values[668]='9️⃣'
keys[669]=':zero:'; values[669]='0️⃣'
keys[670]=':keycap_ten:'; values[670]='🔟'
keys[671]=':1234:'; values[671]='🔢'
keys[672]=':hash:'; values[672]='#️⃣'
keys[673]=':symbols:'; values[673]='🔣'
keys[674]=':arrow_up:'; values[674]='⬆️'
keys[675]=':arrow_down:'; values[675]='⬇️'
keys[676]=':arrow_left:'; values[676]='⬅️'
keys[677]=':arrow_right:'; values[677]='➡️'
keys[678]=':capital_abcd:'; values[678]='🔠'
keys[679]=':abcd:'; values[679]='🔡'
keys[680]=':abc:'; values[680]='🔤'
keys[681]=':arrow_upper_right:'; values[681]='↗️'
keys[682]=':arrow_upper_left:'; values[682]='↖️'
keys[683]=':arrow_lower_right:'; values[683]='↘️'
keys[684]=':arrow_lower_left:'; values[684]='↙️'
keys[685]=':left_right_arrow:'; values[685]='↔️'
keys[686]=':arrow_up_down:'; values[686]='↕️'
keys[687]=':arrows_counterclockwise:'; values[687]='🔄'
keys[688]=':arrow_backward:'; values[688]='◀️'
keys[689]=':arrow_forward:'; values[689]='▶️'
keys[690]=':arrow_up_small:'; values[690]='🔼'
keys[691]=':arrow_down_small:'; values[691]='🔽'
keys[692]=':leftwards_arrow_with_hook:'; values[692]='↩️'
keys[693]=':arrow_right_hook:'; values[693]='↪️'
keys[694]=':information_source:'; values[694]='ℹ️'
keys[695]=':rewind:'; values[695]='⏪'
keys[696]=':fast_forward:'; values[696]='⏩'
keys[697]=':arrow_double_up:'; values[697]='⏫'
keys[698]=':arrow_double_down:'; values[698]='⏬'
keys[699]=':arrow_heading_down:'; values[699]='⤵️'
keys[700]=':arrow_heading_up:'; values[700]='⤴️'
keys[701]=':ok:'; values[701]='🆗'
keys[702]=':twisted_rightwards_arrows:'; values[702]='🔀'
keys[703]=':repeat:'; values[703]='🔁'
keys[704]=':repeat_one:'; values[704]='🔂'
keys[705]=':new:'; values[705]='🆕'
keys[706]=':up:'; values[706]='🆙'
keys[707]=':cool:'; values[707]='🆒'
keys[708]=':free:'; values[708]='🆓'
keys[709]=':ng:'; values[709]='🆖'
keys[710]=':signal_strength:'; values[710]='📶'
keys[711]=':cinema:'; values[711]='🎦'
keys[712]=':koko:'; values[712]='🈁'
keys[713]=':u6307:'; values[713]='🈯'
keys[714]=':u7a7a:'; values[714]='🈳'
keys[715]=':u6e80:'; values[715]='🈵'
keys[716]=':u5408:'; values[716]='🈴'
keys[717]=':u7981:'; values[717]='🈲'
keys[718]=':ideograph_advantage:'; values[718]='🉐'
keys[719]=':u5272:'; values[719]='🈹'
keys[720]=':u55b6:'; values[720]='🈺'
keys[721]=':u6709:'; values[721]='🈶'
keys[722]=':u7121:'; values[722]='🈚'
keys[723]=':restroom:'; values[723]='🚻'
keys[724]=':mens:'; values[724]='🚹'
keys[725]=':womens:'; values[725]='🚺'
keys[726]=':baby_symbol:'; values[726]='🚼'
keys[727]=':wc:'; values[727]='🚾'
keys[728]=':potable_water:'; values[728]='🚰'
keys[729]=':put_litter_in_its_place:'; values[729]='🚮'
keys[730]=':parking:'; values[730]='🅿️'
keys[731]=':wheelchair:'; values[731]='♿'
keys[732]=':no_smoking:'; values[732]='🚭'
keys[733]=':u6708:'; values[733]='🈷️'
keys[734]=':u7533:'; values[734]='🈸'
keys[735]=':sa:'; values[735]='🈂️'
keys[736]=':m:'; values[736]='Ⓜ️'
keys[737]=':passport_control:'; values[737]='🛂'
keys[738]=':baggage_claim:'; values[738]='🛄'
keys[739]=':left_luggage:'; values[739]='🛅'
keys[740]=':customs:'; values[740]='🛃'
keys[741]=':accept:'; values[741]='🉑'
keys[742]=':secret:'; values[742]='㊙️'
keys[743]=':congratulations:'; values[743]='㊗️'
keys[744]=':cl:'; values[744]='🆑'
keys[745]=':sos:'; values[745]='🆘'
keys[746]=':id:'; values[746]='🆔'
keys[747]=':no_entry_sign:'; values[747]='🚫'
keys[748]=':underage:'; values[748]='🔞'
keys[749]=':no_mobile_phones:'; values[749]='📵'
keys[750]=':do_not_litter:'; values[750]='🚯'
keys[751]=':non-potable_water:'; values[751]='🚱'
keys[752]=':no_bicycles:'; values[752]='🚳'
keys[753]=':no_pedestrians:'; values[753]='🚷'
keys[754]=':children_crossing:'; values[754]='🚸'
keys[755]=':no_entry:'; values[755]='⛔'
keys[756]=':eight_spoked_asterisk:'; values[756]='✳️'
keys[757]=':sparkle:'; values[757]='❇️'
keys[758]=':negative_squared_cross_mark:'; values[758]='❎'
keys[759]=':white_check_mark:'; values[759]='✅'
keys[760]=':eight_pointed_black_star:'; values[760]='✴️'
keys[761]=':heart_decoration:'; values[761]='💟'
keys[762]=':vs:'; values[762]='🆚'
keys[763]=':vibration_mode:'; values[763]='📳'
keys[764]=':mobile_phone_off:'; values[764]='📴'
keys[765]=':a:'; values[765]='🅰️'
keys[766]=':b:'; values[766]='🅱️'
keys[767]=':ab:'; values[767]='🆎'
keys[768]=':o2:'; values[768]='🅾️'
keys[769]=':diamond_shape_with_a_dot_inside:'; values[769]='💠'
keys[770]=':loop:'; values[770]='➿'
keys[771]=':recycle:'; values[771]='♻️'
keys[772]=':aries:'; values[772]='♈'
keys[773]=':taurus:'; values[773]='♉'
keys[774]=':gemini:'; values[774]='♊'
keys[775]=':cancer:'; values[775]='♋'
keys[776]=':leo:'; values[776]='♌'
keys[777]=':virgo:'; values[777]='♍'
keys[778]=':libra:'; values[778]='♎'
keys[779]=':scorpius:'; values[779]='♏'
keys[780]=':sagittarius:'; values[780]='♐'
keys[781]=':capricorn:'; values[781]='♑'
keys[782]=':aquarius:'; values[782]='♒'
keys[783]=':pisces:'; values[783]='♓'
keys[784]=':ophiuchus:'; values[784]='⛎'
keys[785]=':six_pointed_star:'; values[785]='🔯'
keys[786]=':atm:'; values[786]='🏧'
keys[787]=':chart:'; values[787]='💹'
keys[788]=':heavy_dollar_sign:'; values[788]='💲'
keys[789]=':currency_exchange:'; values[789]='💱'
keys[790]=':copyright:'; values[790]='©️'
keys[791]=':registered:'; values[791]='®️'
keys[792]=':tm:'; values[792]='™️'
keys[793]=':x:'; values[793]='❌'
keys[794]=':bangbang:'; values[794]='‼️'
keys[795]=':interrobang:'; values[795]='⁉️'
keys[796]=':exclamation:'; values[796]='❗'
keys[797]=':heavy_exclamation_mark:'; values[797]='❗'
keys[798]=':question:'; values[798]='❓'
keys[799]=':grey_exclamation:'; values[799]='❕'
keys[800]=':grey_question:'; values[800]='❔'
keys[801]=':o:'; values[801]='⭕'
keys[802]=':top:'; values[802]='🔝'
keys[803]=':end:'; values[803]='🔚'
keys[804]=':back:'; values[804]='🔙'
keys[805]=':on:'; values[805]='🔛'
keys[806]=':soon:'; values[806]='🔜'
keys[807]=':arrows_clockwise:'; values[807]='🔃'
keys[808]=':clock12:'; values[808]='🕛'
keys[809]=':clock1230:'; values[809]='🕧'
keys[810]=':clock1:'; values[810]='🕐'
keys[811]=':clock130:'; values[811]='🕜'
keys[812]=':clock2:'; values[812]='🕑'
keys[813]=':clock230:'; values[813]='🕝'
keys[814]=':clock3:'; values[814]='🕒'
keys[815]=':clock330:'; values[815]='🕞'
keys[816]=':clock4:'; values[816]='🕓'
keys[817]=':clock430:'; values[817]='🕟'
keys[818]=':clock5:'; values[818]='🕔'
keys[819]=':clock530:'; values[819]='🕠'
keys[820]=':clock6:'; values[820]='🕕'
keys[821]=':clock7:'; values[821]='🕖'
keys[822]=':clock8:'; values[822]='🕗'
keys[823]=':clock9:'; values[823]='🕘'
keys[824]=':clock10:'; values[824]='🕙'
keys[825]=':clock11:'; values[825]='🕚'
keys[826]=':clock630:'; values[826]='🕡'
keys[827]=':clock730:'; values[827]='🕢'
keys[828]=':clock830:'; values[828]='🕣'
keys[829]=':clock930:'; values[829]='🕤'
keys[830]=':clock1030:'; values[830]='🕥'
keys[831]=':clock1130:'; values[831]='🕦'
keys[832]=':heavy_multiplication_x:'; values[832]='✖️'
keys[833]=':heavy_plus_sign:'; values[833]='➕'
keys[834]=':heavy_minus_sign:'; values[834]='➖'
keys[835]=':heavy_division_sign:'; values[835]='➗'
keys[836]=':spades:'; values[836]='♠️'
keys[837]=':hearts:'; values[837]='♥️'
keys[838]=':clubs:'; values[838]='♣️'
keys[839]=':diamonds:'; values[839]='♦️'
keys[840]=':white_flower:'; values[840]='💮'
keys[841]=':100:'; values[841]='💯'
keys[842]=':heavy_check_mark:'; values[842]='✔️'
keys[843]=':ballot_box_with_check:'; values[843]='☑️'
keys[844]=':radio_button:'; values[844]='🔘'
keys[845]=':link:'; values[845]='🔗'
keys[846]=':curly_loop:'; values[846]='➰'
keys[847]=':wavy_dash:'; values[847]='〰️'
keys[848]=':part_alternation_mark:'; values[848]='〽️'
keys[849]=':trident:'; values[849]='🔱'
keys[850]=':black_medium_square:'; values[850]='◼️'
keys[851]=':white_medium_square:'; values[851]='◻️'
keys[852]=':black_medium_small_square:'; values[852]='◾'
keys[853]=':white_medium_small_square:'; values[853]='◽'
keys[854]=':black_small_square:'; values[854]='▪️'
keys[855]=':white_small_square:'; values[855]='▫️'
keys[856]=':small_red_triangle:'; values[856]='🔺'
keys[857]=':black_square_button:'; values[857]='🔲'
keys[858]=':white_square_button:'; values[858]='🔳'
keys[859]=':black_circle:'; values[859]='⚫'
keys[860]=':white_circle:'; values[860]='⚪'
keys[861]=':red_circle:'; values[861]='🔴'
keys[862]=':large_blue_circle:'; values[862]='🔵'
keys[863]=':small_red_triangle_down:'; values[863]='🔻'
keys[864]=':white_large_square:'; values[864]='⬜'
keys[865]=':black_large_square:'; values[865]='⬛'
keys[866]=':large_orange_diamond:'; values[866]='🔶'
keys[867]=':large_blue_diamond:'; values[867]='🔷'
keys[868]=':small_orange_diamond:'; values[868]='🔸'
keys[869]=':small_blue_diamond:'; values[869]='🔹'

help () {
  cat <<EOF
  emojify - emoji on the command line 😱

  USAGE: emojify [-h|--help] TEXT
EOF
}

# Accept input from $* or from the pipeline
if test "$*" != ''; then
  if [ "$1" == '-h' ] || [ "$1" == '--help' ]; then
    help
    exit 0
  else
    IFS=' '; read -a words_arr <<< $*
    for word in "${words_arr[@]}"; do
      data+=$(emojify $word)
      data+=' '
    done
    echo $data
  fi
else
  while IFS=''; read -r line || [ -n "$line" ]; do
    echo $(emojify $line)
  done
fi