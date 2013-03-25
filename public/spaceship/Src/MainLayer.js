var audioEngine = cc.AudioEngine.getInstance();

var MainLayer = cc.LayerColor.extend({
  _monstersDestroyed:0,
  _monsters:[],
  _enemies:[],
  _projectiles:[],
  _enemyProjectiles:[],
  _timerEnemyProjectiles:[],
  _player: null,
  _pressedKey: null,
    
  ctor:function() {
    this._super();
    cc.associateWithNative( this, cc.LayerColor );
  },

  // this is a good place to put initialization code for a layer
  onEnter:function () {
    this._super();
    this.setKeyboardEnabled(true);

    if( 'touches' in sys.capabilities ) {
      this.setTouchEnabled(true);
    }
    if( 'mouse' in sys.capabilities ) {
      this.setMouseEnabled(true);
      console.log('entro');
    }

    _player = cc.Sprite.create(s_spaceship);
    _player.setPosition(_player.getContentSize().width / 2, winSize.height / 2);
    _player.setRotation(90);

    this.addChild(_player);

    this.schedule(this.gameLogic, 3);
    //this.gameLogic();

    this.scheduleUpdate();
    //audioEngine.playMusic(s_bgMusic, true);
  },

  onKeyDown: function(e) {
    this._pressedKey = e;
  },

  onKeyUp: function(e) {
    this._pressedKey = null;
  },

  getRandomNumByRange: function(min, max) {
    var rangeY = max - min;
    return (Math.random() * rangeY) + min;
  },

  addEnemy: function() {
    var self = this;
    var enemy = cc.Sprite.create(s_enemy);
    var numberOfMovements = 100;
    var numberOfShots = 200;
    enemy.setRotation(90);
    

    // Determine where to spawn the enemy along the Y axis
    var firstY  = this.getRandomNumByRange(enemy.getContentSize().height / 2, winSize.height - enemy.getContentSize().height / 2);
    
    enemy.setPosition(winSize.width + enemy.getContentSize().width/2, firstY);
    this.addChild(enemy);

    for (var i = 1; i <= numberOfMovements; i++) {
      var timer = setTimeout(function(){
        console.log('timeout');
        self.runAction(enemy);
      }, i*1000);
    }

    for (var i = 1; i <= numberOfShots; i++) {
      var timer = setTimeout(function(){
        self.makeEnemyShot(enemy);
      }, i*500 + 1100);

      this._timerEnemyProjectiles.push(timer);
    }
 
    // Add to array
    enemy.setTag(1);
    this._enemies.push(enemy); // 6

  },

  runAction: function(enemy) {
    var maxWidthArea = 400;
    var randomDuration = this.getRandomNumByRange(1.0, 1.5);
    var randomX = this.getRandomNumByRange(winSize.width - maxWidthArea, winSize.width - 100);
    var randomY = this.getRandomNumByRange(enemy.getContentSize().height / 2, winSize.height - enemy.getContentSize().height / 2);
    var actionMove     = cc.MoveTo.create(randomDuration, cc.p(randomX, randomY)); // 3
    var actionMoveDone = cc.CallFunc.create(function(node) { // 4
      //cc.ArrayRemoveObject(this._enemies, node); // 5
      //node.removeFromParent();
      //var scene = GameOver.scene(false);
      //cc.Director.getInstance().replaceScene(scene);
    }, this); 
    enemy.runAction(cc.Sequence.create(actionMove, actionMoveDone));
  },

  makeEnemyShot: function(enemy) {
    var projectile = cc.Sprite.create(s_projectile);
    projectile.setScale(0.7);
    projectile.setPosition(enemy.getPosition().x - enemy.getContentSize().width / 2, enemy.getPosition().y);

    this.addChild(projectile);  

    var actionMove = cc.MoveTo.create(1, cc.p(0, enemy.getPosition().y));
    var actionMoveDone = cc.CallFunc.create(function(node) {
      cc.ArrayRemoveObject(this._enemyProjectiles, node);
      node.removeFromParent();
    }, this);

    projectile.runAction(cc.Sequence.create(actionMove, actionMoveDone));
    projectile.setTag(2);
    this._enemyProjectiles.push(projectile);

  },

  addMonster:function() {
 
    var monster = cc.Sprite.create(s_monster);
 
    // Determine where to spawn the monster along the Y axis
    var minY = monster.getContentSize().height / 2;
    var maxY = winSize.height - monster.getContentSize().height / 2;
    var rangeY = maxY - minY;
    var actualY = (Math.random() * rangeY) + minY; // 1
 
    // Create the monster slightly off-screen along the right edge,
    // and along a random position along the Y axis as calculated above
    monster.setPosition(winSize.width + monster.getContentSize().width/2, actualY);
    this.addChild(monster); // 2
 
    // Determine speed of the monster
    var minDuration = 2.0;
    var maxDuration = 4.0;
    var rangeDuration = maxDuration - minDuration;
    var actualDuration = (Math.random() % rangeDuration) + minDuration;
 
    // Create the actions
    var actionMove = cc.MoveTo.create(actualDuration, cc.p(-monster.getContentSize().width/2, actualY)); // 3
    var actionMoveDone = cc.CallFunc.create(function(node) { // 4
      cc.ArrayRemoveObject(this._enemies, node); // 5
      node.removeFromParent();
      //var scene = GameOver.scene(false);
      //cc.Director.getInstance().replaceScene(scene);
    }, this); 
    monster.runAction(cc.Sequence.create(actionMove, actionMoveDone));
 
    // Add to array
    monster.setTag(1);
    this._enemies.push(monster); // 6 
  },

  gameLogic: function(dt) {
    //this.addMonster();
    this.addEnemy();
  },

  locationTapped: function(location) {
    // Set up initial location of the projectile
    var projectile = cc.Sprite.create(s_projectile);
    projectile.setScale(0.7);
    projectile.setPosition(_player.getPosition().x + 38, _player.getPosition().y);

    // Determine offset of location to projectile
    var offset = cc.pSub(location, projectile.getPosition()); // 1

    // Bail out if you are shooting down or backwards
    if (offset.x <= 0) return;

    // Ok to add now - we've double checked position
    this.addChild(projectile);

    // Figure out final destination of projectile
    var realX = winSize.width + (projectile.getContentSize().width / 2);
    var ratio = offset.y / offset.x;
    var realY = (realX * ratio) + projectile.getPosition().y;
    var realDest = cc.p(realX, realY);

    // Determine the length of how far you're shooting
    var offset = cc.pSub(realDest, projectile.getPosition());
    var length = cc.pLength(offset);
    var velocity = 480.0;
    var realMoveDuration = length / velocity;

    // Move projectile to actual endpoint
    projectile.runAction(cc.Sequence.create( // 2
      cc.MoveTo.create(realMoveDuration, realDest),
      cc.CallFunc.create(function(node) {
        cc.ArrayRemoveObject(this._projectiles, node);
        node.removeFromParent();
      }, this)
    ));

    // Add to array
    projectile.setTag(2);
    this._projectiles.push(projectile);
    audioEngine.playEffect(s_shootEffect);
  },
   
  onMouseUp:function (event) {
    var location = event.getLocation();
    this.locationTapped(location);
  },
   
  onTouchesEnded:function (touches, event) {
    if (touches.length <= 0)
        return;
    var touch = touches[0];
    var location = touch.getLocation();
    this.locationTapped(location);
  },

  update: function (dt) {
    for (var i = 0; i < this._projectiles.length; i++) {
      var projectile = this._projectiles[i];
      for (var j = 0; j < this._enemies.length; j++) {
        var enemy = this._enemies[j];
        var projectileRect = projectile.getBoundingBox();
        var monsterRect = enemy.getBoundingBox();
        if (cc.rectIntersectsRect(projectileRect, monsterRect)) {
          cc.log("collision!");
          cc.ArrayRemoveObject(this._projectiles, projectile);
          projectile.removeFromParent();
          cc.ArrayRemoveObject(this._enemies, enemy);
          enemy.removeFromParent();  

          for (var i = 0; i < this._timerEnemyProjectiles.length; i++) {
            clearTimeout(this._timerEnemyProjectiles[i]);
          }     

          this._monstersDestroyed++;
          if (this._monstersDestroyed >= 2) {
              //var scene = GameOver.scene(true);
              //cc.Director.getInstance().replaceScene(scene);
          }         
        }
      }
    }

    var pixelsMove = 8;
    var position = _player.getPosition();

    if (this._pressedKey) {
      if(this._pressedKey === cc.KEY.a) {
        if (position.x >= 30) {
          _player.setPosition(position.x - pixelsMove, position.y);  
        }
      }

      if(this._pressedKey === cc.KEY.d) {
        if (position.x <= 770) {
          _player.setPosition(position.x + pixelsMove, position.y);
          console.log(cc.KEY);
        }
      }

      if(this._pressedKey === cc.KEY.w) {
        console.log(position.y);
        if (position.y <= 420) {
          _player.setPosition(position.x, position.y + pixelsMove);
        }
      }

      if(this._pressedKey === cc.KEY.s) {
        if (position.y >= 30) {
          _player.setPosition(position.x, position.y - pixelsMove);
        }
      }
    }
    
  }
 
});

MainLayer.create = function () {
  var sg = new MainLayer();
  if (sg && sg.init(cc.c4b(255, 255, 255, 255))) {
      return sg;
  }
  return null;
};
 
// 2
MainLayer.scene = function () {
  var scene = cc.Scene.create();
  var layer = MainLayer.create();
  scene.addChild(layer);
  return scene;
};