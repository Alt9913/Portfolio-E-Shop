document.addEventListener('DOMContentLoaded', () => {
    // Dropdown-Menü öffnen und schließen
    const languageBtn = document.querySelector('.language-btn');
    const languageDropdown = document.querySelector('.language-dropdown');
    
    if (languageBtn && languageDropdown) {
        languageBtn.addEventListener('click', (event) => {
            languageDropdown.style.display = languageDropdown.style.display === 'block' ? 'none' : 'block';
            event.stopPropagation(); // Verhindert das Schließen, wenn man innerhalb des Dropdowns klickt
        });

        window.addEventListener('click', () => {
            languageDropdown.style.display = 'none';  // Dropdown schließen, wenn außerhalb geklickt wird
        });
    }

    // Scroll-Funktionen für Angebote
    const scrollRightBtn = document.querySelector('.scroll-right');
    const scrollLeftBtn = document.querySelector('.scroll-left');
    const offerCards = document.querySelector('.offer-cards');

    if (scrollRightBtn && scrollLeftBtn && offerCards) {
        scrollRightBtn.addEventListener('click', () => {
            offerCards.scrollBy({ left: 300, behavior: 'smooth' });  // Scrollt 300px nach rechts
        });

        scrollLeftBtn.addEventListener('click', () => {
            offerCards.scrollBy({ left: -300, behavior: 'smooth' });  // Scrollt 300px nach links
        });
    }

    // Formular-Submit-Handler
    const travelForm = document.getElementById('travel-form');
    if (travelForm) {
        travelForm.addEventListener('submit', (event) => {
            event.preventDefault();  // Verhindert das Standardabsenden des Formulars

            const from = document.getElementById('from').value;
            const to = document.getElementById('to').value;
            const travelType = document.getElementById('travel-type').value;

            if (from && to) {
                const googleMapsURL = `https://www.google.com/maps/dir/?api=1&origin=${encodeURIComponent(from)}&destination=${encodeURIComponent(to)}&travelmode=${travelType}`;
                window.location.href = googleMapsURL;  // Weiterleitung zu Google Maps
            } else {
                alert("Please fill in both the departure and destination locations.");
            }
        });
    }

    // Hot Offers laden
    async function loadHotOffers() {
        try {
            const response = await fetch("http://192.168.134.128:8000/hot-offers");  // Verwende die richtige URL
            if (!response.ok) {
                throw new Error(`HTTP-Fehler! Status: ${response.status}`);
            }
            const offers = await response.json();
            
            const container = document.getElementById("offers-container");
            container.innerHTML = "";  // Alte Angebote löschen

            offers.forEach((offer) => {
                const offerHTML = `
                    <div class="offer">
                        <a href="${offer.link || '#'}" target="_blank">
                            <img src="${offer.picture_path || 'assets/default.jpg'}" alt="${offer.name}">
                        </a>
                        <div class="offer-info">
                            <h3>${offer.name}</h3>
                            <p>Location: ${offer.city || ''}, ${offer.country_name || ''}</p>
                            <p>Price: €${offer.price.toFixed(2)} per night</p>
                        </div>
                    </div>
                `;
                container.insertAdjacentHTML("beforeend", offerHTML);
            });
        } catch (error) {
            console.error("Fehler beim Laden der Hot Offers:", error);
            const container = document.getElementById("offers-container");
            if (container) {
                container.innerHTML = "<p>Die Angebote konnten nicht geladen werden. Überprüfe die Konsole für Details.</p>";
            }
        }
    }

    // Hot Offers beim Laden der Seite aufrufen
    loadHotOffers();  // Jetzt wird die Funktion nach dem Laden des DOM aufgerufen
});
