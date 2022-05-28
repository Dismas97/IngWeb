window.addEventListener("load", getManga());

async function getManga(){
    const manga = await fetch('manga/3', {
        method: 'POST',
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
}