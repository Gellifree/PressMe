# Tervezés

## A 8 fő játékelem

 - Ugrálás/mozgás (gomb) (X)
 - Pénz, vásárlás dolgok pénzért (X)
 - Boss fightok (X)
 - Küldetések, Több küldetés, választás, időhatár, valamilyen jutalom (X)
 - streak (nXcombó) (X)
 - Ingame stamina (X)
 - Skill tree (X)
 - Küldetések procedurális generálása (szintezés) (X)

## Skill tree tervezés, alapok
```
alapszabályai a játéknak a skillek értelmezéséhez:
    a játék célja az, hogy minél nagyobb rekordot érjünk el a pénzünk egyszeri értékével
    minden percben adózunk a pénzünk aktuális értéke után
    pénzt gombok leütéséből, küldetésekből és bossok után szerzünk
    ha egy boss ellen győzünk, akkor a skillek befolyása nélkül x mennyiségű pénzt kapunk, ha veszítünk, x mennyiséget vesztünk
    az arany (pénz) az egyetlen fizetőeszköz és gyűjthető pont, arannyal lehet skilleket fejleszteni és minden mást venni
    a tabok a skilltreen való eloszlást jelölik
skillek
    karakter
        mozgás
            egy gomb lenyomására dash a cursor irányába
                dash sebessége nő
                dash távolsága nő
                dash cooldown csökken
                esély double dash-re vagy long dash-re
            sebesség
                sebesség nő
        védekezés
            egy gomb lenyomására pajzs, ami egy találatot véd le
                pajzs időtartama nő
                pajzs cooldown csökken

            esély arra, hogy egy specifikus boss támadását kivédjük
                esély növelése

            lyuk ásása, ahol nem kapunk sebzést, ha belebújunk, de csak kétszer bújhatunk bele
                lyuk létezésének időtartama nő
                lyukban egy alkalommal eltölthető idő nő
                lyuk ásásának cooldownja csökken

        támadás
            vissza lehet lőni a bossok lövedékeit x-szer egy harcban
                visszalőtt lövedékek sebbesége nő

            megnő a kard ütésének távolsága
                távolság növekedik

            esély, hogy több ütésnek számít egy ütés
                esély növekszik
    gazdaság
        nyereség növelése
            gomb leütéséből 1-gyel több arany
            bossok elleni győzelem után 3-mal több aranyat nyerünk
            aranyat adó küldetések 5-tel többet adnak


        veszteség csökkentése
            adó 1-gyel kevesebb
            bossok ellni veszítés után 3-mal kevesebb aranyar veszítünk

    speciális
        mozgás, védekezés, támadás, nyereség, veszteség fülek alatt külön, külön minden egy arannyal olcsóbb
```


## Boss alapkoncepciók

A következőkben a harcok alapkoncepciói lesznek láthatóak. A tervek módosíthatóak, funkciók elvethetőek vagy hozzáadhatóak, az egyszerűség irányvonalát elsődleges célkitűzésként figyelembe véve.


### 1.

Egy nagy Gomba karakter, aki nem képes mozogni

Támadásai:
 - Ötágú csillag alakzatban lövedékek kilövése
 - területi sebzés maga körül, pár másodperces "méreg" felhő

Védekezései:
 - Sebzés esetén, kis feltöltődési idő után, ellök bennünket, sebzéssel

### 2.

Egy nagy sárgombóc, aki nagyon lassan mozog.

Támadásai:
 - Egy vonalban kilő egy viszonylag gyorsabban mozgó lövedéket, akár többet is a játékos felé.
 - Eldob egy mini sárszörnyet, aki megpróbál elkapni minket

Védekezései:
 - Az első ütés amit kap, azt teljesen elnyeli a "pajzsa", töltési ideje pár másodperc. (mint malphite passzív)
 - Sebzés esetén, mozgási sebessége nő, és megpróbál arébb menni
 - 20%(?) életerő alatt, a pajzs megváltozik tüskékké, amik visszatükröznek valamennyi sebzést, két ütés kell a tüskék elpusztításához, és a sebzés felét nyelik csak el

### 3.

Egy életre kelt farönk, "alapból" mozgásképtelen

Támadásai:
 - Ostor szerűen a földre csap egy vonalban (mint illaoi)
 - Tud gurulni egy irányba, ami ha eltalál kritikus sebzést okoz
 - Képes gyökereket előhívni a földből, amik fennmaradnak x másodpercig, és az ostor szerű támadást ismétlik, kisebb hatótávval, és sebzéssel

Védekezései:
 - Képes gyógyítani magát időközönként, "legyökerezik", nem gurulhat el eközben
 - 20%(?) életerő alatt, kettéhasad, két kis életerejű mini boss-ra, a mini bossok csak a csáp támadást tudják


## Skill tree tervezés, alapok

- Defensive potions:3.,4.,5.,8.,13.,14.
- Offensive potions: 1.,7.,10.,12.
- Loot potions: 2.,6.,9.,11.



- 1. Speed potion: 25%-al gyorsabb lesz a movement speeded
- 2. Luck potion: 2-szer annyi % esély lesz a boss lootok megkapására
- 3. Heart potion: +1 életed lesz
- 4. Shield potion: A csata során elhasználhatod és utána 15 mp-ig ha sebződsz csak a pajzsod tűnik el és nem vesztessz életet
- 5. Digger potion: Csata során 1-el több lyukat áshatsz
- 6. Coin potion: Ha megsebzel valamit a bossfight során kapsz pénzt
- 7. Giant potion: 25%-kal nagyobb a hitboxod és te, de 25%-kal nagyobbat sebzel
- 8. Teleportation potion: Ha a csata során elhasználod, utána 30 mp-ig max háromszor ahova kattintasz a kurzorral oda tp-zel
- 9. Pain potion: A bossnak 2x annyi élete lesz és 20%-kal gyorsabbak lesznek a bulletek, de 2x annyi pénz és lootot kapsz a csata végén
- 10. Ninja potion: 2 mp-enként abba az irányba amerre legutoljára mozogtál ellő egy Shurikent
-----Shuriken: A pálya széléig repül egyenesen, és akkorát sebez mint te
- 11. Chest potion: A csata során random időben lerak 3 chestet 5 hp-val valahol a pályán, amit ha megölsz kapsz pénzt + vmi lootot
- 12. Rage potion: Ha elég sokszor megütöd a bosst elég gyorsan akkor átváltasz Rage módba 10 mp-ig: +10% sebzés +10% Movement speed +20%-kal gyorsabban tudsz ütni
- 13. Reincarnation potion: Ha elfogy az életed, újra éledsz egy csirkeként(alap movement speed, 1 élet, a többi potion hatása megszünik, nem tudsz a rendes fegyvereddel sebezni, 3 mp-ként kilősz egy tojást a veled ellentétes irányba)
-----Tojás: A pály széléig repül, 1-et sebez, lassabb mint a Shuriken
- 14. Matrix potion: A boss és a bulletei 25%-kal lassabbak lesznek

Alapból egy potiont vihetsz a csatába, de a skill treen fel lehet fejleszteni 3-ig




## itemek
- nike air zoom aphafly next% flyknit - movement speed +
- gördeszka - movement speed ++
- légdeszka - movement speed +++

- ásó - lyuk időtartama és használásának száma +
- ütvefúró - lyuk időtartama és használásának száma ++
- markológép - lyuk időtartama és használásának száma +++

- Pistike fapajzsa - pajzs időtartama +
- armor suit powered by nokia - pajzs időtartama ++
- tankpáncéldarab - pajzs időtartama +++

- rosdás bökő - sebzés +
- extasy - sebzés ++
- sárkányvér az erekben - sebzés +++

- lóhere - szerencse +
- Mari néni rózsafűzére - szerencse ++
- kéményseprű - szerencse +++

- japán samurai - passzív sebzés +
- középkori nyilasság - passzív sebzés ++
- artilery support - psszív sebzés +++
- infinity glove - passzív sebzés ++++

- szögek - enemy rage & loot +
- poloskaraj - enemy rage & loot ++
- nokia 3310 - enemy rage & loot +++

- malacpersely - minden olcsóbb +
- áfamentesség - minden olcsóbb ++
- hamispénz - minden olcsóbb +++

#### unique itemek

- mérgező nyílhegyek - poison effect
- pillanatragasztó - lassítás effect
- felelőtlen cigicsikk - tűz effect
- "erősebb a láncnál a kard" - gyengítés effect
- jobb horog/knock out- kábítás effect
- őserdei indák - mozgásképtelenség effect
