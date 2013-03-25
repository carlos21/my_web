var dirArt = "Art/";
var dirSounds = "Sounds/";
 
var s_player = dirArt + "player.png";
var s_monster = dirArt + "monster.png";
var s_projectile = dirArt + "projectile.png";
var s_spaceship = dirArt + "spaceship-icon.png";
var s_enemy = dirArt + "enemy.jpg";
 
var s_bgMusic = dirSounds + "background-music.mp3";
var s_bgMusicOgg = dirSounds + "background-music.ogg";
var s_bgMusicCaf = dirSounds + "background-music.caf";
 
var s_shootEffect = dirSounds + "pew-pew-lei.mp3";
var s_shootEffectOgg = dirSounds + "pew-pew-lei.ogg";
var s_shootEffectWav = dirSounds + "pew-pew-lei.wav";
 
var g_ressources = [
 
  {type:"image", src:s_player},
  {type:"image", src:s_monster},
  {type:"image", src:s_projectile},
  {type:"image", src:s_spaceship},

  {type:"sound", src:s_bgMusic},
  {type:"sound", src:s_bgMusicOgg},
  {type:"sound", src:s_bgMusicCaf},

  {type:"sound", src:s_shootEffect},
  {type:"sound", src:s_shootEffectOgg},
  {type:"sound", src:s_shootEffectWav}
 
];