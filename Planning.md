# Tervezés

## A 8 fő játékelem

 - Ugrálás/mozgás (gomb) (X)
 - Pénz, vásárlás dolgok pénzért (X)
 - Boss fightok, támadó gomb (X)
 - Küldetések, Több küldetés, választás, időhatár, valamilyen jutalom (X)
 - streak (nXcombó) (X)
 - Ingame stamina (X)
 - Skill tree (X)
 - Küldetések procedurális generálása (szintezés) (X)

## Skill tree tervezés, alapok


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
