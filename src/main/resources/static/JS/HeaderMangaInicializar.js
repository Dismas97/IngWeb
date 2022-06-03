window.addEventListener("load", getManga());

async function getManga(){
    const manga = await fetch('manga/1', {
        method: 'GET',
        headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
        }
    });
    const mangajson = await manga.json();
    resultado = '<div class="container h-100"><div class="row"><div class="col-12 col-md-3 text-center">'
                +'<h1 class="book-type bg-manga mt-4">MANGA</h1><div class="element-image my-2">'
                +'<img class="book-thumbnail " src="'+mangajson.port+'"></div></div>'
                +'<div class="col-12 col-md-9 element-header-content-text"><h1 class="element-title my-2">'+mangajson.nombre
                +'</h1><p class="element-description">'+mangajson.descripcion+'</p></div></div></div>';
    document.getElementById("mangaHeader").innerHTML = resultado;

     var capsAñadidos=[];
    for (var i=0; i<mangajson.caps.length; i++){
    if(capsAñadidos.includes(mangajson.caps[i].num) == false)
        {
        capitulos.innerHTML+=' <div class="opcion"><p> Capitulo: '+mangajson.caps[i].num +'</p><p class="icono"> + </p></div>'
        capsAñadidos.push(mangajson.caps[i].num);
    }

    }

   for (var i=0; i<mangajson.caps.length; i++){
    verCap.innerHTML='<a href="#"> Enlace hacia capitulo </a>'

    }

}


