var Explosion = cc.Sprite.extend({
  tmpWidth: 0,
  tmpHeight: 0,

  ctor: function() {
    cc.associateWithNative( this, cc.Sprite );

    var self = this;
    var pFrame = cc.SpriteFrameCache.getInstance().getSpriteFrame("explosion_01.png");
    this.initWithSpriteFrame(pFrame);

    var cs = this.getContentSize();
    this.tmpWidth = cs.width;
    this.tmpHeight = cs.height;

    var animation = cc.AnimationCache.getInstance().getAnimation("Explosion");
    this.runAction(cc.Sequence.create(
      cc.Animate.create(animation),
      cc.CallFunc.create(function(node) {
        node.removeFromParent();
        self.removeFromParent();
      }, self)
    ));
    this.setBlendFunc(gl.SRC_ALPHA, gl.ONE);

    return this;
  },

  destroy: function() {
    this.getParent().removeChild(this, true);
  },

  animAndDestroy: function(explosion) {
    var animation = cc.AnimationCache.getInstance().getAnimation("Explosion");
    this.runAction(cc.Sequence.create(
      cc.Animate.create(animation),
      cc.CallFunc.create(function(node) {
        node.removeFromParent();
      }, explosion)
    ));
  }
 
});

Explosion.sharedExplosion = function() {
  cc.SpriteFrameCache.getInstance().addSpriteFrames(s_explosion_plist);

  var animFrames = [];
  var str = "";
  for (var i = 1; i < 25; i++) {
    str = "explosion_" + (i < 10 ? ("0" + i) : i) + ".png";
    var frame = cc.SpriteFrameCache.getInstance().getSpriteFrame(str);
    animFrames.push(frame);
  }
  var animation = cc.Animation.create(animFrames, 0.04);
  cc.AnimationCache.getInstance().addAnimation(animation, "Explosion");
}