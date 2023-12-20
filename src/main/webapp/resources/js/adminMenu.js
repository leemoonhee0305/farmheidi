document.addEventListener('DOMContentLoaded', function() {
    const toggleBtn = document.querySelector('.navbar-toggleBtnAdminMENU');
    const menu = document.querySelector('.navbar-menuAdminMENU');
    const navbar = document.querySelector('.navbarAdminMENU');

    toggleBtn.addEventListener('click', () => {
        menu.classList.toggle('active');
        navbar.classList.toggle('active');
    });
});