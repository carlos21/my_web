var cocos2dApp = cc.Application.extend({

  config: document['ccConfig'],

  ctor: function (scene) {
    this._super();
    this.startScene = scene;
    cc.COCOS2D_DEBUG = this.config.COCOS2D_DEBUG;
    //cc.IS_SHOW_DEBUG_ON_PAGE = true;
    cc.setup(this.config.tag);
    cc.AudioEngine.getInstance().init("mp3,ogg");
    cc.Loader.getInstance().onloading = function () {
        cc.LoaderScene.getInstance().draw();
    };
    cc.Loader.getInstance().onload = function () {
        cc.AppController.shareAppController().didFinishLaunchingWithOptions();
        /*cc.adjustSizeForWindow();
        window.addEventListener("resize", function (event) {
            cc.adjustSizeForWindow();
        });*/
    };
    cc.Loader.getInstance().preload(g_ressources);
  },

  applicationDidFinishLaunching:function () {
    var director = cc.Director.getInstance();
    director.setDisplayStats(this.config['showFPS']);
    director.setAnimationInterval(1.0 / this.config['frameRate']);
    
    director = cc.Director.getInstance();
    winSize = director.getWinSize();
    centerPos = cc.p( winSize.width/2, winSize.height/2 );
    director.runWithScene(new this.startScene());
    return true;
  }

});

cc.adjustSizeForWindow = function () {
  var margin = document.documentElement.clientWidth - document.body.clientWidth;
  if (document.documentElement.clientWidth < cc.originalCanvasSize.width) {
    cc.canvas.width = cc.originalCanvasSize.width;
  } else {
    cc.canvas.width = document.documentElement.clientWidth - margin;
  }
  if (document.documentElement.clientHeight < cc.originalCanvasSize.height) {
    cc.canvas.height = cc.originalCanvasSize.height;
  } else {
    cc.canvas.height = document.documentElement.clientHeight - margin;
  }

  var xScale = cc.canvas.width / cc.originalCanvasSize.width;
  var yScale = cc.canvas.height / cc.originalCanvasSize.height;
  if (xScale > yScale) {
    xScale = yScale;
  }
  cc.canvas.width = cc.originalCanvasSize.width * xScale;
  cc.canvas.height = cc.originalCanvasSize.height * xScale;
  var divContainer = document.getElementById("Container");
  var parentDiv = document.getElementById("Cocos2dGameContainer");
  if (parentDiv) {
    parentDiv.style.width = cc.canvas.width + "px";
    parentDiv.style.height = cc.canvas.height + "px";
  }
  if (divContainer) {
    divContainer.style.width = cc.canvas.width + "px";
    divContainer.style.height = cc.canvas.height + "px";
  }
  cc.renderContext.translate(0, cc.canvas.height);
  cc.renderContext.scale(xScale, xScale);
  cc.Director.getInstance().setContentScaleFactor(xScale);
}
 
var director;
var winSize;
var centerPos;
var myApp = new cocos2dApp(GameLayer.scene);