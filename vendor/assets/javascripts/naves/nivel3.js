/***************************************************************************
* JUEGO DE NAVES EN HTML5
*
* FECHA: 27/8/2012
* AUTOR: ALEJANDRO DE LUCA <contacto@elreplicante.com.ar>
*
* PARTE 3
* NAVE DISPARANDO PROYECTIL, ALIENIGENAS APARECIENDO Y MOVIENDOSE HACIA
* ABAJO 
***************************************************************************/

// Constantes
T_JUEGO = 8;

IMG_NAVE = 'img/nave.png';
IMG_NAVE_ANCHO = 47;
IMG_NAVE_ALTO = 63;
CENTRO_NAVE_X = IMG_NAVE_ANCHO/2 - 6;
PASO_X = 10;

CANVAS_WIDTH = 400;
CANVAS_HEIGHT = 580;

IMG_PROYECTIL = 'img/proyectil-azul.png';
IMG_PROY_ANCHO = 8;
IMG_PROY_ALTO = 8;
PASO_PROYECTIL = 4;

IMG_ALIEN = 'img/alien.png';
IMG_ALIEN_ANCHO = 44;
IMG_ALIEN_ALTO = 70;
T_ALIEN = 3500;

RUTA_BASE = 'http://www.elreplicante.com.ar/ejemplos/nave-html5/naves-3/';
POS_INI_X = 200;
POS_INI_Y = 510;


// evento de carga
window.addEvent('domready', function() {
           
   var imgs = [IMG_NAVE.IMG_PROYECTIL,IMG_ALIEN];

   // asset sirve para precargas las imagenes           
   var images = Asset.images(imgs, {
    onComplete: function(){          
          var juego = new Juego();
          juego.jugar();
       }
   })
   
});   


/***************************************************************************
*                                                                          *
*                          ***** MODELO *****                              *
*                                                                          *                                                                           
/***************************************************************************

/***************************************************************************
* CLASE NAVE                                                               *
***************************************************************************/

var Nave = new Class({
  Implements: [Options],
  
  options: {
    imagen: IMG_NAVE,
    posx: POS_INI_X,
    posy: POS_INI_Y,
  },
  
  initialize: function(options) {
      this.setOptions(options)      
  },
  
  movDer: function() {
      if (this.options.posx < CANVAS_WIDTH-IMG_NAVE_ANCHO+20) 
         this.options.posx+=PASO_X;
  },
  
  movIzq: function() {
      if (this.options.posx > 0)
           this.options.posx-=PASO_X;
  },
  
    disparar: function() {
        return new Proyectil({            
            'posx': this.options.posx,
            'posy': this.options.posy
        });  
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


/***************************************************************************
* CLASE UNIVERSO                                                           *
***************************************************************************/

var Universo = new Class({
    nave: null,
    bala: null,
    aliens: null,
    
    initialize: function() {
        this.nave = new Nave();
        this.bala = null;
        this.aliens = new Array();
    },
    
    crearProyectil: function(bala) {
        this.bala = bala;        
    },
    
    proyectilOut: function() {
        if (this.bala.getPosY() <= 0) {
            this.bala = null;
            return true;
        }
        
        return false;
    },
    
    nuevoAlien: function() {        
        var rnd = Number.random(0,CANVAS_WIDTH-IMG_ALIEN_ANCHO);
        var alien = new Alien({
            'posx': rnd,
            'posy': -IMG_ALIEN_ALTO,
        });
        this.aliens.push(alien);
        
        return alien;       
    },
    
    avanzarAliens: function() {        
      Array.each(this.aliens,function(alien,i) {            
            alien.avanzar();                         
      });        
    }, 
    
    alienAbajo: function() {
        // var aliens = this.aliens;
        var numero = null;
        
        Array.each(this.aliens,function(alien,i) {
            if (alien.getPosY() >= CANVAS_HEIGHT) {
               this.erase(alien);
               this.clean();
               numero = i;
            }
        },this.aliens);

        return numero;
    }, 
    
    hayAliens: function() {        
        if (this.aliens.length == 0)
            return false;
        else
            return true;     
    },

    getProyectil: function() {
        return this.bala;  
    },
    
    getAliens: function() {
        return this.aliens;    
    },
    
    getNave: function() {
        return this.nave;  
    },
});

/***************************************************************************
* CLASE PROYECTIL                                                          *
***************************************************************************/

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
       this.options.posy-=PASO_PROYECTIL          
   },      
   
   getPosX: function() {
       return this.options.posx;              
   },
   
   getPosY: function() {
       return this.options.posy;  
   },    
});


/***************************************************************************
* CLASE ALIEN                                                              *
***************************************************************************/

var Alien = new Class({
    Implements: [Options],
    
    options: {
        posx: null,
        posy: null,
        imagen: IMG_ALIEN,    
    },
    
    initialize: function(options) {
        this.setOptions(options);
    },
    
    avanzar: function() {
        this.options.posy++;  
    },
    
    getPosX: function() {
        return this.options.posx;  
    },
    
    getPosY: function() {
        return this.options.posy;
    },
});


/***************************************************************************
*                                                                          *
*                        ***** CONTROLADOR *****                           *
*                                                                          *                                                                           
/***************************************************************************

/***************************************************************************
* CLASE JUEGO                                                              *
***************************************************************************/

var Juego = new Class({
    
    universo: null,
    intervaloAlien: null,
    intervaloJuego: null, 
    dibujante: null,
    contAlien: null,

    
    initialize: function() {
        this.universo = new Universo();
        this.dibujante = new Dibujante(this.universo.getNave());                       
    },
    
    jugar: function() {
            // se agregan los eventos de teclado
        window.addEvent('keydown',function(event) {
            this.ejecutar(event.key);
        }.bind(this));
        
        this.contAlien = 0;
        this.intervaloJuego = this.actualizar.periodical(T_JUEGO,this);
        this.intervaloAlien = this.generarAlien.periodical(T_ALIEN,this);
    },    
    
    generarAlien: function() {
        var alien = this.universo.nuevoAlien();    
        this.dibujante.dibujarAlien(alien);
    },
        
    ejecutar: function(tecla) {

        switch (tecla) {

            case 'left':
                this.universo.getNave().movIzq();
            break;

            case 'right':
                this.universo.getNave().movDer();
            break;
            
            case 'up':
            
                if (this.universo.getProyectil() == null) {
                    var bala = this.universo.getNave().disparar();                   
                    this.universo.crearProyectil(bala);
                    this.dibujante.dibujarBala(bala);
                }
            break;
        }
    },
    
    actualizar: function() {
        
        // actualizacion del proyectil
        if (this.universo.getProyectil() != null) {
            this.universo.getProyectil().avanzar();
            if (this.universo.proyectilOut() == true) {
                this.dibujante.destruirBala();      
            }
        }
        
        // actualizacion de los aliens
        this.contAlien++;
        if (this.contAlien == 7)
            this.contAlien = 0;            
            if (this.universo.hayAliens()) {  
                this.universo.avanzarAliens();            
        }
        
        var nro = this.universo.alienAbajo();        
        if (nro != null)
            this.dibujante.borrarAlien(nro);
        
        this.dibujante.redibujar(this.universo.getNave(),this.universo.getProyectil(),this.universo.getAliens());
    },
});


/***************************************************************************
*                                                                          *
*                          ***** VISTA *****                               *
*                                                                          *                                                                           
/***************************************************************************

/***************************************************************************
* CLASE DIBUJANTE                                                          *
***************************************************************************/

var Dibujante = new Class({
    stage: null,
    layer: null,
    kinNave: null,
    kinBala: null,
    kinAliens: null,
    
    initialize: function(nave) {                
              
       // se crea el escenario
       this.stage = new Kinetic.Stage({
            container: 'container',
            width: CANVAS_WIDTH,
            height: CANVAS_HEIGHT,
     });
     
     // se crea la capa
     this.layer = new Kinetic.Layer();
     
     // se crea la imagen comun de la nave
     var imagen = new Image();
     imagen.src = RUTA_BASE + nave.getImage();         
     
     // se crea la imagen Kinetic
     this.kinNave = new Kinetic.Image({
            image: imagen,
            x: nave.getPosX(),
            y: nave.getPosY(),
            width: IMG_NAVE_ANCHO,
            height: IMG_NAVE_ALTO,
            name: 'nave',
       });
       
       this.kinAliens = Array();      
       
       this.layer.add(this.kinNave);
       this.stage.add(this.layer);     
       this.stage.draw();
  },
  
  dibujarBala: function(bala) {
     // se crea la imagen comun de la nave
     var proyectilIMG = new Image();
     proyectilIMG.src = RUTA_BASE + IMG_PROYECTIL;             
     
     // se crea la imagen Kinetic
     this.kinBala = new Kinetic.Image({            
            image: proyectilIMG,
            x: bala.getPosX(),
            y: bala.getPosY(),
            width: IMG_PROY_ANCHO,
            height: IMG_PROY_ALTO,
            name: 'proyectil',            
       });
       
       this.layer.add(this.kinBala);
       this.stage.draw();       
  },
  
  dibujarAlien: function(alien) {
     
     var alienIMG = new Image();
     alienIMG.src = RUTA_BASE + IMG_ALIEN;         
     
     // se crea la imagen Kinetic
     kinAlien = new Kinetic.Image({
            image: alienIMG,
            x: alien.getPosX(),
            y: alien.getPosY(),
            width: IMG_ALIEN_ANCHO,
            height: IMG_ALIEN_ALTO,
       });

       this.kinAliens.push(kinAlien);       
       this.layer.add(kinAlien);
  },  
  
  destruirBala: function() {      
      this.layer.remove(this.kinBala);       
  },
  
  borrarAlien: function(nro) {
      var alien = this.kinAliens[nro];
      this.kinAliens.erase(alien);
        this.kinAliens.clean();        
      this.layer.remove(alien);
  },
  
  redibujar: function(nave,bala,aliens) {
      // se reubica el proyectil      
      if (bala != null)
         this.kinBala.setPosition(bala.getPosX(),bala.getPosY());

        // se reubica la nave
      this.kinNave.setPosition(nave.getPosX() - CENTRO_NAVE_X,nave.getPosY());     
      
      // se reubican los aliens
      if (aliens.length > 0) {
            Array.each(this.kinAliens,function(kinAlien,i) {
                kinAlien.setPosition(aliens[i].getPosX(),aliens[i].getPosY());    
            });
        }

        this.stage.draw();
  },
  
});