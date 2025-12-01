document.addEventListener('DOMContentLoaded', () => {
    const languageBtn = document.querySelector('.language-btn');
    const languageDropdown = document.querySelector('.language-dropdown');

    // Öffne und schließe das Dropdown-Menü beim Klicken
    languageBtn.addEventListener('click', (event) => {
        languageDropdown.style.display = languageDropdown.style.display === 'block' ? 'none' : 'block';
        event.stopPropagation(); // Verhindert das Schließen, wenn man innerhalb des Dropdowns klickt
    });

    // Schließe das Dropdown, wenn irgendwo außerhalb geklickt wird
    window.addEventListener('click', () => {
        languageDropdown.style.display = 'none';
    });
});


function handleFormSubmit(event) {
    event.preventDefault();  // Verhindert das Standardabsenden des Formulars

    // Hier kannst du die Formulardaten sammeln und verarbeiten
    const form = event.target;
    const name = form.name.value;
    const email = form.email.value;
    const message = form.message.value;

    console.log("Name:", name);
    console.log("Email:", email);
    console.log("Message:", message);

    // Bestätigungsnachricht anzeigen
    alert("Thank you for your message! We will get back to you soon.");

    // Optional: Leere die Formulardaten
    form.reset();
}
document.querySelector('.scroll-right').addEventListener('click', function () {
    const offerCards = document.querySelector('.offer-cards');
    offerCards.scrollBy({ left: 300, behavior: 'smooth' });  // Scrollt 300px nach rechts
});

document.querySelector('.scroll-left').addEventListener('click', function () {
    const offerCards = document.querySelector('.offer-cards');
    offerCards.scrollBy({ left: -300, behavior: 'smooth' });  // Scrollt 300px nach links
});
let currentIndex = 0;
const offers = document.querySelectorAll('.offer-card');
const totalOffers = offers.length;

function showNextOffer() {
    offers[currentIndex].style.display = 'none';
    currentIndex = (currentIndex + 1) % totalOffers;  // Loop back to the first offer
    offers[currentIndex].style.display = 'block';
}

setInterval(showNextOffer, 3000);  // Change offer every 3 seconds

