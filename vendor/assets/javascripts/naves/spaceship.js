// Constantes
T_JUEGO = 5;

IMG_NAVE = 'assets/naves/nave.png';
IMG_NAVE_ANCHO = 47;
IMG_NAVE_ALTO = 63;
CENTRO_NAVE_X = IMG_NAVE_ANCHO/2 - 6;

IMG_PROYECTIL = 'assets/naves/proyectil-azul.png';
IMG_PROY_ANCHO = 10;
IMG_PROY_ALTO = 10;

CANVAS_WIDTH = 400;
CANVAS_HEIGHT = 400;

RUTA_BASE = '';
POS_INI_X = 200;
POS_INI_Y = 330;

PASO_X = 5;
PASO_PROYECTIL = 10;

window.addEvent('domready', function() {
  var imgs = [IMG_NAVE];
  // asset sirve para precargas las imagenes
  var images = Asset.images(imgs, {
    onComplete: function(){
      var juego = new Juego();
      juego.jugar();
    }
  });
});

var Nave = new Class({
  Implements: [Options],

  options: {
    imagen: IMG_NAVE,
    posx: POS_INI_X,
    posy: POS_INI_Y,
  },

  initialize: function(options) {
    this.setOptions(options);
  },

  movDer: function() {
    if (this.options.posx <= CANVAS_WIDTH-IMG_NAVE_ANCHO) {
      this.options.posx+=PASO_X;
    }
  },

  disparar: function() {
    return new Proyectil({
      'posx': this.options.posx,
      'posy': this.options.posy
    });
  },

  movIzq: function() {
    if (this.options.posx >= 0) {
      this.options.posx-=PASO_X;
    }
  },

  getImage: function() {
    return this.options.imagen;
  },

  getPosX: function() {
    return this.options.posx;
  },

  getPosY: function() {
    return this.options.posy;
  }

});

var Universo = new Class({
  nave: null,
  balas: [],
  aliens: null,

  initialize: function() {
    this.nave = new Nave();
  },

  getBalas: function() {
    return this.balas;
  },

  getAliens: function() {
    return this.alienes;
  },

  getNave: function() {
    return this.nave;
  },

  crearProyectil: function(bala) {
    bala.id = this.balas.length+1;
    this.balas.push(bala);
  },

  proyectilOut: function(bala) {
    if (bala.getPosY() <= 10) {
      return true;
    }
    return false;
  }
  
});

var Juego = new Class({
  universo: null,
  dibujante: null,
  intervaloJuego: null,
  keys: {},

  initialize: function() {
    this.universo = new Universo();
    this.dibujante = new Dibujante(this.universo.getNave());
  },

  jugar: function() {
    // eventos de teclado
    window.addEvent('keydown', function(event) {
      this.keys[event.key] = true;

      for (var key in this.keys) {
        this.ejecutar(key);
      }
      
    }.bind(this));

    window.addEvent('keyup', function(event) {
      delete this.keys[event.key];
    }.bind(this));

    this.intervaloJuego = this.actualizar.periodical(T_JUEGO, this);
  },

  ejecutar: function(tecla) {

    if(tecla == 'left') {
      console.log('entro al left');
      this.universo.getNave().movIzq();
    }

    if(tecla == 'right') {
      console.log('entro al right');
      this.universo.getNave().movDer();
    }

    if(tecla == 'up') {
      console.log('entro al up');
      var bala = this.universo.getNave().disparar();
      this.universo.crearProyectil(bala);
      this.dibujante.dibujarBala(bala);
    }
    

    /*
    switch(tecla) {
      case 'left':
        this.universo.getNave().movIzq();
        console.log('entro al left');
        break;
      case 'right':
        this.universo.getNave().movDer();
        console.log('entro al right');
        break;
      case 'up':
        if (this.universo.getProyectil() == null) {
          var bala = this.universo.getNave().disparar();
          this.universo.crearProyectil(bala);
          this.dibujante.dibujarBala(bala);
        }
        break;
    }
    */
  },

  actualizar: function() {
    var balas = this.universo.getBalas();
    for(var i=0;i<this.universo.getBalas().length;i++) {
      var bala = balas[i];
      bala.avanzar();
      if (this.universo.proyectilOut(bala) == true) {
        this.dibujante.destruirBala(bala);
      }
    }
    this.dibujante.redibujar(this.universo.getNave(),this.universo.getBalas());
  }
});

var Dibujante = new Class({
  stage: null,
  layer: null,
  kinNave: null,
  kinBalas: [],
  kinAliens: null,

  initialize: function(nave) {
    // se crea el escenario
    this.stage = new Kinetic.Stage({
      container: 'container',
      width: CANVAS_WIDTH,
      height: CANVAS_HEIGHT
    });

    // se crea la capa
    this.layer = new Kinetic.Layer();

    // se crea la imagen comun de la nave
    var imagen = new Image();
    imagen.src = RUTA_BASE + nave.getImage();

    // se crea la iamgen Kinetic
    this.kinNave = new Kinetic.Image({
      image: imagen,
      x: nave.getPosX(),
      y: nave.getPosY(),
      width: IMG_NAVE_ANCHO,
      height: IMG_NAVE_ALTO,
      name: 'nave'
    });

    this.layer.add(this.kinNave);
    this.stage.add(this.layer);
    this.stage.draw();
  },

  redibujar: function(nave, balas) {
    if (balas != null) {
      for(var i=0;i<balas.length;i++) {
        var bala = balas[i];
        kinBala = this.getKinBalaByTempId(bala.id);
        kinBala.setPosition(bala.getPosX(), bala.getPosY());
      }
    }
    this.kinNave.setPosition(nave.getPosX() - CENTRO_NAVE_X,nave.getPosY());
    this.stage.draw();
  },

  getKinBalaByTempId: function(tempId) {
    for(var i=0;i<this.kinBalas.length;i++) {
      if (this.kinBalas[i].tempId == tempId) {
        return this.kinBalas[i];
      }
    }
    return null;
  },

  dibujarBala: function(bala) {
    var proyectilIMG = new Image();
    proyectilIMG.src = RUTA_BASE + IMG_PROYECTIL;

    kinBala = new Kinetic.Image({
      image: proyectilIMG,
      x: bala.getPosX(),
      y: bala.getPosY(),
      width: IMG_PROY_ANCHO,
      height: IMG_PROY_ALTO,
      name: 'proyectil'
    });
    kinBala.tempId = bala.id;

    this.kinBalas.push(kinBala);
    console.log(kinBala.tempId);

    this.layer.add(kinBala);
    this.stage.draw();
  },

  destruirBala: function(bala) {
    var kinBala = this.getKinBalaByTempId(bala.id);
    kinBala.remove();
    //this.layer.remove(this.kinBala);
    //this.kinBala.remove();
  }

});

var Proyectil = new Class({
  Implements: [Options],

  options: {
    posx: null,
    posy: null,
    imagen: IMG_PROYECTIL,
  },

  initialize: function(options) {
    this.setOptions(options);
  },

  avanzar: function() {
    this.options.posy-=PASO_PROYECTIL;
  },

  getPosX: function() {
    return this.options.posx;
  },

  getPosY: function() {
    return this.options.posy;
  }

});