var GameLayer = cc.LayerColor.extend({
  _ship: null,
  _timerEnemyProjectiles: [],
  screenRect: null,
  backSky: null,
  backSky2: null,
  currentTime: 0,
  flag: 0,

	ctor: function () {
    cc.associateWithNative( this, cc.Layer );
  },

  init: function () {
    var self = this;
    GC.CONTAINER.ENEMIES = [];
    GC.CONTAINER.ENEMY_BULLETS = [];
    GC.CONTAINER.PLAYER_BULLETS = [];
    GC.SCORE = 0;
    GC.LIFE = 4;

    Explosion.sharedExplosion();
    
    this.screenRect = cc.rect(0, 0, winSize.width, winSize.height + 10);

    this._ship = new Ship();
    this.addChild(this._ship, this._ship.zOrder, GC.UNIT_TAG.PLAYER);

    var t = cc.config.deviceType;
    this.setTouchEnabled(true);
    this.setKeyboardEnabled(true);

    this.scheduleUpdate();
    this.schedule(this.addEnemy, 3);

    /*setTimeout(function(){
      self.movingBackground2();
      self.schedule(self.movingBackground2, 3);
    }, 1500);

    
    this.schedule(this.movingBackground1, 3);*/

    

    this.initBackground();
    this.schedule(this.moveBg, 15);

    if (GC.SOUND) {
      //cc.AudioEngine.getInstance().playBackgroundMusic(s_bgMusic, true);
    }
    
    return true;
  },

  moveBg: function() {
    this.backSky.setPosition(0, 0);
    this.backSky.runAction(cc.MoveTo.create(15, cc.p(-1000, 0)));
  },

  update: function(dt) {

    // update position of background2
    this.backSky2.setPosition(this.backSky.getPosition().x + 1000, 0);

    var childs = this.getChildren();
    var selChild = null;

    for (var i in childs) {
      selChild = childs[i];
      if (selChild) {
        if (typeof selChild.update == 'function') {
          selChild.update(dt);
          /*var tag = selChild.getTag();
          if ((tag == MW.UNIT_TAG.PLAYER) || (tag == MW.UNIT_TAG.PLAYER_BULLET) ||
            (tag == MW.UNIT_TAG.ENEMY) || (tag == MW.UNIT_TAG.ENMEY_BULLET)) {
            if (selChild && !selChild.active) {
              selChild.destroy();
            }
          }*/
        }
      }
    }

    this.checkCollision();
  },

  checkCollision: function() {
    for (i = 0; i < GC.CONTAINER.PLAYER_BULLETS.length; i++) {
      var bullet = GC.CONTAINER.PLAYER_BULLETS[i];

      if (bullet.getPosition().x > 800) {
        cc.ArrayRemoveObject(GC.CONTAINER.PLAYER_BULLETS, bullet);
        bullet.removeFromParent();
      } else {
        for (var j = 0; j < GC.CONTAINER.ENEMIES.length; j++) {
          var enemy = GC.CONTAINER.ENEMIES[j];
          var projectileRect = bullet.getBoundingBox();
          var monsterRect = enemy.getBoundingBox();

          if (cc.rectIntersectsRect(projectileRect, monsterRect)) {
            if (enemy.HP <= 0) {
              enemy.destroy();
            } else {
              enemy.hurt(bullet.power);  
            }
            
            bullet.destroy();
          }
        }
      }
    }

    var shipRect = this._ship.getBoundingBox();
    for (i = 0; i < GC.CONTAINER.ENEMY_BULLETS.length; i++) {
      var bullet = GC.CONTAINER.ENEMY_BULLETS[i];
      var bulletRect = bullet.getBoundingBox();

      if (bullet.getPosition().x <= 0) {
        cc.ArrayRemoveObject(GC.CONTAINER.ENEMY_BULLETS, bullet);
        bullet.removeFromParent();
      } else if (cc.rectIntersectsRect(bulletRect, shipRect)) {
        if (this._ship.HP <= 0) {
          this._ship.destroy();
        } else {
          this._ship.hurt(bullet.power);
        }

        bullet.destroy();
      }
    }

  },

  onKeyDown:function (e) {
    GC.KEYS[e] = true;
  },

  onKeyUp:function (e) {
    GC.KEYS[e] = false;
  },

  addEnemy: function(e) {
    var self = this;
    var numberOfMovements = 100;
    var numberOfShots = 200;
    var enemy = new Enemy();
    self.addChild(enemy);

    for (var i = 1; i <= numberOfMovements; i++) {
      var timer = setTimeout(function(){
        enemy.move();
      }, i*1000);
    }

    /*for (var i = 1; i <= numberOfShots; i++) {
      var timer = setTimeout(function(){
        self.makeEnemyShot(enemy);
      }, i*500 + 1100);

      this._timerEnemyProjectiles.push(timer);
    }*/
  },

  initBackground: function() {
    this.backSky = cc.Sprite.create(s_bg01);
    this.backSky.setAnchorPoint(cc.p(0, 0));
    this.backSky.setPosition(0, 0);
    this.addChild(this.backSky, -10);
    this.backSky.runAction(cc.MoveTo.create(15, cc.p(-1000, 0)));
    
    this.backSky2 = cc.Sprite.create(s_bg01);
    this.backSky2.setAnchorPoint(cc.p(0, 0));
    this.backSky2.setPosition(1000, 0);
    this.addChild(this.backSky2, -10);
  }

});

GameLayer.create = function () {
  var sg = new GameLayer();
  if (sg && sg.init()) {
      return sg;
  }
  return null;
};

GameLayer.scene = function () {
  var scene = cc.Scene.create();
  var layer = GameLayer.create();
  scene.addChild(layer, 1);
  return scene;
};