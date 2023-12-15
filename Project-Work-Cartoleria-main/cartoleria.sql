-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Nov 09, 2022 alle 16:50
-- Versione del server: 5.7.34
-- Versione PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cartoleria`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie_prodotti`
--

CREATE TABLE `categorie_prodotti` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `categorie_prodotti`
--

INSERT INTO `categorie_prodotti` (`id`, `descrizione`) VALUES
(1, 'Cancelleria'),
(2, 'Carta'),
(3, 'Zaini e borse'),
(4, 'Belle arti'),
(5, 'Stilografiche'),
(6, 'Informatica');

-- --------------------------------------------------------

--
-- Struttura della tabella `ordini`
--

CREATE TABLE `ordini` (
  `id` int(11) NOT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `totale_ordine` double NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `id` int(11) NOT NULL,
  `nome_prodotto` varchar(50) NOT NULL,
  `descrizione` text NOT NULL,
  `quantita` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `prezzo_di_vendita` double NOT NULL,
  `codice_prodotto` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id`, `nome_prodotto`, `descrizione`, `quantita`, `id_categoria`, `prezzo_di_vendita`, `codice_prodotto`) VALUES
(1, 'Penne Bic nere 10pz', 'La penna a sfera, o anche biro dal nome del suo inventore László Bíró, è uno strumento per scrivere su carta che rilascia inchiostro da un serbatoio interno attraverso l\'azione di rotolamento di una sfera metallica a contatto con la carta.', 100, 1, 7, '837360'),
(2, 'Set matite Katie Leamon', 'Matite pratiche di Katie Leamon, in una varietà di gradi. Le confezioni assortite includono una matita HB piatta da carpentiere e una matita di ogni grado 6 per confezione. ', 50, 1, 5, '018272'),
(3, 'Gomma per cancellare', 'La gomma per cancellare è uno strumento di cancelleria in gomma, naturale o sintetica, atto a rimuovere meccanicamente inchiostri o tracce di grafite da supporti di scrittura o disegno. Si divide in più tipi, dipendentemente dal tipo di tratto da rimuovere.', 50, 1, 1.5, '018221'),
(4, 'Temperamatite', 'Il temperamatite, anche detto temperino, è un oggetto di cancelleria molto comune, realizzato in acciaio, ferro, plastica o altri materiali. La sua funzione è appuntire le matite, affinché queste possano scrivere.', 35, 1, 3.5, '143589'),
(5, 'Matite colorate 3pz', 'Le matite colorate sono uno strumento pittorico semiopaco. E\' possibile mischiare i colori tra loro sovrapponendo strati di colore l\'uno sull\'altro andando, generalmente, dal colore più chiaro e brillante a quello meno chiaro e meno brillante.', 20, 1, 7, '294416'),
(6, 'Evidenziatore Faber Castell metal', 'Con il suo particolare inchiostro rende speciali i vostri testi con effetti scintillanti. Grazie alla sua punta speciale di lunga durata è possibile evidenziare i testi in tre diverse larghezze di riga (1-2-5 mm) in modo preciso, oltre che essere utilizzato anche come marcatore creativo per ottenere grandi effetti. Se si illumina il testo, aumenterà l\'effetto metallico. Lasciatevi sorprendere da come le diverse condizioni di luce influenzano gli effetti scintillanti.\n\nInchiostro a base di acqua, ideale per tutti i tipi di carta, punta resistente, risultati di sottolineatura eccellenti e dal colore uniforme. Colori metallici glamorous.\nÈ utilizzato per incollare oggetti fra loro per lo più temporaneamente, ma anche permanentemente. L\'adesione avviene per semplice contatto con l\'oggetto.\n\nI più diffusi sono preparati con adesivi sensibili alla pressione e sono autoadesivi. Esistono anche nastri adesivi termoattivabili (che prima dell\'applicazione devono essere attivati con il calore) e nastri adesivi attivabili ad acqua (che devono essere bagnati con acqua).', 58, 1, 3.5, '199986'),
(7, 'Evidenziatore Stabilo', 'Stabilo Boss Original ha un design unico e i suoi colori fluorescenti sono ormai un\'icona. Oggi, è l\'evidenziatore più famoso per milioni di consumatori di tutte le generazioni. Comodo da utilizzare, è disponibile in 9 colori (più 6 colori pastello). Non preoccuparti se ti dimentichi di rimettere il tappo: grazie alla tecnologia STABILO Anti-Dry-Out, STABILO BOSS Original può essere lasciato senza tappo fino a 4 ore e l\'inchiostro non si secca. Il suo inchiostro è a base d\'acqua, quindi non è assolutamente dannoso per la salute. Tutte queste caratteristiche rendono STABILO BOSS ORIGINAL l\'evidenziatore perfetto di cui fidarsi sempre.', 40, 1, 2.5, '198936'),
(8, 'Post it', 'Un foglietto Post-it® potrebbe essere utile per fare riferimento alle annotazioni di una determinata giornata. I Foglietti Post-it® sono straordinari perché consentono di appuntarsi le idee a cui fare riferimento in seguito.', 260, 1, 4, '864379'),
(9, 'Stabilo Point 88', 'Le penne fineliner STABILO point 88 sono le compagne perfette per alunni, studenti e professionisti. Nata nel 1977, è la penna colorata a punta fine più apprezzata al mondo per la sua qualità ma soprattutto per le sue possibilità di utilizzo. Numero 1 in Europa, è la penna a punta fine disponibile in 65 brillanti colori ideali per ogni esigenza: se si desidera dare maggior enfasi ai propri appunti basta usare i 6 brillanti colori fluorescenti. Grazie alla sua lunga resistenza anche senza cappuccio non ci si dovrà più preoccupare se lo si dimentica accidentalmente aperto. Infine: comodo da impugnare grazie al fusto esagonale.', 63, 1, 2, '346765'),
(10, 'Calcolatrice', 'Una calcolatrice è una macchina da calcolo automatizzata, di dimensioni fisiche contenute, in grado di eseguire calcoli matematici ed elaborazione dati. Le prime calcolatrici della storia sono meccaniche e solo in parte automatizzate.', 20, 6, 15, '435778'),
(11, 'Temperamatite elettrico', 'Articolo per temperare quasi tutti i tipi di matite disponibili in commercio: da 8 a 11 mm.\nFunziona con una lama elicoidale robusta e resistente che offre un\'affilatura rapida e potente.\nFacile da utilizzare, consente di regolare le mine delle vostre matite secondo le vostre esigenze.\nIl serbatoio può essere estratto facilmente dalla base per svuotarlo.\nMassima stabilità garantita dalle quattro ventose: non scivola durante l\'uso.\nAlimentazione elettrica tramite trasformatore con presa a muro da 9 V incluso.', 15, 6, 13, '746645'),
(12, 'Stampante portatile per smartphone', 'Le stampanti fotografiche portatili sono piccoli dispositivi che consentono di stampare, praticamente ovunque, le foto scattate dallo smartphone. Queste stampanti sono, infatti, alimentate a batteria e si collegamento al nostro cellulare tramite le tecnologie senza fili Bluetooth o WiFi.\nEsso è costituito da una lama di metallo scorrevole che viene fissata al corpo dello strumento tramite un piccolo cilindro cavo. Realizzato per essere trasportabile e di facile utilizzo, il taglierino viene spesso impiegato in vari ambienti lavorativi come uffici o magazzini, in cui il suo principale utilizzo è quello di aprire imballaggi o tagliare nastri o corde.\n\nÈ chiamato anche taglierina sebbene con questo termine si indichi più propriamente una piccola macchina per tagliare la carta o per rifilare i margini delle fotografie.', 10, 6, 100, '967564'),
(13, 'Risma Carta A4', 'La carta più utilizzata in quasi tutti gli uffici è quella in formato A4 delle dimensioni di 210 x 297 mm poiché presenta la giusta dimensione per la stampante. Alcune fotocopiatrici utilizzano anche il formato A3 che equivale a due fogli A4 affiancati sul lato più lungo.', 40, 2, 9.5, '765432'),
(14, 'Zaino bianco', 'Uno zaino è, nella sua forma più semplice, una sacca in tessuto caricata sulle spalle di una persona e assicurata con due fasce che vanno sopra le spalle e sotto le ascelle.', 20, 3, 25, '976480'),
(15, 'Zaino Herschel ', 'I tuoi spostamenti quotidiani verso l\'ufficio richiedono uno zaino per laptop resistente e sicuro. Dotati di funzionalità di scurezza hi-tech per proteggere i tuoi accessori, tasche per organizzare il contenuto, questi zaini per laptop sono perfetti per ogni esigenza, dall\'ufficio, ai viaggi di lavoro, alla scuola.', 30, 3, 36.89, '273906'),
(17, 'Set colori a tempera 3pz', 'La pittura a tempera (dal latino temperare o mescolare) è una tecnica che si avvale dell\'uso di un colore preparato mescolando pigmenti in polvere con un legante formato da un\'emulsione in fase acquosa (parti oleose in minoranza che \"nuotano\" sospese in forma di piccole gocce nell\'acqua).', 12, 4, 12, '273590'),
(18, 'Acquerelli', 'L\'acquerello o acquarello è una tecnica pittorica che prevede l\'uso di pigmenti finemente macinati e mescolati con un legante, diluiti in acqua.', 30, 4, 31.5, '346890'),
(19, 'Set pennelli', 'Il pennello è uno strumento utilizzato per dipingere o, a volte, per scrivere, e in generale per stendere sostanze liquide o viscose su di una superficie. Ha forma allungata e ad un\'estremità si trova un ciuffo di peli che permette l\'assorbimento di inchiostro o materia colorante.', 43, 4, 38.9, '137051'),
(20, 'Penna stilografica legno', 'Una penna stilografica è una penna utilizzata per la scrittura, composta da una cannetta piena d\'inchiostro e da un pennino. L\'inchiostro liquido confluisce al pennino attraverso un sistema di distribuzione che combina gravità e capillarità. L\'inchiostro può essere fornito o da cartucce o da un contagocce oppure da una varietà di meccanismi per rifornire l\'inchiostro nel serbatoio. Ad esempio alcune penne hanno una pompetta di gomma collegata al serbatoio dell\'inchiostro per risucchiare l\'inchiostro da una boccetta. La maggior parte delle penne stilografiche di nuova produzione usano o delle cartucce usa e getta oppure un serbatoio rimovibile con un meccanismo a vite o a pistone per la fornitura dell\'inchiostro.\nCome funziona una penna a sfera? L’inchiostro, presente sotto forma di pasta densa, si scioglie grazie al calore prodotto dalla rotazione della sfera. La stessa sfera, ruotando, sposta l’inchiostro sul foglio di carta e si asciuga subito dopo il contatto. Le penne a sfera sono le più economiche e sono scelte soprattutto per farne un uso quotidiano, ovvero quando c’è necessità di scrivere molto e su ogni tipo di supporto cartaceo. Non necessitano di particolare manutenzione.', 40, 5, 13.9, '356786'),
(21, 'Carta Velina', 'La carta velina è un tipo di carta molto sottile, leggera e semitrasparente come un velo. Normalmente è di pura cellulosa o con modeste percentuali di pastalegno; può contenere anche un po\' di carica come opacizzante. La carta velina trova vasto impiego per avvolgere fiori, frutti e oggetti vari.', 200, 2, 0.5, '188700'),
(23, 'Set Penne Stilografiche 2pz', 'Una penna stilografica è una penna utilizzata per la scrittura, composta da una cannetta piena d\'inchiostro e da un pennino. L\'inchiostro liquido confluisce al pennino attraverso un sistema di distribuzione che combina gravità e capillarità. L\'inchiostro può essere fornito o da cartucce o da un contagocce oppure da una varietà di meccanismi per rifornire l\'inchiostro nel serbatoio. Ad esempio alcune penne hanno una pompetta di gomma collegata al serbatoio dell\'inchiostro per risucchiare l\'inchiostro da una boccetta. La maggior parte delle penne stilografiche di nuova produzione usano o delle cartucce usa e getta oppure un serbatoio rimovibile con un meccanismo a vite o a pistone per la fornitura dell\'inchiostro.', 25, 5, 26.8, '119951'),
(24, 'Cuffie', 'Generalmente per cuffia s\'intende un dispositivo munito di grandi casse con tanto d\'imbottitura insonorizzante, unite tra loro tramite un supporto rigido, per auricolari i dispositivi che si appoggiano nel padiglione auricolare', 5, 6, 68.5, '854533'),
(25, 'Chiave USB 16GB Oreo', 'Una chiave USB (anche chiavetta USB, penna USB, unità flash USB o in lingua inglese USB flash drive, o pen drive) è una memoria di massa portatile che si collega al computer mediante la porta USB.\r\n\r\nI dati sono memorizzati in una memoria flash, tipicamente di tipo NAND, contenuta al suo interno. La capacità è limitata unicamente dalla densità delle memorie flash impiegate, con il costo per megabyte che aumenta rapidamente per alte capacità. Molti modelli dispongono di un occhiello per permetterne l\'aggancio all\'anello di un comune portachiavi.', 20, 6, 15, '355790'),
(26, 'Sveglia', 'La sveglia è un apparecchio sonoro, generalmente incorporato in un orologio, il cui scopo è quello di svegliare le persone o fare da promemoria; esistono anche le radiosveglie, combinate con una radio, in cui a fare da sveglia è il suono dei programmi radiofonici.', 10, 6, 25.9, '257830'),
(27, 'Notebook (vari colori)', 'Piccolo libro con fogli di carta, spesso bianchi o rigati, comunemente utilizzato per appunti o disegni.', 50, 2, 4.5, '746754'),
(28, 'Quaderno ad anelli', 'Alle elementari il quaderno ad anelli serve per raccogliere schede e fotocopie, alle medie, alle superiori e all\'università, invece, i raccoglitori ad anelli vengono utilizzati per suddividere appunti, compiti e altro, di diverse materie grazie anche all\'uso delle buste preforate e degli intercalari colorati.', 30, 2, 3, '764689'),
(29, 'Penne Bic (vari colori) 10pz', 'Fusto in polistirene trasparente, la sezione esagonale consente di impugnare agevolmente la penna e non permette il rotolamento; inoltre c\'è un piccolo foro a circa metà della sua lunghezza, che bilancia la pressione dell\'aria interna con quella esterna. punta + becco collega il serbatoio al meccanismo a sfera.', 50, 1, 9, '356842'),
(30, 'Decorazione Neon Ufficio', 'Lascia che i tuoi ambienti sprigionino freschezza, dolcezza e unività con il Neon Estim, una perfetta rappresentazione dello stile Retrò che ricrea perfettamente gli ambienti ludici degli anni \'50 e \'60 . La decorazione neon torna in grande stile! Colorato, allegro e festoso , queste sono tre delle caratteristiche che definiscono questo elemento di illuminazione di design . Questo esclusivo accessorio utilizza la tecnologia LED di ottima qualità che lo rende efficiente e duraturo. Grazie al suo basso consumo, il Neon Estim si potrà utilizzare per un periodo prolungato in totale tranquillità. ', 10, 6, 19.99, '658954'),
(31, 'Umidificatore', 'L\'umidificatore è un apparecchio elettrico che genera vapore acqueo per mantenere il livello di umidità corretto nell\'aria, dando inoltre sollievo alle vie respiratorie degli adulti e dei bambini. La durata dell\'erogazione varia a seconda della quantità di acqua che si può inserire nel serbatoio.', 15, 6, 14, '863789'),
(32, 'Dispenser Fazzoletti Elettrico', 'Dispenser di fazzoletti elettrico, sensore automatico con scatola di fazzoletti attivabile con vivavoce senza contatto', 8, 6, 17.89, '985468'),
(33, 'Polaroid Camera', 'Una fotocamera istantanea è una piccola macchina fotografica che permette di scattare e realizzare fotografie appunto istantanee, spesso definite Polaroid. Queste fotografie sono delle vere e proprie stampe che escono direttamente dalla fotocamera, che è costruita con una piccola stampante integrata.', 5, 6, 170, '346853'),
(34, 'Lampada da lettura', 'Una luce di questo tipo rende la lettura più rilassante senza disturbare le persone che ci stanno accanto, emettendo un\'illuminazione molto direzionale che non infastidisce neppure di notte a letto. Gli amanti della lettura, spesso tendono a leggere anche a letto o in condizioni in cui la luce è poco sufficiente.', 10, 6, 11.8, '568235'),
(35, 'Penna 3D', 'Le Penne 3D sono delle vere e propie penne, come una penna biro per intenderci, ma utilizzano un Filamento PLA al posto del tradizionale inchiostro. Il Filamento gioca un ruolo fondamentale per creare delle opere Tridimensionali.', 10, 6, 45, '468942'),
(36, 'Fogli Pergamena 3pz', 'La pergamena, detta anche cartapecora o carta pecudina, è una membrana ricavata dalla pelle di animale (agnello o vitello) non conciata e composta di collagene. Presenta una struttura coriacea ed elastica, per cui il degrado non avviene frequentemente.', 40, 2, 6, '235896'),
(37, 'Buste per lettere ', 'Essenziali in svariate occasioni, è importante conoscere le diverse dimensioni delle buste è essenziale per poter spedire una lettera o dei documenti correttamente. Ogni formato di buste è adatto per diverse funzioni, soprattutto nel campo degli affari o commerciale.', 25, 2, 3, '567893'),
(38, 'Cartapesta', 'La cartapesta è una tecnica artistica, che utilizza carta o stracci, imbevuti in colla vinilica o colla di farina. Oggi questa tecnica viene ricordata maggiormente, nel periodo del Carnevale, per il suo utilizzo nei carri allegorici e per le maschere carnevalesche.', 20, 2, 4.2, '752457'),
(39, 'Carta da regalo', 'E\' una carta di buona qualità, si presenta liscia, oleata o ricoperta da uno strato di plastica. Contiene molti colori e molta colla. Una faccia è stampata mentre l\'altra è bianca. Serve per impacchettare allegramente oggetti da regalare.', 25, 2, 5, '236906'),
(40, 'Shopper in carta', 'Le Shopper In Carta sono leggere e resistenti, ideali per trasportare i vostri prodotti e rendere il vostro Brand visibile ovunque. Permettono di identificare e localizzare il vostro business da parte di nuovi potenziali clienti. L\'effetto pubblicitario è di grande impatto grazie alle ampie superfici di stampa.', 15, 2, 3.5, '974678'),
(41, 'Zaino Univers', 'Zaino da caccia realizzato con oxford idro repellente, leggero e poco ingombrante. Dotato di un\'ampia tasca posteriore con chiusura a zip, due tasche porta satellitari nella parte anteriore, bretelle e cinghie regolabili. Misura Unica in due colorazioni Arancio e Verde fluo.', 6, 3, 27.99, '346897'),
(42, 'Zaino Fjallraven  Kanken Lilla', 'Il vero punto di forza del Kånken è però nelle dimensioni ridottissime. Misura infatti solo 13 x 27 x 38 cm ma si può riempire fino a 16 litri. Lo zaino ideale per qualsiasi viaggiatore, perché occupa poco spazio e si può portare ovunque, dall\'aereo al bus.', 8, 3, 38, '345789'),
(43, 'Zaino Billabong', 'Il materiale è di cotone.Il ramo principale.Vano per notebook. Custodia morbida per tablet.Loop all’esterno. Spallacci ergonomici regolabili.', 5, 3, 34.5, '248075'),
(44, 'Zaino Vans', 'Lo zaino Vans Old Skool Drop V presenta un ampio scomparto principale, tasca anteriore con zip, divisorio per un rapido accesso e tasca portabottiglie. Presenta il logo Vans sul davanti e spallacci imbottiti dal taglio dritto per offrire maggiore comfort.', 5, 3, 25, '567996'),
(45, 'Tela media', 'Una tela per pittura è un supporto per dipingere. Essa, a differenza di un pannello in legno, di un cartone o di un intonaco è costituita da fili intrecciati esattamente come il tessuto. Quindi la tela, a livello di materie prime e lavorazione, proviene dal settore tessile.', 18, 4, 7, '347997'),
(46, 'Album da disegno', 'Le superfici, liscia da un lato e ruvida dall\'altro, rendono questo prodotto particolarmente stimolante per ogni applicazione creativa. La vivacità ed il facile accostamento dei colori fanno di questo prodotto uno splendido veicolo di comunicazione grafica. Colori: giallo, rosso, verde, blu e nero. Formato: 24x33 cm. Grammatura: 220 g/mq. Nr. fogli: 25.', 26, 4, 9, '789455'),
(47, 'Colore acrilico', 'Sono prodotti con pigmenti miscelati con una resina acrilica quasi esclusivamente di origine chetonica, la più importante tra le resine sintetiche. Una delle caratteristiche principali della pittura acrilica è la rapidissima asciugatura che varia a seconda delle resine, dei pigmenti e della fabbrica produttrice.', 35, 4, 5.5, '368976'),
(48, 'Tavolozza', 'La tavolozza è uno strumento utilizzato in pittura per preparare e mescolare i colori prima della loro stesura sul supporto pittorico.', 12, 4, 9.8, '456894'),
(49, 'Cavalletto', 'Un cavalletto è un supporto utilizzato dagli artisti per sostenere la tela o la superficie sulla quale si sta eseguendo il dipinto. Il cavalletto fornisce quindi un punto di appoggio con un inclinazione variabile, che può essere decisa a piacimento dal pittore.', 5, 4, 36, '358065'),
(50, 'Set Faber Castell 150pz', 'La collezione \"Belle Arti\" è particolarmente apprezzata da pittori che dipingono per hobby e per passione, così come dai professionisti. Faber-Castell, grazie ad oltre 250 anni di esperienza, sviluppa e propone prodotti esclusivi per artisti. Grandi artisti e designer del calibro di Vincent van Gogh, Paul Klee, Karl Lagerfeld e Neo Rauch hanno apprezzato l\'ampio spettro delle sfumature di colore e l\'alta qualità offerta dalle matite colorate dalla gamma, la quale è rimasta la stessa di oggi. I pigmenti di qualità garantiscono una maggiore durata all\'esposizione alla luce, mentre i colori brillanti hanno la capacità di durare per secoli, aiutando gli artisti a creare opere d\'arte senza tempo.', 6, 4, 80.5, '357954'),
(51, 'Pennarello Sharpie', 'Gli originali Marker Sharpie: pennarello marcatore per tatuatori a punta fine con inchiostro indelebile a rapida essiccazione. Gli Sharpie markers sono pennarelli resistenti all\'acqua, non scoloriscono e grazie alla loro formula speciale è possibile usarli sulla maggior parte delle superfici.', 30, 4, 3.89, '347964'),
(52, 'Set Uniposca', 'Uniposca è il brand di pennarelli perfetto per tutti gli artisti piccoli e grandi che vogliono colorare i propri disegni con un prodotto di qualità e dalla resa sempre perfetta.\r\n\r\nPC-17K, PC-8K, PC-5M, PC-3M, PC-1M, PC-1MR, PCF-350', 10, 4, 27.5, '457954'),
(53, 'Penna Stilografica Fountain Pens Platinum', 'Una penna stilografica è una penna utilizzata per la scrittura, composta da una cannetta piena d\'inchiostro e da un pennino. L\'inchiostro liquido confluisce al pennino attraverso un sistema di distribuzione che combina gravità e capillarità. L\'inchiostro può essere fornito o da cartucce o da un contagocce oppure da una varietà di meccanismi per rifornire l\'inchiostro nel serbatoio. Ad esempio alcune penne hanno una pompetta di gomma collegata al serbatoio dell\'inchiostro per risucchiare l\'inchiostro da una boccetta. La maggior parte delle penne stilografiche di nuova produzione usano o delle cartucce usa e getta oppure un serbatoio rimovibile con un meccanismo a vite o a pistone per la fornitura dell\'inchiostro.', 10, 5, 35.9, '346895'),
(54, 'Penna Stilografica Argent Blue', 'Una penna stilografica è una penna utilizzata per la scrittura, composta da una cannetta piena d\'inchiostro e da un pennino. L\'inchiostro liquido confluisce al pennino attraverso un sistema di distribuzione che combina gravità e capillarità. L\'inchiostro può essere fornito o da cartucce o da un contagocce oppure da una varietà di meccanismi per rifornire l\'inchiostro nel serbatoio. Ad esempio alcune penne hanno una pompetta di gomma collegata al serbatoio dell\'inchiostro per risucchiare l\'inchiostro da una boccetta. La maggior parte delle penne stilografiche di nuova produzione usano o delle cartucce usa e getta oppure un serbatoio rimovibile con un meccanismo a vite o a pistone per la fornitura dell\'inchiostro.', 10, 4, 42.8, '357853'),
(55, 'Penna Stilografica Cartier', 'Una penna stilografica è una penna utilizzata per la scrittura, composta da una cannetta piena d\'inchiostro e da un pennino. L\'inchiostro liquido confluisce al pennino attraverso un sistema di distribuzione che combina gravità e capillarità. L\'inchiostro può essere fornito o da cartucce o da un contagocce oppure da una varietà di meccanismi per rifornire l\'inchiostro nel serbatoio. Ad esempio alcune penne hanno una pompetta di gomma collegata al serbatoio dell\'inchiostro per risucchiare l\'inchiostro da una boccetta. La maggior parte delle penne stilografiche di nuova produzione usano o delle cartucce usa e getta oppure un serbatoio rimovibile con un meccanismo a vite o a pistone per la fornitura dell\'inchiostro.', 10, 5, 150.89, '456795'),
(56, 'Penna Stilografica Golden Genie', 'Una penna stilografica è una penna utilizzata per la scrittura, composta da una cannetta piena d\'inchiostro e da un pennino. L\'inchiostro liquido confluisce al pennino attraverso un sistema di distribuzione che combina gravità e capillarità. L\'inchiostro può essere fornito o da cartucce o da un contagocce oppure da una varietà di meccanismi per rifornire l\'inchiostro nel serbatoio. Ad esempio alcune penne hanno una pompetta di gomma collegata al serbatoio dell\'inchiostro per risucchiare l\'inchiostro da una boccetta. La maggior parte delle penne stilografiche di nuova produzione usano o delle cartucce usa e getta oppure un serbatoio rimovibile con un meccanismo a vite o a pistone per la fornitura dell\'inchiostro.', 10, 5, 98.9, '456797'),
(57, 'Penna Stilografica Mont Blanc', 'Una penna stilografica è una penna utilizzata per la scrittura, composta da una cannetta piena d\'inchiostro e da un pennino. L\'inchiostro liquido confluisce al pennino attraverso un sistema di distribuzione che combina gravità e capillarità. L\'inchiostro può essere fornito o da cartucce o da un contagocce oppure da una varietà di meccanismi per rifornire l\'inchiostro nel serbatoio. Ad esempio alcune penne hanno una pompetta di gomma collegata al serbatoio dell\'inchiostro per risucchiare l\'inchiostro da una boccetta. La maggior parte delle penne stilografiche di nuova produzione usano o delle cartucce usa e getta oppure un serbatoio rimovibile con un meccanismo a vite o a pistone per la fornitura dell\'inchiostro.', 10, 5, 240, '356896'),
(58, 'Penna Stilografica Kensey', 'Una penna stilografica è una penna utilizzata per la scrittura, composta da una cannetta piena d\'inchiostro e da un pennino. L\'inchiostro liquido confluisce al pennino attraverso un sistema di distribuzione che combina gravità e capillarità. L\'inchiostro può essere fornito o da cartucce o da un contagocce oppure da una varietà di meccanismi per rifornire l\'inchiostro nel serbatoio. Ad esempio alcune penne hanno una pompetta di gomma collegata al serbatoio dell\'inchiostro per risucchiare l\'inchiostro da una boccetta. La maggior parte delle penne stilografiche di nuova produzione usano o delle cartucce usa e getta oppure un serbatoio rimovibile con un meccanismo a vite o a pistone per la fornitura dell\'inchiostro.', 10, 5, 150.9, '324579'),
(59, 'Zaino Fjallraven Kanken Pesca', 'I tuoi spostamenti quotidiani verso l\'ufficio richiedono uno zaino per laptop resistente e sicuro. Dotati di funzionalità di scurezza hi-tech per proteggere i tuoi accessori, tasche per organizzare il contenuto, questi zaini per laptop sono perfetti per ogni esigenza, dall\'ufficio, ai viaggi di lavoro, alla scuola.', 10, 3, 38, '376590'),
(60, 'Zaino', 'I tuoi spostamenti quotidiani verso l\'ufficio richiedono uno zaino per laptop resistente e sicuro. Dotati di funzionalità di scurezza hi-tech per proteggere i tuoi accessori, tasche per organizzare il contenuto, questi zaini per laptop sono perfetti per ogni esigenza, dall\'ufficio, ai viaggi di lavoro, alla scuola.', 15, 3, 26, '568905'),
(61, 'Zaino Grigio', 'I tuoi spostamenti quotidiani verso l\'ufficio richiedono uno zaino per laptop resistente e sicuro. Dotati di funzionalità di scurezza hi-tech per proteggere i tuoi accessori, tasche per organizzare il contenuto, questi zaini per laptop sono perfetti per ogni esigenza, dall\'ufficio, ai viaggi di lavoro, alla scuola.', 10, 3, 33.5, '346795'),
(62, 'Borsa', 'Una borsa è un contenitore utilizzato solitamente per custodire o trasportare piccoli oggetti d\'uso quotidiano. Le borse sono generalmente realizzate in materiali non rigidi, quali cuoio, carta, tessuto, plastica sottile o di altri materiali flessibili.', 5, 3, 27.8, '566894'),
(63, 'Zaino Verde', 'Uno zaino è, nella sua forma più semplice, una sacca in tessuto caricata sulle spalle di una persona e assicurata con due fasce che vanno sopra le spalle e sotto le ascelle.', 10, 3, 31, '583790');

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti_in_ordini`
--

CREATE TABLE `prodotti_in_ordini` (
  `id_prodotto` int(11) DEFAULT NULL,
  `id_ordine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `profili`
--

CREATE TABLE `profili` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `indirizzo` varchar(50) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `provincia` varchar(2) NOT NULL,
  `regione` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `id_profilo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `categorie_prodotti`
--
ALTER TABLE `categorie_prodotti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ordini`
--
ALTER TABLE `ordini`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indici per le tabelle `prodotti_in_ordini`
--
ALTER TABLE `prodotti_in_ordini`
  ADD KEY `id_prodotto` (`id_prodotto`),
  ADD KEY `id_ordine` (`id_ordine`);

--
-- Indici per le tabelle `profili`
--
ALTER TABLE `profili`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profilo` (`id_profilo`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `categorie_prodotti`
--
ALTER TABLE `categorie_prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `ordini`
--
ALTER TABLE `ordini`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT per la tabella `profili`
--
ALTER TABLE `profili`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ordini`
--
ALTER TABLE `ordini`
  ADD CONSTRAINT `id_utente` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorie_prodotti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `prodotti_in_ordini`
--
ALTER TABLE `prodotti_in_ordini`
  ADD CONSTRAINT `id_ordine` FOREIGN KEY (`id_ordine`) REFERENCES `ordini` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_prodotto` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `id_profilo` FOREIGN KEY (`id_profilo`) REFERENCES `profili` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
