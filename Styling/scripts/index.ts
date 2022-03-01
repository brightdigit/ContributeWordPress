import './../styles/styles.css';

window.onload = () => {
    const menuButton = document.getElementById('menu')
    const main = document.body.getElementsByTagName("main")[0]
    const navMenu = document.querySelector("body > header > nav") as HTMLElement   
    let menuOffsetHeight : Number 
    document.body.addEventListener('transitionend', (event) => {

        if (document.body.classList.contains('end-active')){
            document.body.classList.remove('more-active')
            document.body.classList.remove('end-active')
            main.style.top = `${menuOffsetHeight}px`
        }
    })
    menuButton.addEventListener("click", () => {       
        if (document.body.classList.contains('more-active')) {
            document.body.classList.add('end-active')
        } else { 
            menuOffsetHeight = navMenu.offsetHeight
            main.style.top = `${menuOffsetHeight}px`
            document.body.classList.add('more-active')
        }
    })
}
