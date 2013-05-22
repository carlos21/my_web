var GC = GC || {};

(function () {
  var d = document;
  var c = {
    // 1
    menuType: 'canvas',
    COCOS2D_DEBUG: 2,
    box2d: false,
    chipmunk: false,
    showFPS: true,
    frameRate: 60,
    loadExtension: true,
    tag: 'gameCanvas', 
    engineDir:'libs/cocos2d/',
    appFiles:[
      'DarkInvaders/src/resource.js',
      'DarkInvaders/src/config/GameConfig.js',
      'DarkInvaders/src/Effect.js',
      'DarkInvaders/src/Bullet.js',
      'DarkInvaders/src/Enemy.js',
      'DarkInvaders/src/Ship.js',
      'DarkInvaders/src/Explosion.js',
      'DarkInvaders/src/GameLayer.js'
    ]
  };

  // 3
  window.addEventListener('DOMContentLoaded', function () {
    var s = d.createElement('script');

    if (c.SingleEngineFile && !c.engineDir) {
      s.src = c.SingleEngineFile;
    }
    else if (c.engineDir && !c.SingleEngineFile) {
      s.src = c.engineDir + 'platform/jsloader.js';
    }
    else {
      alert('You must specify either the single engine file OR the engine directory in "cocos2d.js"');
    }        

    document.ccConfig = c;
    s.id = 'cocos2d-html5';
    d.body.appendChild(s);
  });
})();