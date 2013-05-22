var Ship = cc.Sprite.extend({
	speed: 220,
  bulletSpeed: 900,
  HP: 5,
  bulletTypeValue: 1,
  bulletPowerValue: 1,
  throwBombing: false,
  canBeAttack: true,
  isThrowingBomb: false,
  zOrder: 3000,
  maxBulletPowerValue: 4,
  appearPosition: null,
  _hurtColorLife: 0,
  active: true,
  currentTime: null,
  alreadyShoot: false,

  ctor: function() {
    cc.associateWithNative( this, cc.Sprite );

    this.appearPosition = cc.p(30, winSize.height/2);
    this.currentTime = new Date().getTime();

    var shipTexture = cc.TextureCache.getInstance().addImage(s_ship01);
    this.initWithTexture(shipTexture, cc.rect(0, 0, 60, 38));
    this.setTag(this.zOrder);
    this.setPosition(this.appearPosition);
    this.setRotation(90);

    var frame0 = cc.SpriteFrame.createWithTexture(shipTexture, cc.rect(0, 0, 60, 38));
    var frame1 = cc.SpriteFrame.createWithTexture(shipTexture, cc.rect(60, 0, 60, 38));

    var animFrames = [];
    animFrames.push(frame0);
    animFrames.push(frame1);

    var animation = cc.Animation.create(animFrames, 0.1);
    var animate = cc.Animate.create(animation);
    this.runAction(cc.RepeatForever.create(animate));
    this.schedule(this.updateTime, 1/6);

    this.canBeAttack = false;
    var ghostSprite = cc.Sprite.createWithTexture(shipTexture, cc.rect(0, 45, 60, 38));
    ghostSprite.setBlendFunc(gl.SRC_ALPHA, gl.ONE);
    ghostSprite.setScale(8);
    ghostSprite.setPosition(cc.p(this.getContentSize().width/2, 12));
    this.addChild(ghostSprite, 3000, 99999);
    ghostSprite.runAction(cc.ScaleTo.create(0.5, 1, 1));

    /*var blinks = cc.Blink.create(3, 9);
    var makeBeAttack = cc.CallFunc.create(this, function (node) {
      node.canBeAttack = true;
      node.setInvisible(true);
      node.removeChild(ghostSprite, true);
    }, this);

    this.runAction(cc.Sequence.create(blinks, makeBeAttack));*/
  
  },

  updateTime: function() {
    this.currentTime = new Date().getTime();
  },

  update: function(dt) {
    var pos = this.getPosition();
    if ((GC.KEYS[cc.KEY.w] || GC.KEYS[cc.KEY.up]) && pos.y <= winSize.height) {
      pos.y += dt * this.speed;
    }
    if ((GC.KEYS[cc.KEY.s] || GC.KEYS[cc.KEY.down]) && pos.y >= 0) {
      pos.y -= dt * this.speed;
    }
    if ((GC.KEYS[cc.KEY.a] || GC.KEYS[cc.KEY.left]) && pos.x >= 0) {
      pos.x -= dt * this.speed;
    }
    if ((GC.KEYS[cc.KEY.d] || GC.KEYS[cc.KEY.right]) && pos.x <= winSize.width) {
      pos.x += dt * this.speed;
    }
    this.setPosition( pos );

    // shoot
    if (GC.KEYS[cc.KEY.n]) {
      // If already passed one second
      if ((new Date().getTime() - this.currentTime) > 50) {
        if (!this.alreadyShoot) {
          this.shoot();  
          this.alreadyShoot = true;
        }
        
      } else {
        this.alreadyShoot = false;
      }
      
    }

    if (this.HP <= 0) {
      this.active = false;
    }
    this._timeTick += dt;
    if (this._timeTick > 0.1) {
      this._timeTick = 0;
      if (this._hurtColorLife > 0) {
        this._hurtColorLife--;
      }
      if (this._hurtColorLife == 1) {
        this.setColor(cc.white());
      }
    }
  },

  shoot: function(dt) {
    var offset = 13;
    var p = this.getPosition();
    var cs = this.getContentSize();

    var a = new Bullet(this.bulletSpeed, "W1.png", GC.ENEMY_MOVE_TYPE.NORMAL, GC.BULLET_TYPE.PLAYER);
    GC.CONTAINER.PLAYER_BULLETS.push(a);
    this.getParent().addChild(a, a.zOrder, GC.UNIT_TAG.PLAYER_BULLET);
    a.setPosition(cc.p(p.x + this.getContentSize().width/2, p.y + offset));

    var b = new Bullet(this.bulletSpeed, "W1.png", GC.ENEMY_MOVE_TYPE.NORMAL, GC.BULLET_TYPE.PLAYER);
    GC.CONTAINER.PLAYER_BULLETS.push(b);
    this.getParent().addChild(b, b.zOrder, GC.UNIT_TAG.PLAYER_BULLET);
    b.setPosition(cc.p(p.x + this.getContentSize().width/2, p.y - offset));
  },

  destroy:function () {
    GC.LIFE--;
    var p = this.getPosition();
    var myParent = this.getParent();
    myParent.addChild( new Explosion(p) );
    myParent.removeChild(this,true);
    if (GC.SOUND) {
        cc.AudioEngine.getInstance().playEffect(s_shipDestroyEffect);
    }
  },
  hurt: function(power) {
    if (this.canBeAttack) {
      this.HP -= power;
    }
  },
  collideRect:function(){
    var p = this.getPosition();
    var a = this.getContentSize();
    var r = new cc.rect(p.x - a.width/2, p.y - a.height/2, a.width, a.height/2);
    return r;
  }

});