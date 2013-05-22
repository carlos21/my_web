var Enemy = cc.Sprite.extend({
	eID: 0,
	active: true,
	speed: 200,
	bulletSpeed: -200,
	HP: 30,
	bulletPowerValue: 1,
	moveType: null,
	scoreValue: 200,
	zOrder: 1000,
	attackMode: GC.ENEMY_MOVE_TYPE.NORMAL,
  _hurtColorLife: 0,
  _timeTick: 0,
  delayTime:1 + 1.2 * Math.random(),

  ctor: function(arg) {
  	// needed for JS-Bindings compatibility
    cc.associateWithNative( this, cc.Sprite );

    var enemyTexture = cc.TextureCache.getInstance().addImage(s_Enemy);
    this.initWithTexture(enemyTexture, cc.rect(0, 0, 80, 38));

    this.setRotation(90);
    
    // Determine where to spawn the enemy along the Y axis
    var firstY = this.getRandomNumByRange(this.getContentSize().height / 2, winSize.height - this.getContentSize().height / 2);
    
    this.setPosition(winSize.width + this.getContentSize().width/2, firstY);

    // Add to array
    this.setTag(1);
    GC.CONTAINER.ENEMIES.push(this);
    this.schedule(this.shoot, this.delayTime);

    return this;

    /*this.HP = arg.HP;
    this.moveType = arg.moveType;
    this.scoreValue = arg.scoreValue;
    this.attackMode = arg.attackMode;

    this.initWithSpriteFrameName(arg.textureName);*/
    
  },

  update: function(dt) {
  	
  },

  destroy: function() {
  	GC.SCORE += this.scoreValue;

  	// Explosion
  	var explosion = new Explosion();
  	explosion.setPosition(this.getPosition());
  	this.getParent().addChild(explosion);
  	spark(this.getPosition(), this.getParent(), 1.2, 0.7);

    explosion.animAndDestroy(explosion);

  	// remove
  	cc.ArrayRemoveObject(GC.CONTAINER.ENEMIES, this);
  	this.removeFromParent(true);

  	if(GC.SOUND) {
  		cc.AudioEngine.getInstance().playEffect(s_explodeEffect);
  	}
  },

  shoot: function() {
    var offset = 13;
  	var p = this.getPosition();
  	var b = new Bullet(this.bulletSpeed, "W2.png", this.attackMode, GC.BULLET_TYPE.ENEMY);
  	GC.CONTAINER.ENEMY_BULLETS.push(b);
  	this.getParent().addChild(b, b.zOrder, GC.UNIT_TAG.ENEMY_BULLETS);
  	b.setPosition(cc.p(p.x - this.getContentSize().width/2, p.y - offset));
  },

  hurt: function(power) {
  	this.HP -= power;
  },

  collideRect: function() {
  	var a = this.getContentSize();
  	var p = this.getPosition();
  	return cc.rect(p.x - a.width/2, p.y - a.height/4, a.width, a.height/2);
  },

  getRandomNumByRange: function(min, max) {
    var rangeY = max - min;
    return (Math.random() * rangeY) + min;
  },

  move: function() {
    var maxWidthArea = 400;
    var randomDuration = this.getRandomNumByRange(1.0, 1.5);
    var randomX = this.getRandomNumByRange(winSize.width - maxWidthArea, winSize.width - 100);
    var randomY = this.getRandomNumByRange(this.getContentSize().height / 2, winSize.height - this.getContentSize().height / 2);
    var actionMove     = cc.MoveTo.create(randomDuration, cc.p(randomX, randomY)); // 3
    var actionMoveDone = cc.CallFunc.create(function(node) { // 4
      //cc.ArrayRemoveObject(this._enemies, node); // 5
      //node.removeFromParent();
      //var scene = GameOver.scene(false);
      //cc.Director.getInstance().replaceScene(scene);
    }, this); 
    this.runAction(cc.Sequence.create(actionMove, actionMoveDone));
  }


});

Enemy.sharedEnemy = function() {
	cc.SpriteFrameCache.getInstance().addSpriteFrames(s_Enemy_plist, s_Enemy);
}
