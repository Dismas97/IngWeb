window.addEventListener("load", getManga());

async function getManga(){
    const valores = window.location.search;
    const urlParams = new URLSearchParams(valores);
    const ruta = 'manga/'+urlParams.get('id');

    const manga = await fetch(ruta, {
        method: 'GET',
        headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
        }
    });
    const mangajson = await manga.json();

    resultado = '<div class="card text-bg-dark mb-3 img-fluid style="max-width: 540px;"><div class="row g-0"><div class="col-md-4">'+
                '<img src="'+mangajson.port+'" class="img-fluid rounded-start" ></div><div class="col-md-8">'+
                '<div class="card-body"><h5 class="card-title">'+mangajson.nombre+'</h5>'+
                '<p class="card-text">'+mangajson.descripcion+'</p></div></div></div>'+
                (localStorage.userID=='-1'?'':
                '<div class="accordion accordion-flush" id="acordionSubida">'+
                '<div class="accordion-item card text-white bg-dark"><h2 class="accordion-header" id="flush-headingSubida">'+
                '<button class="accordion-button collapsed card text-white bg-dark" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSubida" aria-expanded="false" aria-controls="flush-collapseSubida">'+
                'Subir Capitulo</button></h2><div id="flush-collapseSubida" class="accordion-collapse collapse" aria-labelledby="flush-headingSubida" data-bs-parent="#acordionSubida">'+
                '<div class="accordion-body">'+
                '<div class="input-group mb-3"><span class="input-group-text" id="basic-addon2">Numero</span><input type="number" min="0" id="num-cap" class="form-control" placeholder="Capitulo numero..." aria-label="Capitulo numero..." aria-describedby="basic-addon2"></div>'+
                '<div class="input-group mb-3"><label class="input-group-text" for="inputGroupFile01">Subir Imagenes</label><input type="file" class="form-control" id="paginas" multiple></div>'+
                '<button class="btn btn-outline-success" onclick="enviar()">Enviar</button></div>'
                +'</div></div>')+
                '</div>';

    var nuevo = document.getElementById("mangaHeader");
    nuevo.innerHTML = resultado;
    var capsAñadidos=[];
    var capitulos = document.getElementById("acordionCapitulos");
    var capitulosMostrar = {}
    for (var i=0; i<mangajson.caps.length; i++){
        if(!capsAñadidos.includes(mangajson.caps[i].num)){
            capitulosMostrar[mangajson.caps[i].num]='';
            capsAñadidos.push(mangajson.caps[i].num);
        }
        capitulosMostrar[mangajson.caps[i].num]+='<a href="visualizado.html?capid='+mangajson.caps[i].id+'&mangaid='+mangajson.id+'">'+mangajson.caps[i].num +' ID:'+mangajson.caps[i].id+'</a><br>';
    }
    capsAñadidos.sort(function(a, b) {
        return a - b;
      });
    for(var i=0; i<capsAñadidos.length; i++){
        capitulos.innerHTML += '<div class="accordion-item card text-white bg-dark"><h2 class="accordion-header" id="flush-heading'+capsAñadidos[i]+'">'+
            '<button class="accordion-button collapsed card text-white bg-dark" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse'+capsAñadidos[i]+'" aria-expanded="false" aria-controls="flush-collapse'+capsAñadidos[i]+'">'+
            capsAñadidos[i]+'</button></h2><div id="flush-collapse'+capsAñadidos[i]+'" class="accordion-collapse collapse" aria-labelledby="flush-heading'+capsAñadidos[i]+'" data-bs-parent="#acordionCapitulos">'+
            '<div class="accordion-body">'+capitulosMostrar[capsAñadidos[i]]+'</div></div></div>';
    }
}
async function cerrarSesion(){
    localStorage.token = null;
    localStorage.esAdmin = 'false';
    localStorage.userID = '-1';
    window.location.href="javascript:window.location.href=window.location.href";
}

async function enviar(){
    const valores = window.location.search;
    const urlParams = new URLSearchParams(valores);
    const ruta = 'manga/'+urlParams.get('id')+'/subida';

    const data = new FormData();
    const input =  document.getElementById('paginas');
    const numCap =  document.getElementById('num-cap').value;

    data.append('usuario', '123');
    data.append('numCap', numCap);

    for (const file of input.files) {
        data.append('paginas',file,file.name);
    }
    fetch(ruta, {
        method: 'POST',
        body: data
    })
    .then((response) => response.json())
    .then((result) => {
        console.log('Archivos enviados:', result);
        location.reload();
    })
    .catch((error) => {
        console.error('Malio Sal:', error);
        location.reload();
    });
}
