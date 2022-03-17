import './../styles/styles.css';

declare global {
    interface Window {
      gtag: (...args: any[]) => void
      dataLayer: Record<string, any>
    }
  }

function updateMaskIcon(darkMode? : Boolean) {
    
    const isDarkMode = darkMode ?? window.matchMedia('(prefers-color-scheme: dark)').matches
    console.log(isDarkMode)
    const maskIcon = document.getElementById("mask-icon")
    const lightModeHref = document.getElementById("apple-light-mode-icon")?.getAttribute("href")
    const darkModeHref = document.getElementById("apple-dark-mode-icon")?.getAttribute("href")
    if (isDarkMode && typeof darkModeHref == 'string') {
        maskIcon?.setAttribute("href", darkModeHref)
        maskIcon?.setAttribute("color", "#f9e231")
    } else if (typeof lightModeHref == 'string') {
        maskIcon?.setAttribute("href", lightModeHref)
        maskIcon?.setAttribute("color", "#000000")
    }
}
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
    menuButton?.addEventListener("click", () => {       
        if (document.body.classList.contains('more-active')) {
            document.body.classList.add('end-active')
        } else { 
            menuOffsetHeight = navMenu.offsetHeight
            main.style.top = `${menuOffsetHeight}px`
            document.body.classList.add('more-active')
        }
    })
    updateMaskIcon()
}

window.matchMedia('(prefers-color-scheme: dark)')
.addEventListener('change', (event) => {
    updateMaskIcon(event.matches)
})


window.dataLayer = window.dataLayer || [];
function gtag(){window.dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', 'G-K3MSJ0CTMJ');