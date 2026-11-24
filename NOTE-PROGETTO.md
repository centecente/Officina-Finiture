# Officina Finiture

Fa parte della suite **Officina**: strumenti di progettazione che sono ciascuno una pagina web sola, si aprono con doppio
clic e non vanno installati. Stesso banco di lavoro di Officina Manopole e Officina Griglie (linguette a sinistra, pezzo al
centro, scheda a destra, fondo grigio con rilievi morbidi); ogni officina ha il suo colore: qui il prugna (`#7d3c6b`).

Strumento CMF (Color, Material, Finish): si mettono sul banco i pezzi fatti con le altre officine, o frontali e mobili
semplici, e li si «veste» con materiali e finiture reali, si confrontano le varianti sotto luci diverse e si esporta una
scheda per il cliente o per il fornitore. Versione 1.1.1.

## File

| File | A cosa serve |
|---|---|
| `finiture.html` | Il programma. Carica le librerie 3D dalla rete. |
| `finiture-offline.html` | Lo stesso programma con le librerie incorporate: funziona senza rete. **Generato, non modificarlo a mano.** |
| `crea-versione-offline.ps1` | Rigenera `finiture-offline.html` a partire da `finiture.html` e da `lib/`. Va rilanciato dopo ogni modifica. |
| `lib/` | Le librerie 3D (three 0.160.0 e OrbitControls). |
| `.github/workflows/verifica.yml` | A ogni modifica su main, sul runner del PC (Windows, self-hosted): controlla, rigenera la versione senza rete e pubblica una Release «finiture-N». |

## Scelte fatte all'inizio (risposte di Filippo)

- **Oggetti**: tutti — diffusori, synth e pedali, ampli e hi-fi, altro audio. Da qui i sette modelli pronti.
- **Uso**: decidere, presentare al cliente e dare specifiche al fornitore. Da qui la scheda in due versioni.
- **Materiali usati davvero**: alluminio anodizzato, polvere RAL, ottone e rame, legno, tessuto e gomma, più poliurea e
  plastica. Sono le famiglie in testa alla libreria; vetro, acrilico, pelle e vinile ci sono comunque.

## Cosa fa

- **Banco di composizione** (linguetta Banco): frontali e pannelli, scatole e mobili (con faccia frontale separata),
  manopole (presa liscia, zigrinata, scanalata, a lobi; gonna; faccia piatta, concava o bombata; calotta separata; indice),
  griglie in lamiera (rettangolari, tonde, a stadio; cinque forature; bombatura), griglie in tessuto su telaio,
  altoparlanti, componenti (footswitch, levetta, LED acceso, jack, piedino). Posizione e rotazione di ogni pezzo,
  duplica, togli.
- **STL divisi in parti** (dalla 1.1.0): i corpi separati dentro un STL (mobile, cono, cestello, viti...) diventano parti
  che si scelgono e si vestono una per una; le copie identiche (stesso numero di triangoli, stesse misure, stesso colore)
  diventano una parte sola «(× 6)»; oltre 32 parti, le più piccole si raccolgono in «Altre parti piccole». Se l'STL ha i
  colori per faccia (Materialise, SolidWorks, VisCAM) ogni parte parte dal suo colore del CAD. Le parti si rinominano.
  Ctrl+clic (⌘ su Mac), sui pulsanti o nella vista, sceglie più parti insieme: ogni modifica vale per tutte; «Tutte» e
  «Stesso colore del CAD» per sceglierle in un colpo. Più STL aperti insieme restano nelle posizioni del CAD.
- **Verticale del file**: gli STL nuovi si leggono con l'asse Z verso l'alto (Fusion, SolidWorks, Rhino, Onshape) e
  arrivano in piedi sul piano; nel Banco si passa ad asse Y. Pulsanti «Gira di 90° sul piano», «Ribalta di 90°»,
  «Appoggia sul piano»; nella vista Maiusc+trascina sposta un pezzo sul piano.
- **Banco a quota zero** (dalla 1.1.1): il banco è un piano fisso; ogni pezzo aggiunto o aperto è «Appoggiato al banco»
  (il suo punto più basso, calcolato sui vertici con la rotazione attuale, resta a zero anche ruotandolo o cambiando le
  misure). Togliendo la spunta il pezzo si alza a mano (manopole sui pannelli, griglie sul mobile, chassis sui piedini).
- **Pezzi dalle altre officine** («Apri» o trascinando il file sulla vista): `.stl` qualsiasi (normali morbide sotto i 35°,
  spigoli vivi sopra), `.json` di Officina Manopole (diventa una manopola con le stesse misure) e di Officina Griglie
  (contorno, foro, passo, foratura, spessore, materiale e finitura). Le maniglie a T e i galletti di Manopole vanno portati
  come STL. Le forature di Griglie che qui non esistono (motivo disegnato, girasole, disegno importato) si vedono come
  fori tondi sfalsati con lo stesso foro e passo, e lo dice.
- **Libreria di finiture** in 3D con `MeshPhysicalMaterial`: metallicità, rugosità, clearcoat, anisotropia per lo
  spazzolato e il tornito concentrico, sheen per i tessuti, trasmissione per vetro e acrilico. Ogni finitura ha la sua
  trama procedurale ripetibile, alla sua misura vera in millimetri (le coordinate di trama sono in mm su tutti i pezzi).
  - Alluminio anodizzato: opaco, lucido, sabbiato, spazzolato, tornito concentrico, **solo nei colori che una vasca dà
    davvero** (naturale, champagne, bronzi, nero, titanio, oro, rosso, blu, verde, viola, arancio, rosa), con il segno
    di quelli che sbiadiscono al sole. Niente bianco.
  - Polvere: liscia, goffrata, bucciata, raggrinzante, metallizzata, con la brillantezza in GU.
  - Laccatura liquida: opaca, satinata, lucida, lucido pianoforte, soft-touch, metallizzata.
  - Ottone e rame: lucido, satinato, spazzolato, brunito, patinato, verderame; protezione vernice, cera o nudo.
  - Inox (spazzolato, specchio, sabbiato, PVD nero e oro), galvanica (cromo, nichel satinato, cromo nero, ottonatura).
  - Legno: nove essenze (noce canaletto, rovere, rovere fumé, frassino, teak, ciliegio, acero, wengé, betulla) con olio,
    cera, vernice opaca o lucida, direzione della venatura e tinta.
  - Tessuto (maglia acustica, trama larga sale e pepe, jersey, feltro), pelle, microfibra, vinile goffrato tipo tolex,
    gomma e silicone, TPE, plastica a stampo (SPI A2, SPI B2, VDI 3400) e stampa 3D (filamento, MJF), poliurea,
    vetro (trasparente, satinato, fumé, retroverniciato), acrilico (trasparente, opale, colorato, satinato), membrane.
  - Marcature: incisione laser, serigrafia, tampografia, stampa UV, incisione e riempimento. Il colore del laser lo
    decide la finitura sotto (sull'anodizzato toglie il colore e lascia l'alluminio chiaro; sull'inox scurisce; sul legno brucia).
- **Colori**: tavolozza RAL Classic (circa cento codici, valori sRGB indicativi) con ricerca, colore libero con il RAL più
  vicino e la distanza ΔE2000, campi per Pantone e NCS.
- **Scritte e scale**: sui frontali e sulle facce delle scatole si disegnano da sole la scala a 300° e il nome attorno a ogni
  manopola che ci sta sopra; si stampano o incidono con la marcatura scelta.
- **Luce e ambienti**: studio fotografico, luce da finestra, salotto caldo di sera, fondo nero. Ambienti costruiti come
  scene e filtrati (PMREM), senza file esterni; luce girevole, esposizione, ombra sul piano. «Gira» fa ruotare l'oggetto.
- **Invecchiamento**: «Mostra il pezzo dopo» 0–10 anni: impronte (lucidano l'opaco, appannano il lucido), graffi,
  patina di ottone e rame non protetti, colori che sbiadiscono, soft-touch che diventa appiccicoso.
- **Come appare questo abbinamento**: brillantezza (livelli coerenti o incerti, metalli letti a parte), temperatura dei
  metalli (caldi e freddi insieme), contrasto e leggibilità (manopole sul pannello, indici, scritte con il rapporto di
  contrasto), gerarchia visiva (colore dominante, accento troppo esteso, troppi colori), invecchiamento.
  Colori e proporzioni: una barra con i colori in proporzione alla superficie vera.
- **Vincoli di produzione**: compatibilità tra finitura e materiale (anodizzazione sul pressofuso grigia e a chiazze,
  polvere sul pressofuso con degasaggio, polvere su MDF, cromatura su alluminio...), **la polvere stringe i fori della
  griglia** (0,1–0,2 mm per lato, regolabile) e il vuoto su pieno viene ricalcolato con le formule di Officina Griglie, con
  il foro da usare per tornare al valore di progetto; laser sull'anodizzato (segno chiaro, poco leggibile sul naturale);
  serigrafia su superfici strutturate, su olio e cera, su superfici curve (tampografia); ottone nudo; soft-touch; lucido
  pianoforte; metallizzati; finitura a stampo per la plastica; lamiera in qualità anodica; stesso colore su materiali o
  leghe diverse. Un clic sull'avviso porta al parametro.
- **Costo indicativo** di ogni zona: €/dm² sulla superficie vera, più un costo a pezzo e un avviamento per lotto
  (cambio colore, telai, cliché, stampi) contato una volta per finitura e colore. Altoparlanti e componenti sono pezzi
  acquistati: non entrano nei costi né nei vincoli.
- **Varianti** (fino a quattro): duplica, rinomina, togli; ogni variante può nascondere pezzi (per esempio la griglia).
  «Affianca varianti» divide la vista (2 in fila o in colonna, 3 in fila o 2 × 2, 4 in 2 × 2) con la stessa luce e
  inquadratura; un clic su un pezzo rende attiva quella variante.
- **Scheda CMF** in HTML pronta per A4: per il cliente (immagini, palette, materiali, aspetto, note sugli abbinamenti) o
  per il fornitore (materiale di base, finitura, colore con esadecimale, RAL, Pantone, NCS, gloss ± tolleranza o Ra,
  direzione della trama, note di produzione, costo; requisiti: ΔE2000 e misura, glossmetro ISO 2813, spessori
  anodizzazione e polvere, sequenza di lavorazione, campionatura). Una pagina per variante e una di confronto.
  «Stampa o PDF» apre la stampa del browser.
- **Campione da foto**: si carica la foto di un campione vero, si trascina un riquadro, il programma ricava colore medio
  (in luce lineare), RAL più vicino, variazione, direzione dominante (tensore di struttura: spazzolatura o venatura),
  aspetto lucido o opaco e se sembra metallo. Si usa solo il colore, oppure colore e carattere: la foto diventa la trama
  del pezzo (colore e rilievo), alla scala scelta.
- **Salva immagine** in PNG al doppio della risoluzione della vista. **Salva progetto** in JSON (con gli STL compressi a
  16 bit e i campioni di foto); i modelli personali si salvano nel browser dalla galleria. **Annulla e Ripeti** su tutto.

## Come è fatto il codice

Tutto in `finiture.html`, un solo `<script type="module">`, che usa solo three.js e OrbitControls:

- Dati: `RAL`, `ANOD`, `SUB` (materiali di base), `FAM` (famiglie e tipi di finitura con brillantezza, rugosità, trama,
  costi, sensibilità all'uso e compatibilità), `ESS` (essenze), `ENV`, `KIND` (tipi di pezzo e loro zone).
- Colore: `lab`, `dE00` (CIEDE2000), `contrast` (WCAG), `nearRAL`.
- Geometria: `blockGeo` (blocco arrotondato diviso in faccia frontale e resto), `lathe` e `knobGeo` (manopola al tornio
  con la presa come modulazione del raggio), `speakerGeo`, `compGeo`, `gridGeo` + `gridAlpha` (griglia come lamiera con
  la foratura disegnata in una trama di trasparenza, più il bordo con lo spessore), `parseSTL`, `creased`, `boxUV`.
- Trame: `vnoise`, `fbm`, `worley` periodici, `heightOf` → `normalFromH`; `tex` le tiene in memoria; `ageTex` disegna
  impronte e graffi in una mappa di rugosità.
- `makeMat`: dalla finitura al materiale fisico. `guRough` e `raRough` passano da GU e Ra alla rugosità del modello
  (tabelle tarate a occhio), `roughGU` torna indietro per confrontare metalli e vernici.
- Scena: `envScene` (ambienti), `applyEnv`, `buildPart`, `legendFor` (scritte e scale), `buildAll`; `matFor` tiene un
  materiale per variante, pezzo e zona, rifatto solo quando cambia la sua firma. `draw` disegna una o più viste
  (`vps`) cambiando i materiali tra una e l'altra.
- Interfaccia: `SCHEMA` (i campi dicono dove sta il valore: progetto, pezzo, misure, finitura), `buildUI`, `syncUI`,
  `goTo`; i widget (`wParts`, `wZone`, `wColor`, `wEnv`, `wVars`) si rifanno come HTML.
- Calcoli: `zonesIn` (zone visibili con la superficie vera), `checks`, `tips`, `costs`, `report`.
- File: `openFiles`, `fromGriglie`, `fromManopole`, `packMeshes`; immagini `shot`; scheda `schedaHTML`;
  campione `fotoAnalyze`, `photoTex`; modelli `TPL`.
- STL: `parseSTL` (anche i colori per faccia), `weld` (vertici coincidenti con una tabella sui bit dei float),
  `creased`, `analyzeSTL` (corpi separati con union-find, copie identiche unite); `eachSel` applica una modifica a tutte
  le parti scelte; `settle` appoggia un pezzo sul piano.
- `window.__fin`: aggancio per le prove automatiche.

## Stato delle verifiche

Versione 1.0.0, provata in Chromium (WebGL software) con script automatici:

- I sette modelli pronti si costruiscono, con tutte le varianti, senza errori; per ognuno sono stati controllati avvisi,
  note e costi (per esempio: pedale C anodizzato su pressofuso → avviso; diffusore C con griglia a polvere → vuoto su pieno
  da 35,4 % a 27,4 % con foro da 2,8 mm per tornare al progetto; synth C → metalli caldi e freddi, ottone nudo).
- Aperti insieme un STL, il JSON di una manopola e il JSON di una griglia: arrivano sul banco uno accanto all'altro con
  misure, materiali e colori; Annulla li toglie.
- Galleria con anteprime, campione da foto (una foto spazzolata viene riconosciuta come metallo spazzolato a 0°),
  progetto salvato e riaperto con il campione, scheda cliente e fornitore con tutte le varianti (circa 0,7 MB con le immagini).
- La versione senza rete si apre da file con la rete bloccata. Su un telefono (390 px) non c'è scorrimento orizzontale.
- Non provato: la pagina con le librerie da jsDelivr (dalla macchina di prova il CDN non si raggiunge; è lo stesso
  importmap di Griglie), il salvataggio dentro Claude, la stampa in PDF da Edge.

- 1.1.0, con il cabinet di Filippo (STL di 20 MB, 404.698 triangoli, 40 corpi, colori del CAD): letto in meno di un secondo,
  31 parti (6 pannelli uguali uniti in una), in piedi sul piano; scelta di più parti, rotazione, appoggio, trascinamento,
  scheda, salvataggio (JSON di 10 MB) e riapertura con le stesse parti, anche nella versione senza rete.

- 1.1.1: banco vuoto + scatola, manopola, griglia, altoparlante, componente e il cabinet STL: punto più basso di ognuno a
  0,0 mm, anche dopo una rotazione di 37° e un cambio di altezza; nei modelli i pezzi sopra gli altri restano al loro posto.
  Campione da foto: «Scala della trama» e «Rilievo della trama» ora agiscono (prima la foto restava a 40 mm e rilievo fisso).

## Da fare o da controllare

- Le parti degli STL si chiamano «Parte 1, 2...» in ordine di superficie: vanno rinominate a mano. Con 3MF o OBJ si
  potrebbero leggere i nomi dati nel CAD.
- Con centinaia di migliaia di triangoli il passaggio del puntatore resta un po' lento (nessuna struttura di accelerazione).

- Confrontare i colori a schermo con la mazzetta RAL e con campioni di anodizzazione veri, sotto D65: i valori sRGB dei
  RAL sono quelli pubblicati, ma lo schermo non è calibrato.
- Tarare GU → rugosità e Ra → rugosità su campioni misurati con il glossmetro.
- Costi: sono ordini di grandezza; aggiornarli con i preventivi dei fornitori di Filippo (anodizzatore, verniciatore,
  serigrafo) e magari renderli modificabili.
- Pantone e NCS si scrivono a mano: non c'è una tabella (le librerie Pantone non si possono incorporare).
- Il campione da foto stima metallo e brillantezza con regole semplici: va sempre guardato a occhio.
- Le scritte attorno alle manopole sono una scala standard a 300°: per legende vere servirà importare un SVG di grafica.
