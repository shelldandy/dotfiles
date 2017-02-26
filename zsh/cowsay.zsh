# https://gist.github.com/jackinloadup/732325
function randomcowsay() {

  cows[1]=beavis.zen
  cows[2]=bong
  cows[3]=bud-frogs
  cows[4]=bunny
  cows[5]=cheese
  cows[6]=cower
  cows[7]=daemon
  cows[8]=default
  cows[9]=dragon
  cows[10]=dragon-and-cow
  cows[11]=elephant
  cows[12]=elephant-in-snake
  cows[13]=eyes
  cows[14]=flaming-sheep
  cows[15]=ghostbusters
  cows[16]=head-in
  cows[17]=hellokitty
  cows[18]=kiss
  cows[19]=kitty
  cows[20]=koala
  cows[21]=kosh

  cows[22]=luke-koala
  cows[23]=meow
  cows[24]=milk
  cows[25]=moofasa
  cows[26]=moose
  cows[27]=mutilated
  cows[28]=ren
  cows[29]=satanic
  cows[30]=sheep
  cows[31]=skeleton
  cows[32]=small
  cows[33]=sodomized
  cows[34]=stegosaurus
  cows[35]=stimpy
  cows[36]=supermilker
  cows[37]=surgery
  cows[38]=telebears
  cows[39]=three-eyes
  cows[40]=turkey
  cows[41]=turtle
  cows[42]=tux
  cows[43]=udder
  cows[44]=vader
  cows[45]=vader-koala
  cows[46]=www

  declare i ALL=${#cows[@]}

  cowsay -f ${cows[$[ ( $RANDOM % $ALL )  + 1 ]]}

}

alias moo='fortune | randomcowsay | lolcat'
