
function adicionarCursos() {
    const container = document.querySelector('.testeeee'); // Seleciona a div .testeeee

    for (let i = 1; i <= 10; i++) {
        const novoCurso = document.createElement('div'); // Cria um novo div
        novoCurso.className = 'textoCursosCaixa'; // Adiciona a classe

        // Define o conteúdo do novo div
        novoCurso.innerHTML = `
            <h2>Etapa ${i+4}</h2>
            <p>Os cursos disponíveis nesta etapa são Curso A, Curso B, Curso C.</p>
        `;

        container.appendChild(novoCurso); // Adiciona o novo div ao container
        console.log("foi")
    }
    ajustarLinhaVertical()
}