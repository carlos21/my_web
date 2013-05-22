var Bullet = cc.Sprite.extend({
	active: true,
  xVelocity: 0,
  yVelocity: 200,
  power: 1,
  HP: 1,
  moveType: null,
  zOrder: 3000,
  attackMode: GC.ENEMY_MOVE_TYPE.NORMAL,
  parentType: GC.BULLET_TYPE.PLAYER,
  power: 5,
  bulletType: null,
  ctor: function(bulletSpeed, weaponType, attackMode, bulletType) {
    // needed for JS-Bindings compatibility
    cc.associateWithNative( this, cc.Sprite );

    this.xVelocity = -bulletSpeed;
    this.attackMode = attackMode;
    this.bulletType = bulletType;
    cc.SpriteFrameCache.getInstance().addSpriteFrames(s_bullet_plist);
    this.initWithSpriteFrameName(weaponType);
    this.setBlendFunc(gl.SRC_ALPHA, gl.ONE);
    this.setRotation(90);

    if(GC.SOUND) {
      if (bulletType == GC.BULLET_TYPE.PLAYER) {
        cc.AudioEngine.getInstance().playEffect(s_fireEffect);  
      }
      
    }
  },

  update: function(dt) {
    var p = this.getPosition();
    p.x -= this.xVelocity * dt;
    this.setPosition( p );
    if (this.HP <= 0) {
      this.active = false;
    }
  },

  destroy: function() { 
    if (this.getParent()) {
      var explode = cc.Sprite.create(s_hit);
      explode.setBlendFunc(gl.SRC_ALPHA, gl.ONE);
      explode.setPosition(this.getPosition());
      explode.setRotation(Math.random()*360);
      explode.setScale(0.75);
      this.getParent().addChild(explode,9999);

      var removeExplode = cc.CallFunc.create(function(node) {
        node.removeFromParent();
      }, explode);
      explode.runAction(cc.ScaleBy.create(0.3, 2,2));
      explode.runAction(cc.Sequence.create(cc.FadeOut.create(0.3), removeExplode));
    }
   
    cc.ArrayRemoveObject(GC.CONTAINER.ENEMY_BULLETS, this);
    cc.ArrayRemoveObject(GC.CONTAINER.PLAYER_BULLETS, this);
    this.removeFromParent(true);
  },

  hurt: function() {
    this.HP--;
  },

  collideRect: function() {
    var p = this.getPosition();
    return cc.rect(p.x - 3, p.y - 3, 6, 6);                         
  }
});