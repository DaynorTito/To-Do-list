const username = document.getElementById('username')
const password = document.getElementById('password')
const button = document.getElementById('button')

button.addEventListener('click', (e) => {
    e.preventDefault()
    if (validarEmail(username.value) && validPassword(password.value)) {
        alert("Correct inputs")
    } else {
        alert("incorrect inputs")
    }
})

function validarEmail(email) {
    var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  
    return regex.test(email);
}

function validPassword(password) {
    return password.length >= 8 
}
  