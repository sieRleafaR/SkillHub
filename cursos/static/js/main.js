// declarações

let progressBarInterval;
let indiceAtual = 0;
let primeiraVezTrilhas = false
let tempoRetorna = setTimeout(recarregarPagina, 300000)

// declarações fim



// funções



function recarregarPagina() {
    window.location.href = '/'
}
function resetarTimer() {
    clearTimeout(tempoRetorna);
    tempoRetorna = setTimeout(recarregarPagina, 300000);
}

function desativarDescanso() {
    const div = document.getElementById('telaDescanso');
    div.classList.add('sair');

    setTimeout(() => {
      div.style.display = 'none';
      div.classList.remove('sair');
    }, 1000);
}

function ajustarLinhaVertical() {
    const linhaVertical = document.getElementById('linhaVertical');
    const containerCursosText = document.querySelector('.containerCursosText');
    const cursos = document.querySelectorAll('.textoCursosCaixa');
    if (cursos.length > 0) {
        const ultimoCurso = cursos[cursos.length - 1];
        const alturaTotal = ultimoCurso.offsetTop + ultimoCurso.offsetHeight / 2;

        linhaVertical.style.height = alturaTotal + 'px';
    }
}


function atualizarCarrossel() {
    const icones = document.querySelectorAll('.icone');

    // Esconde todos os ícones e reseta a ordem
    icones.forEach((icone) => {
        icone.classList.remove('centro');
        icone.classList.remove('aparente');
        icone.style.order = '0'; // Reseta a ordem
    });

    const totalIcones = icones.length;

    // Define a ordem correta com base no índice atual
    icones[indiceAtual].style.order = '1'; // Central
    icones[indiceAtual].classList.add('centro'); // Centro

    // Ícone à esquerda
    icones[(indiceAtual - 1 + totalIcones) % totalIcones].classList.add('aparente'); // Esquerda
    icones[(indiceAtual - 1 + totalIcones) % totalIcones].style.order = '0'; // Esquerda

    // Ícone à direita
    icones[(indiceAtual + 1) % totalIcones].classList.add('aparente'); // Direita
    icones[(indiceAtual + 1) % totalIcones].style.order = '2'; // Direita
}

function verificarUrl() {
    const hash = window.location.hash;

    if (hash === "#home") {
        indiceAtual = 0;
    } else if (hash === "#cursos") {
        indiceAtual = 1;
    } else if (hash === "#calendario") {
        indiceAtual = 2;
    } else if (hash === "#trilha") {
        indiceAtual = 3;
    } else if (hash === "#historia") {
        indiceAtual = 4;
    } else if (hash === "#formulario") {
        indiceAtual = 5;
    } else if (hash === "#login") {
        indiceAtual = 6;
    }

    atualizarCarrossel(); // Atualiza o carrossel com base no índice
}

function anterior() {
    indiceAtual = (indiceAtual - 1 + 7) % 7; // Atualiza o índice para o ícone anterior
    atualizarCarrossel();
}

function proximo() {
    indiceAtual = (indiceAtual + 1) % 7; // Atualiza o índice para o ícone seguinte
    atualizarCarrossel();
}

// Verifica a URL sempre que houver uma alteração no hash
window.addEventListener('hashchange', verificarUrl);

function carroMove(fase) {
    const carro = document.getElementById("carroTrilha");
    const topAtual = parseInt(window.getComputedStyle(carro).getPropertyValue('top'));

    let posicaoFinal;
    switch (fase) {
        case 1:
            posicaoFinal = 5;
            break;
        case 2:
            posicaoFinal = 35;
            break;
        case 3:
            posicaoFinal = 70;
            break;
        case 4:
            posicaoFinal = 105;
            break;
        case 5:
            posicaoFinal = 140;
            break;
        default:
            posicaoFinal = 5;
    }

    const alturaViewport = window.innerHeight;
    const vh = (topAtual / alturaViewport) * 100;

    // Ajusta a posição do carro
    if (vh < posicaoFinal) {
        carro.style.setProperty('--posicao-inicial', `${topAtual}px`);
        carro.style.setProperty('--posicao-60', `${posicaoFinal + 10}vh`);
        carro.style.setProperty('--posicao-70', `${posicaoFinal + 8}vh`);
        carro.style.setProperty('--posicao-80', `${posicaoFinal + 6}vh`);
        carro.style.setProperty('--posicao-100', `${posicaoFinal}vh`);
    } else {
        carro.style.setProperty('--posicao-inicial', `${topAtual}px`);
        carro.style.setProperty('--posicao-60', `${posicaoFinal - 10}vh`);
        carro.style.setProperty('--posicao-70', `${posicaoFinal - 8}vh`);
        carro.style.setProperty('--posicao-80', `${posicaoFinal - 6}vh`);
        carro.style.setProperty('--posicao-100', `${posicaoFinal}vh`);
    }

    const elementosComClick = document.querySelectorAll('.conteudoFases');
    const sliders = document.querySelectorAll('.slider');

    elementosComClick.forEach(elemento => {
        elemento.style.pointerEvents = 'none';
        elemento.style.opacity = '0.5';
    });

    carro.style.animation = 'carroMoveUm 2s linear forwards';

    sliders.forEach((slider, index) => {
        if (index === fase) {
            setTimeout(() => {
                slider.style.opacity = '1';
                slider.classList.add('active');
                slider.classList.remove('desativado');
            }, 2000);
        } else {
            slider.style.opacity = '0';
            slider.classList.remove('active');
            if (primeiraVezTrilhas) {
                slider.classList.add('desativado');
            }
        }
    });

    setTimeout(() => {
        carro.style.animation = 'none';
        carro.style.top = `${posicaoFinal}vh`;
        elementosComClick.forEach(elemento => {
            elemento.style.pointerEvents = 'auto';
            elemento.style.opacity = '1';
        });
    }, 2000);
}

function trilhasContCursos() {
    const sliders = document.querySelectorAll('.slider');

    sliders.forEach(slider => {
        const slides = slider.querySelector('.slides');
        const inputsContainer = slider.querySelector('.inputsContainer');
        const slideElements = slider.querySelectorAll('.slide');

        slideElements.forEach((slide, index) => {
            if (slideElements.length > 1) {
                const radioId = `slider-${slider.dataset.sliderId}-slide${index + 1}`;
                const label = document.createElement('label');
                label.setAttribute('for', radioId);
                label.textContent = ``;

                const radio = document.createElement('input');
                radio.type = 'radio';
                radio.name = `slider-${slider.dataset.sliderId}`;
                radio.id = radioId;
                if (index === 0) radio.checked = true;

                inputsContainer.appendChild(radio);
                inputsContainer.appendChild(label);

                radio.addEventListener('change', () => {
                    const translateXValue = -index * 100;
                    slides.style.transform = `translateX(${translateXValue}%)`;
                });

                label.addEventListener('click', () => {
                    radio.checked = true;
                    const translateXValue = -index * 100;
                    slides.style.transform = `translateX(${translateXValue}%)`;
                });
            }
        });

        if (slideElements.length > 1) {
            setInterval(() => {
                const currentIndex = [...inputsContainer.querySelectorAll('input[type="radio"]')]
                    .findIndex(radio => radio.checked);
                const nextIndex = (currentIndex + 1) % slideElements.length;
                inputsContainer.querySelectorAll('input[type="radio"]')[nextIndex].checked = true;
                slides.style.transform = `translateX(${-nextIndex * 100}%)`;
            }, 5000);
       }
    });
}


function popupForm(idPop) {
    const popupDiv = document.getElementById(idPop)
    const fundoCinza = document.getElementById('fundoCinza')

    popupDiv.style.display = 'flex'
    fundoCinza.style.display = 'block'
}
function fecharPopUp() {
    const popupObg = document.getElementById('popupObg');
    const popupSobre = document.getElementById('popUpSobre');
    const fundoCinza = document.getElementById('fundoCinza');
    const popupLog = document.getElementById('popupLog');
    const popupFeedback = document.getElementById('popupFeedBack');
    const popupRede = document.getElementById('popupRede');

    if (progressBarInterval) {
        clearInterval(progressBarInterval);
        progressBarInterval = null;
    }

    const progressBarContainer = document.getElementById('progress-bar-container');
    if (progressBarContainer) {
        progressBarContainer.style.display = 'none';
    }

    // Fechar todos os popups, verificando se o elemento existe
    if (popupObg) popupObg.style.display = 'none';
    if (popupLog) popupLog.style.display = 'none';
    if (popupSobre) popupSobre.style.display = 'none';
    if (popupFeedback) popupFeedback.style.display = 'none';
    if (popupRede) popupRede.style.display = 'none';

    // Esconder o fundoCinza após o tempo
    if (fundoCinza) fundoCinza.style.display = 'none';
}

function elevarFooter() {
    const textoMais = document.getElementById("textoMaisFooter");
    const textoMenos = document.getElementById("textoMenosFooter");
    const footer = document.getElementById("footer")
    const setas = document.getElementById("setasFooter")
    const footerBaixo = document.getElementById("footerBaixo")

    if (footer.style.height === '35vh') {
        const scrollUpPosition = window.scrollY - (35 * window.innerHeight / 100);
        window.scrollTo({
            top: scrollUpPosition,
            behavior: 'smooth'
        });
        textoMais.classList.add('textoAnimaSobe')
        textoMenos.classList.add('textoAnimaSobe')
        textoMais.classList.remove('textoAnimaDesce')
        textoMenos.classList.remove('textoAnimaDesce')
        setTimeout(() => {
            footerBaixo.style.display = "none"
            footer.style.height = '5vh'
            setas.style.rotate = '0deg'
        }, 400);
        setTimeout(() => {
            textoMais.style.transform = "translateY(0)"
            textoMenos.style.transform = "translateY(0)"
        }, 1000);
    } else {
        footer.style.height = '35vh'
        footerBaixo.style.display = "flex"
        setas.style.rotate = '180deg'
        textoMais.classList.add('textoAnimaDesce')
        textoMenos.classList.add('textoAnimaDesce')
        textoMais.classList.remove('textoAnimaSobe')
        textoMenos.classList.remove('textoAnimaSobe')
        window.scrollTo({
            top: document.documentElement.scrollHeight - document.documentElement.clientHeight,
            behavior: 'smooth'
        });
        setTimeout(() => {
            textoMais.style.transform = "translateY(-100%)"
            textoMenos.style.transform = "translateY(-100%)"
        }, 1000);
    }
}


function ativarSegundaHeader() {
    const primeiraHeader = document.getElementById('primeiraHeader')
    const segundaHeader = document.getElementById('segundaHeader')

    primeiraHeader.style.zIndex = '20'
    segundaHeader.style.zIndex = '21'
    segundaHeader.classList.add('headerOn');
    segundaHeader.classList.remove('headerOff');
    primeiraHeader.classList.remove('headerOn');
    primeiraHeader.classList.add('headerOff');
}
function ativarPrimeiraHeader() {
    const primeiraHeader = document.getElementById('primeiraHeader')
    const segundaHeader = document.getElementById('segundaHeader')

    primeiraHeader.style.zIndex = '21'
    segundaHeader.style.zIndex = '20'
    primeiraHeader.classList.add('headerOn');
    primeiraHeader.classList.remove('headerOff');
    segundaHeader.classList.remove('headerOn');
    segundaHeader.classList.add('headerOff');

}

function verificarTrocaHeader() {
    const distancia8vh = window.innerHeight * 0.08;

    if (window.scrollY > distancia8vh) {
        ativarSegundaHeader();
    }
    else{
        ativarPrimeiraHeader()
    }
}

function gerarBarraDeProgresso(totalTime) {
    const progressBarContainer = document.getElementById('progress-bar-container');
    const progressBar = document.getElementById('progress-bar');

    progressBarContainer.style.display = 'block';

    let elapsedTime = 0;

    const progressBarInterval = setInterval(() => {
        elapsedTime += 0.05;

        const widthPercentage = 100 - (elapsedTime / totalTime) * 100;
        progressBar.style.width = `${widthPercentage}%`;

        if (elapsedTime >= totalTime) {
            clearInterval(progressBarInterval);
            progressBar.style.width = '0%';

            // Redirecionar para a página inicial
            fecharPopUp()// Certifique-se de que a URL está correta
        }
    }, 50);
}

function animateLoadingBar(numero) {
    const loadingBar = document.querySelectorAll('.loadingBar');
    const popupErro = document.querySelectorAll('.erroEnvioForm');

    if (popupErro.length > 0) {
        popupErro[numero].style.display = "flex";
        popupErro[numero].style.animation = "entradaPopupErro 1s forwards";

        let width = 100;
        const interval = setInterval(() => {
            if (width <= 0) {
                clearInterval(interval);
                popupErro[numero].style.animation = "saidaPopupErro 600ms forwards";

                setTimeout(() => {
                    popupErro[numero].style.display = "none";
                }, 600);
            } else {
                width -= 0.2;
                loadingBar[numero].style.width = width + '%';
            }
        }, 10);
    }
}

function validarFormulario(event) {
    event.preventDefault(); // Prevent the default form submission

    const nome = document.getElementById('letras');
    const email = document.getElementById('email');
    const telefone = document.getElementById('telefone');

    const nomeRegex = /^[a-zA-Z\s]+$/; // Allow spaces for full names
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    const telefoneRegex = /^\(?\d{2}\)? ?9?\d{4}-?\d{4}$/;

    let isValid = true;
    let errorMessage = ''; // Store the first error message

    // Clear previous error messages
    const errorElements = document.querySelectorAll('.erroEnvioForm');
    errorElements.forEach(element => element.remove());

    // Validate Nome
    if (!nomeRegex.test(nome.value)) {
        isValid = false;
        errorMessage = 'Nome inválido. Apenas letras são permitidas.';
        nome.classList.add('error');
    } else {
        nome.classList.remove('error');
    }

    // Validate Email
    if (!emailRegex.test(email.value)) {
        isValid = false;
        if (!errorMessage) {
            errorMessage = 'Email inválido. Verifique o formato.';
        }
        email.classList.add('error');
    } else {
        email.classList.remove('error');
    }

    // Validate Telefone
    if (!telefoneRegex.test(telefone.value)) {
        isValid = false;
        if (!errorMessage) {
            errorMessage = 'Telefone inválido. Verifique o formato.';
        }
        telefone.classList.add('error');
    } else {
        telefone.classList.remove('error');
    }

    // Show the first error message if any
    if (errorMessage) {
        showError(errorMessage);
    }

    // If all fields are valid
    if (isValid) {
        clearAllInputs();
        popupForm('popupObg');
        gerarBarraDeProgresso(10);
    } else {
        animateLoadingBar(1);
    }
}

function showError(message) {
    const errorContainer = document.createElement('div');
    errorContainer.className = 'erroEnvioForm';

    // Add your SVG icons for error and close button
    const svgError = '<svg class="svgErro">...</svg>'; // Replace with your actual SVG
    const closeIcon = '<svg class="fecharDivErro" onclick="this.parentElement.parentElement.style.display=\'none\'">...</svg>'; // Replace with your actual SVG
    const textoErro = `<div class="textoErro">${message}</div>`;

    errorContainer.innerHTML = `${svgError}${textoErro}${closeIcon}`;

    document.body.appendChild(errorContainer);
    errorContainer.style.display = 'flex'; // Show the error popup
}


function validarLogin(){
        const nome = document.getElementById('nome').value;
        const senha = document.getElementById('senha').value;

        const nomeRegex = /^[a-zA-Z]+$/;
        const senhaRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

        const nomeValido = nomeRegex.test(nome);
        const senhaValida = senhaRegex.test(senha);

        if (nomeValido && senhaValida) {
            clearAllInputs()
            popupForm('popupLog');
            gerarBarraDeProgresso(6);
        } else {
            animateLoadingBar(0)
        }
}

function clearAllInputs() {
    const inputs = document.querySelectorAll('input, textarea');

    inputs.forEach(input => {
        if (input.type !== 'radio') {
            input.value = '';
        } else {
            input.checked = false;
        }
    });
}

function ajustarLinhaVertical() {
    const linhaVertical = document.getElementById('linhaVertical');
    const containerCursosText = document.querySelector('.containerCursosText');
    const cursos = document.querySelectorAll('.textoCursosCaixa');
    const alturaViewport = window.innerHeight;

    const valorEmPx = (8 / 100) * alturaViewport;
    if (cursos.length > 0) {
        const ultimoCurso = cursos[cursos.length - 1];
        const alturaTotal = ultimoCurso.offsetTop + ultimoCurso.offsetHeight / 2;

        linhaVertical.style.height = alturaTotal - valorEmPx + 'px';
    }
}

function verificarAttPage() {
    verificarTrocaHeader()
}
function moverBola() {
    const circle = document.getElementById('circle');
    const mouseX = event.clientX;
    const mouseY = event.clientY;

    // Atualiza a posição do círculo com base na posição do mouse
    circle.style.left = `${mouseX}px`;
    circle.style.top = `${mouseY}px`;
}
function popupSocial(rede) {
    const popupRede = document.querySelector('.popupRede');
    const fundoCinza = document.getElementById('fundoCinza')
    popupRede.querySelector('h1').textContent = rede + ' do senai';
    popupRede.querySelector('img').src = 'static/assets/qrcode/' + rede + '_qrcode.png';
    popupRede.style.display = 'flex'
    fundoCinza.style.display = 'block'
}
function secHistoria(secao) {
    switch (secao) {
        case 1:
            valorMove = -70;
            break;
        case 2:
            valorMove = -140;
            break;
        case 3:
            valorMove = -300;
            break;
        case 4:
            valorMove = -200
            break;
        default:
            valorMove = 5;
    }
    const posicaoFinal = window.scrollY - (valorMove * window.innerHeight / 100);
    window.scrollTo({
        top: posicaoFinal,
        behavior: 'smooth'
    });
}
// Vai descer?
//Não!
function vaiSubir() {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
}


// funções fim



// call

window.onhashchange = verificarAttPage;

window.onload = verificarAttPage;

window.addEventListener('scroll', function() {
    verificarTrocaHeader()
    resetarTimer()
});
document.addEventListener('mousemove', function(event) {
    verificarTrocaHeader()
    resetarTimer(event);
    moverBola(event);
});
document.addEventListener('click', resetarTimer);
document.addEventListener('keypress', resetarTimer);

// call fim

