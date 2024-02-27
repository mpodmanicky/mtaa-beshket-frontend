# Beshket
## Frontend pre Beshket aplikaciu
MTAA, FIIT Bratislava
### Tim:
Kuklych Serhii, Podmanicky Martin
### Pouzite technologie:
 - Kotlin Multiplatfrom
 - PostgreSQL
 - Docker/Kubernetes
### Povinne volitelne casti:
- GPS
- Podpora pre smartwatch
- Background task scheduling
### Bonusove ulohy:
- Generovanie dokumentacie z anotacii v kode
# Akceptacne testy
## Test 1 - Profil
### Vstupne podmienky: 
Pouzivatel aplikacie je prihlaseny a aplikacia ma pripojenie na internet
### Vystupne podmienky:
V aplikacii sa zmeni meno pouzivatela a ulozi sa do databazy. Meno sa nasledne bude zobrazovat na profile
### Postup
1. Pouzivatel stlaci ikonu svojho profilu, ktora je na domovskej obrazovke
2. Pouzivatel stlaci na pole s menom
3. Zvyrazni sa pole a zobrazi sa klavesnica s moznost vymazat meno
4. Pouzivatel napise nove meno
5. Pouzivatel stlaci tlacidlo Save Changes
6. Po uspesnom zmeneni sa zobrazi sprava o uspesnom zmeneni mena a pouzivatel ostane na obrazovke upravy profilu.
### Vysledok:
Pass/Fail
## Test 2 - Nastavenia
### Vstupne podmienky: 
Pouzivatel aplikacie je prihlaseny a aplikacia ma pripojenie na internet
### Vystupne podmienky:
V aplikacii sa zmeni pouzivatelske rozhranie na tmavy alebo svetly rezim
### Postup
1. Pouzivatel stlaci ikonu nastaveni, ktora je na domovskej obrazovke vpravo hore
2. Zobrazi sa obrazovka nastaveni, ktora sa vyroluje zprava
3. V moznostiach najde tlacidlo dark-mode a zaklikne ho
4. Zmeni sa pouzivatelske rozhranie na tmavy rezim.
5. Pouzivatel ostane na obrazovke nastaveni.
### Vysledok:
Pass/Fail
## Test 3 - Tikety
### Vstupne podmienky: 
Pouzivatel aplikacie je prihlaseny a aplikacia ma pripojenie na internet
### Vystupne podmienky:
V aplikacii sa zobrazi naskenovany listok a pribudne v databaze listkov pouzivatela.
### Postup
1. Pouzivatel stlaci ikonu listka v spodnej liste na obrazovke
2. Zobrazi sa obrazovka s listkami pouzivatela
3. Pouzivatel stlaci tlacidlo s ikonou QR kodu na spodku obrazovky
4. Zapne sa kamera a naskenuje sa QR kod listku
5. Pouzivatelovi sa po uspesnom naskenovani zobrazi sprava o uspesnom zapisani listka do profilu a databazy.
6. Ostane na obrazovke s listkami
### Vysledok:
Pass/Fail
## Test 4 - Kosik
### Vstupne podmienky: 
Pouzivatel aplikacie je prihlaseny a aplikacia ma pripojenie na internet
### Vystupne podmienky:
V aplikacii v casti kosik sa odstrani dana polozka a zmeni sa celkova cena v kosiku.
### Postup
1. Pouzivatel stlaci ikonu kosika v spodnej liste obrazovky
2. Zobrazi sa obrazovka kosika spolu s obsahom
3. Stlaci moznost "edit" v pravom rohu obrazovky
4. Zobrazia sa ikony "-" pri jednotlivych polozkach v kosiku
5. Pouzivatel stlaci ikonu  "-" a polozka sa odstrani
6. Po uspesnom odstraneni z kosika zmizne a pouzivatel ostane v rezime upravy s moznostou ukoncenia uprav kosiku.
7. Ked je uzivatel spokojny s upravami, skonci so zmenami kosiku stlacenim tlacidla "x", ktore sa nachadza tam, kde sa nachadzalo tlacidlo "edit"
8. Pouzivatel ostane v kosiku a zmeni sa celkova cena kosiku
### Vysledok:
Pass/Fail
## Test 5 - Registracia
### Vstupne podmienky: 
Pouzivatel, ktory nie je registrovany otvori aplikaciu a zobrazi sa mu obrazovka pre vyber prihlasenia alebo registracie
### Vystupne podmienky:
Pouzivatel sa uspesne zaregistruje a jeho udaje budu zapisane do databazy
### Postup
1. Pouzivatel si vyberie moznost registracie ako pouzivatel
2. Pouzivatel vyplni vyplni formular (meno, priezvisko, email, datum narodenia, heslo)
3. Pouzivatel zada svoje heslo dvakrat, tak aby sa zhodovalo
4. Stlaci na tlacidlo register
5. Po uspesnej registracii sa mu zobrazi upozornenie o uspesnej registracii a po troch sekundach ho presunie na domovsku obrazovku
### Vysledok:
Pass/Fail
## Test 6 - Pridanie podujatia
### Vstupne podmienky: 
Pouzivatel aplikacie je prihlaseny ako organizator a aplikacia ma pripojenie na internet
### Vystupne podmienky:
V aplikacii sa na domovskej obrazovke organizatora vytvori nove podujatie a zapise sa do databazy dostupnych podujati
### Postup
1. Pouzivatel stlaci ikonu "+" na domovskej obrazovke v spodnej casti
2. Zobrazi sa mu obrazovka s formularom
3. Do formulara vyplni udaje o podujati
4. Po vyplneni formulara sa zobrazi tlacidlo "Add Event"
5. Pouzivatel stlaci tlacidlo "Add Event" a po uspesnom pridani sa zobrazi upozornenie o uspesnom pridani eventu.
6. Po troch sekundach pouzivatela presunie na domovsku obrazovku
### Vysledok:
Pass/Fail
## Test 7 - Pridanie do kosika
### Vstupne podmienky:
Pouzivatel je prihlaseny do aplikacie a ma pristup na internet
### Vystupne podmienky:
V kosiku pouzivatela bude zobrazene podujatie, ktore si chce kupit
### Postup
1. Pouzivatel si vyhlada na domovskej obrazovke podujatie, ktore si chce kupit
2. Zobrazia sa vsetky podujatia, ktore zodpovedaju hladanemu vyrazu
3. Klikne na kartu zelaneho podujatia
4. Zobrazi sa obrazovka o detailoch podujatia
5. Pouzivatel stlaci na tlacidlo "Add to cart" na spodku obrazovky
6. Po uspesnom pridani do kosika sa zobrazi upozornenie o pridani podujatia do kosika
7. Pouzivatel ostane na obrazovke detailov o podujati
### Vysledok:
Pass/Fail

## Test 1 Fail - Zaplatit prazdny kosik
### Vstupne podmienky: 
Pouzivatel aplikacie je prihlaseny a aplikacia ma pripojenie na internet
### Vystupne podmienky:

### Postup

### Vysledok:
Pass/Fail
## Test 2 Fail - Registracia bez WiFi
### Vstupne podmienky: 
Pouzivatel nie je registrovany a nema pripojenie na internet
### Vystupne podmienky:

### Postup

### Vysledok:
Pass/Fail
## Test 3 - Vypredane podujatie
### Vstupne podmienky: 
Pouzivatel aplikacie je prihlaseny a aplikacia ma pripojenie na internet
### Vystupne podmienky:

### Postup

### Vysledok:
Pass/Fail