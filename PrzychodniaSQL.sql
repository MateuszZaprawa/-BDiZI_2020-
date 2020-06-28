

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Baza danych: `przychodnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `badanie`
--

CREATE TABLE `badanie` (
  `id_badania` int(15) NOT NULL,
  `skierowanie` int(15) NOT NULL,
  `osoba_wykonujaca` int(15) NOT NULL,
  `data_wykonania` date NOT NULL,
  `data_wynikow` date NOT NULL,
  `wyniki` varchar(300) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnie danymi tabeli badania 
--

INSERT INTO `badanie` (`id_badania`, `skierowanie`, `osoba_wykonujaca`, `data_wykonania`, `data_wynikow`, `wyniki`) VALUES
(22999, 97999, 92999, '0000-00-00', '0000-00-00', '-'),
(23001, 98005, 93009, '2020-06-24', '2020-06-30', 'Diagnostyka anemii: ferrytyna, witamina B12, kwas foliowy, transferyna - normie\r\n\r\n'),
(23002, 98002, 93009, '2020-06-20', '2020-06-26', 'Brak odchyleń od norm'),
(23003, 98012, 93009, '2020-06-09', '2020-06-25', '(neutrofile)(NEUT): 1,5–7,4 tys/µl\r\n(eozynofile)(EOS): 0,02–0,67 tys/µl'),
(23005, 98004, 93009, '2020-06-24', '2020-06-25', 'C-Peptyd, insulina, hemoglobina glikowana HbA1c podwyższony stan'),
(23006, 98007, 93009, '2020-05-04', '2020-05-12', 'Nie wykryto pasożytów'),
(23007, 98011, 93009, '2020-04-05', '2020-04-13', 'Wykryto- grzybica '),
(23008, 98009, 93009, '2020-03-08', '2020-03-17', 'W normie. Zaniżony współczynnik żelaza i witaminy B6'),
(23009, 98003, 93008, '2020-06-09', '2020-06-09', 'Plamy na prawym płucu '),
(23010, 98006, 93008, '2020-06-02', '2020-06-03', 'Skrzywienie przy kręgu szyjnym '),
(23011, 98010, 93008, '2020-05-11', '2020-05-11', 'Brak złamań ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karta pacjenta`
--

CREATE TABLE `karta pacjenta` (
  `id_karty` int(15) NOT NULL,
  `pacjent` int(15) NOT NULL,
  `poradnia` int(15) NOT NULL,
  `leczenie` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli karta pacjęta
--

INSERT INTO `karta pacjenta` (`id_karty`, `pacjent`, `poradnia`, `leczenie`) VALUES
(322200, 102, 87024, 50001),
(322201, 108, 87015, 50002),
(322202, 101, 87013, 50003),
(322203, 108, 87015, 50004),
(322204, 106, 87017, 50005),
(322205, 100, 87006, 50006),
(322206, 102, 87016, 50007),
(322207, 110, 87006, 50008),
(322208, 103, 87006, 50009),
(322209, 108, 87015, 50010);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leczenie`
--

CREATE TABLE `leczenie` (
  `id_leczenia` int(15) NOT NULL,
  `skierowanie` int(15) NOT NULL,
  `ew.badania` int(15) NOT NULL,
  `ew.zabiegi` int(15) NOT NULL,
  `ew.recepty` int(15) NOT NULL,
  `lekarz_prowadzacy` int(15) NOT NULL,
  `opis_dolegliwosci` varchar(90) COLLATE utf8_polish_ci NOT NULL,
  `diagnoza` varchar(90) COLLATE utf8_polish_ci NOT NULL,
  `data_wizyty` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli leczenie
--

INSERT INTO `leczenie` (`id_leczenia`, `skierowanie`, `ew.badania`, `ew.zabiegi`, `ew.recepty`, `lekarz_prowadzacy`, `opis_dolegliwosci`, `diagnoza`, `data_wizyty`) VALUES
(50001, 98023, 23006, 24399, 730000, 93003, 'Pacjent odczuwa mocny ból w brzuchu przy oddawaniu moczu ', 'Zapalenie pęcherza moczowego ', '2020-04-07'),
(50002, 98001, 22999, 24400, 730011, 93004, 'Pacjent widzi tylko zarysy obiektów ', 'Odklejenie się siatkówki, konieczny zabieg ', '2020-06-03'),
(50003, 98025, 23002, 24399, 729999, 93000, 'Pacjent od 4 dni skarży się na brak czucia', 'Zaburzenia układu nerwowego, zalecana dieta bogata w witaminę B6', '2020-06-22'),
(50004, 98001, 22999, 24399, 729999, 93004, 'Pacjent ma problemy z widzeniem w odległości pół metra do 20 cm.', 'Wada wzroku -2 na lewym oku i -2.5 na drugim ', '2020-06-09'),
(50005, 98008, 23010, 24399, 730009, 93007, 'Pacjent ma skrzywiony kręg szyjny oraz zaczątki skoliozy', 'Stwierdzona skolioza ', '2020-05-11'),
(50006, 98027, 23007, 24399, 730012, 93017, 'Zaczerwienienie typowe dla grzybicy z złuszczającą się skórą. Zlecone badania na obecność ', 'Stwierdzona grzybica, zalecane leki i kontrola z 2 tygodnie ', '2020-06-08'),
(50007, 98026, 23008, 24399, 729999, 93014, 'Rutynowa kontrola', 'Następna kontrola za 2 tygodnie. Zalecana dieta i ruch ', '2020-05-13'),
(50008, 98024, 22999, 24399, 729999, 93017, 'Plamy na przedramieniu z złuszczająca się skórą', 'Poparzenie skóry spowodowane kontaktem z środkami chemicznymi. Zalecane przemywanie rany', '2020-06-18'),
(50009, 98029, 22999, 24399, 729999, 93017, 'Czerwona duża plama na dolnej części pleców.', 'Poparzenie słoneczne. Zalecane unikanie słońca oraz spanie na brzuchu ', '2020-06-09'),
(50010, 98030, 22999, 24399, 730004, 93004, 'Obfity wyciek ropy z prawego oka.', 'Zalecana kontrola za 10 dni. Przypisany lek do stosowania', '2020-06-17');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekarz`
--

CREATE TABLE `lekarz` (
  `id_lekarza` int(15) NOT NULL,
  `imie` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `specjalizacja` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli `lekarz`
--

INSERT INTO `lekarz` (`id_lekarza`, `imie`, `nazwisko`, `specjalizacja`) VALUES
(92999, '-', '-', 86999),
(93000, 'Dominika ', ' Wojciechowska', 87013),
(93001, 'Bernadetta', 'Zielińska', 87018),
(93003, 'Amanda ', ' Mróz', 87024),
(93004, 'Florian', 'Krajewski', 87015),
(93005, 'Ignacy', 'Stępień', 87025),
(93006, 'Piotr', 'Szymański', 87019),
(93007, 'Krzysztof', 'Górecki', 87017),
(93008, 'Hubert', 'Malinowski', 87022),
(93009, 'Julita', 'Laskowska', 87007),
(93010, 'Ewa', 'Michalak', 87001),
(93011, 'Danuta', 'Cieślak', 87000),
(93012, 'Alina', 'Sikorska', 87000),
(93013, 'Marek', 'Kozyra', 87021),
(93014, 'Robert', 'Patyk', 87016),
(93015, 'Mirosław', 'Królikowski', 87020),
(93016, 'Bożena', 'Kuda', 87026),
(93017, 'Marian', 'Tetrycz', 87006);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leki`
--

CREATE TABLE `leki` (
  `id_leku` int(15) NOT NULL,
  `stosowana_w` int(15) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `substancja_czynna` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `dawkowanie` varchar(300) COLLATE utf8_polish_ci NOT NULL,
  `przeciwwskazania` varchar(300) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli `leki`
--

INSERT INTO `leki` (`id_leku`, `stosowana_w`, `nazwa`, `substancja_czynna`, `dawkowanie`, `przeciwwskazania`) VALUES
(86999, 86999, '-', '-', '-', '-'),
(511000, 87024, 'Androster', ' Finasteridum', 'Zalecana dawka dobowa wynosi 5 mg (1 tabletka)', 'nadwrażliwość na substancję czynną lub którąkolwiek substancję pomocniczą, ciąża'),
(511001, 87001, 'Allertec WZF', 'cetyryzyny dichlorowodorek', 'Dorośli i młodzież: 1 tabletka (10 mg) raz na dobę.\r\n', 'w przypadku nadwrażliwości na cetyryzynę, hydroksyzynę, pochodne piperazyny lub na którykolwiek ze składników pomocniczych leku,\r\nu pacjentów z ciężkimi zaburzeniami czynności nerek z klirensem kreatyniny mniejszym niż 10 ml/min.'),
(511002, 87016, 'Deca-Durabolin', 'dekanian nandrolonu', 'Domięśniowo. Do ustalenia', 'nie stosować przy:zespół nerczycowy, ciężkie uszkodzenie wątroby, porfirie (zaburzenia metabolizmu porfiryny)'),
(511003, 87013, 'Neurovit', 'witaminy B1, B6 i B12', 'Zwykle stosuje się 1 tabletkę dziennie lub wg wskazań lekarza', 'nie stosuje się w przypadku nadwrażliwości na substancje czynne'),
(511004, 87024, 'Limetic', 'dezogestrel', 'Zgodnie z zaleceniem lekarza', 'Uczulenie na substancję czynną'),
(511005, 87023, 'Heparegen', 'kwas tiazolidynokarboksylowy', ' Dawkę i częstotliwość przyjmowania leku określa lekarz.', 'niedrożność dróg żółciowych, ciąża, karmienie piersią'),
(511006, 87001, 'Telfexo', 'feksofenadyna', 'Dawkę i częstotliwość stosowania leku ustala lekarz. ', 'nadwrażliwość na feksofenadynę lub jakąkolwiek substancję pomocniczą preparatu, zaburzenia funkcji wątroby i/lub nerek.'),
(511007, 87000, 'Xifaxan', 'ryfaksymina', 'Dawkę i częstotliwość przyjmowania leku ustala lekarz.', 'nadwrażliwość na ryfaksyminę lub jakąkolwiek substancję pomocniczą preparatu, ciąża'),
(511008, 87000, 'Euthyrox N', 'sól sodowa lewotyroksyny', 'Doustnie, rano, na czczo, co najmniej pół godziny przed śniadaniem', 'nadwrażliwość na sól sodową lewotyroksyny lub pozostałe składniki preparatu, nadciśnienie tętnicze, chore serce '),
(511009, 87020, 'Fluomizin', 'chlorek dekwaliniowy', 'Ten lek należy zawsze stosować zgodnie z zaleceniami lekarza', 'nadwrażliwość (uczulenia) na substancję czynna lub którykolwiek z pozostałych składników tego leku. Innym przeciwwskazaniami są istniejące owrzodzenia w obrębie szyjki macicy czy nabłonka pochwy.'),
(511010, 87021, 'Nexpram', 'Estitalopram', 'Do uzgodnienia z lekarzem.', 'uczulenie na escytalopram lub jakąkolwiek substancję pomocniczą preparatu, skłonność do drgawek, zaburzenia czynności wątroby i/lub nerek, cukrzycę, zmniejszone stężenie sodu we krwi, zwiększoną skłonność do krwawień');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjent`
--

CREATE TABLE `pacjent` (
  `id_pacjenta` int(15) NOT NULL,
  `pesel` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `imie` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `miejscowosc` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `kod_pocztowy` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `ulica` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `numer_domu` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `mail` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli `pacjent`
--

INSERT INTO `pacjent` (`id_pacjenta`, `pesel`, `telefon`, `imie`, `nazwisko`, `miejscowosc`, `kod_pocztowy`, `ulica`, `numer_domu`, `mail`) VALUES
(99, '-', '-', '-', '-', '-', '-', '-', '-', '-'),
(100, '9710125869', '587688325', 'Marek', 'Kowalski', 'Lublin', '20-008', 'Głęboka', '23', 'MaRek324@mail.com'),
(101, '9203231163', '598328456', 'Agnieszka', 'Kubek', 'Lublin', '20-004', 'Piastowska', '56/12', 'Agnisz66@mail.com'),
(102, '5712061599', '893902895', 'Tadeusz', 'Słuchawa', 'Lublin', '20-006', 'Józefa Bema', '23/76', 'TadSLU799@mail.com'),
(103, '6411295352', '453890234', 'Robert', 'Żukowski', 'Snopków', '21-002', 'Obrońców ', '23', 'Zukrob009@mail.com'),
(104, '0612018712', '556242976', 'Natalia', 'Dębkowska', 'Płouszowice-Kolonia', '21-008', 'Taśmowa', '12', 'Nata0606@mail.com'),
(105, '75031588336', '894686397', 'Bożena', 'Rypczyńśka', 'Lublin', '21-002', 'Techniczna', '78/34', 'BOszenka3211@mail.com'),
(106, '9102194356', '354978475', 'Marek', 'Wójtowicz', 'Świdnik', '21-040', 'Nawrotowa', '123', 'Wojmar95@mail.com'),
(107, '4406115436', '345508991', 'Ryszard', 'Bogacki', 'Snopków', '21-002', 'Wiejska', '9', 'RyszBog09@mail.com'),
(108, '8701012345', '565498329', 'Oliwia', 'Matejko', 'Lublin', '20-612', 'Muzyczna', '34', 'OliviaMA01@mail.com'),
(109, '9909125452', '857384028', 'Anna', 'Kwiatkowska', 'Świdnik', '21-040', 'Bauna', '34', 'Annka55Kwiat@mail.com'),
(110, '6607235411', '341958384', 'Paweł', 'Głowacki', 'Lublin', '20-029', 'Okopowa', '342/32', 'PawGlo66@mail.com'),
(111, '9004144310', '562323963', 'Krzysztof', 'Mazur', 'Lublin', '20-030', 'Józefa Sowińskiego', '23/21', 'KsztofAZUR00@mail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personel`
--

CREATE TABLE `personel` (
  `id_pracownika` int(15) NOT NULL,
  `imie` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `wykonywany_zawod` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli `personel`
--

INSERT INTO `personel` (`id_pracownika`, `imie`, `nazwisko`, `wykonywany_zawod`) VALUES
(55999, '-', '-', '-'),
(56000, 'Alexander', 'Sikora', 'Ratownik medyczny'),
(56001, 'Jakub', 'Kowalski', 'Pielęgniarz'),
(56003, 'Julian', 'Czerwiński', 'Technik'),
(56004, 'Kinga', 'Stępień', 'Pielęgniarka'),
(56005, 'Edyta', 'Duda', 'Pielęgniarka'),
(56006, 'Oksana', 'Oksana', 'Oddziałowa'),
(56007, 'Jadwiga', 'Pawlak', 'Pielęgniarka'),
(56008, 'Agnieszka', 'Kubiak', 'Ratownik medyczny'),
(56009, 'Kacper ', 'Kaźmierczak', 'Ratownik medyczny'),
(56010, 'Bartosz', 'Krupa', 'Pielęgniarz'),
(56011, 'Milena', 'Chmielewska', 'Oddziałowa'),
(56012, 'Justyna', 'Maciejewska', 'Pielęgniarka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recepta`
--

CREATE TABLE `recepta` (
  `id_recepty` int(15) NOT NULL,
  `lekarz_wystawiajacy` int(15) NOT NULL,
  `pacjent` int(15) NOT NULL,
  `lek` int(15) NOT NULL,
  `data_wystawienia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli `recepta`
--

INSERT INTO `recepta` (`id_recepty`, `lekarz_wystawiajacy`, `pacjent`, `lek`, `data_wystawienia`) VALUES
(729999, 92999, 99, 86999, '0000-00-00'),
(730000, 93003, 102, 511000, '2020-05-13'),
(730001, 93005, 107, 511003, '2020-02-03'),
(730002, 93011, 100, 511007, '2020-04-13'),
(730003, 93010, 107, 511001, '2020-05-11'),
(730004, 93013, 108, 511010, '2020-03-09'),
(730005, 93014, 107, 511002, '2020-03-01'),
(730006, 93003, 105, 511004, '2019-12-13'),
(730007, 93010, 108, 511006, '2019-11-03'),
(730008, 93015, 101, 511009, '2020-05-24'),
(730009, 93007, 106, 511008, '2020-04-05'),
(730010, 93010, 101, 511006, '2020-04-05'),
(730011, 93004, 108, 511009, '2020-06-08'),
(730012, 93017, 100, 511005, '2020-06-08');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skierowanie`
--

CREATE TABLE `skierowanie` (
  `id_skierowania` int(15) NOT NULL,
  `pacjent` int(15) NOT NULL,
  `lekarz_wystawiajacy` int(15) NOT NULL,
  `skierowanie_do` int(15) NOT NULL,
  `cel_skierowania` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `data_wystawienia` date NOT NULL,
  `data_waznosci` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli `skierowanie`
--

INSERT INTO `skierowanie` (`id_skierowania`, `pacjent`, `lekarz_wystawiajacy`, `skierowanie_do`, `cel_skierowania`, `data_wystawienia`, `data_waznosci`) VALUES
(97999, 99, 92999, 86999, '-', '0000-00-00', '0000-00-00'),
(98000, 107, 93012, 87001, 'swędzeniem ścian gardła oraz oczu - rozpoznanie al', '2020-05-04', '2020-06-04'),
(98001, 108, 93012, 87015, 'rozmazany widok - stwierdzenie wady ', '2020-04-13', '2020-05-13'),
(98002, 101, 93000, 87007, 'Badanie krwi pod kątem niedoborów białych krwinek ', '2020-05-04', '2020-06-04'),
(98003, 105, 93012, 87022, 'Prześwietlenie klatki piersiowej ', '2020-04-14', '2020-05-14'),
(98004, 108, 93003, 87007, 'Badanie moczu pod kątem cukrzycy ', '2020-06-10', '2020-07-10'),
(98005, 110, 93000, 87007, 'Badanie krwi pod kątem anemii ', '2020-06-18', '2020-07-18'),
(98006, 106, 93007, 87022, 'Prześwietlenie kręgosłupa ', '2020-06-07', '2020-07-07'),
(98007, 102, 93003, 87007, 'Badanie moczu pod kątem pasożytów ', '2020-03-09', '2020-04-09'),
(98008, 106, 93003, 87017, 'Rozpoznanie - skrzywienie kręgosłupa ', '2020-05-03', '2020-06-03'),
(98009, 102, 93014, 87007, 'Badanie ogólne krwi i moczu ', '2020-06-17', '2020-07-17'),
(98010, 111, 93007, 87022, 'Prześwietlenie prawego nadgarstka ', '2020-01-05', '2020-02-05'),
(98011, 100, 93017, 87007, 'Badanie naskórka z zmian na lewej ręce pod kątem g', '2020-06-18', '2020-07-18'),
(98012, 103, 93012, 87007, 'Badanie krwi pod kątem zaburzeń pracy tarczycy ', '2020-04-08', '2020-05-08'),
(98013, 104, 93012, 87026, 'Usunięcie znamienia na lewej stopie', '2020-05-10', '2020-06-10'),
(98014, 108, 93004, 87015, 'Laserowa korekta wzroku', '2020-02-09', '2022-06-10'),
(98015, 104, 93012, 87026, 'Usunięcie szwów pooperacyjnych ', '2020-05-03', '2020-07-07'),
(98016, 108, 93003, 87003, 'Ponowne nastawienie kości udowej - prawej', '2020-06-10', '2020-09-09'),
(98017, 101, 93011, 87026, 'Usunięcie narośli z szyi po lewej stronie', '2020-06-07', '2020-07-09'),
(98018, 107, 93000, 87026, 'Usunięcie stopy cukrzycowej', '2020-06-07', '2020-09-16'),
(98019, 100, 93011, 87026, 'Rozpoznanie złamania kostki w lewej nodze', '2020-06-10', '2020-10-06'),
(98020, 109, 93010, 87026, 'Udrożnienie nosa ', '2020-06-08', '2020-07-07'),
(98021, 103, 93000, 87025, 'Zabieg na dyskopatii szyi', '2020-06-16', '2020-07-17'),
(98022, 108, 93011, 87026, 'usunięcie zaćmy ', '2020-06-09', '2020-08-19'),
(98023, 102, 93011, 87024, 'Problemy z oddawaniem moczu ', '2020-06-08', '2020-08-08'),
(98024, 110, 93012, 87006, 'Rozpoznanie łuszczycy, liszaj lub grzybica', '2020-06-16', '2020-07-16'),
(98025, 101, 93011, 87013, 'Brak czucia w palcach u obu rąk ', '2020-06-22', '2020-07-22'),
(98026, 102, 93012, 87016, 'Rozpoznanie zmian nowotworowych ', '2020-06-24', '2020-08-21'),
(98027, 100, 93012, 87006, 'Rozpoznanie grzybicy- prawy łokieć ', '2020-06-10', '2020-07-10'),
(98028, 107, 93012, 87015, 'Badanie wzroku- ślepota', '2020-06-09', '2020-07-09'),
(98029, 103, 93012, 87006, 'Swędzenie zmian skórnych na plecach ', '2020-06-10', '2020-07-10'),
(98030, 108, 93012, 87015, 'Ropa w prawym oku ', '2020-06-09', '2020-06-25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `specjalizacja`
--

CREATE TABLE `specjalizacja` (
  `id_specjalizacji` int(15) NOT NULL,
  `specjalizacja` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli `specjalizacja`
--

INSERT INTO `specjalizacja` (`id_specjalizacji`, `specjalizacja`) VALUES
(86999, '-'),
(87000, 'Ogólna'),
(87001, 'Alergologia'),
(87003, 'Chirurgia dziecięca'),
(87006, 'Dermatologia  i wenerologia'),
(87007, 'Diagnostyka laboratoryjna'),
(87008, 'Epidemiologia'),
(87009, 'Farmakologia kliniczna'),
(87010, 'Ginekologia onkologiczna'),
(87011, 'Intensywna terapia'),
(87012, 'Kardiochirurgia'),
(87013, 'Neurologia'),
(87015, 'Okulistyka'),
(87016, 'Onkologia kliniczna'),
(87017, 'Ortopedia'),
(87018, 'Patomorfologia'),
(87019, 'Pediatria'),
(87020, 'Położnictwo  i ginekologia'),
(87021, 'Psychiatria'),
(87022, 'Radiologia'),
(87023, 'Toksykologia kliniczna'),
(87024, 'Urologia'),
(87025, 'Neurochirurgia'),
(87026, 'Chirurgia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zabieg`
--

CREATE TABLE `zabieg` (
  `id_zabiegu` int(15) NOT NULL,
  `skierowanie` int(15) NOT NULL,
  `lekarz_wykonujacy` int(15) NOT NULL,
  `personel_asystujacy` int(15) NOT NULL,
  `opis_zabiegu` varchar(80) COLLATE utf8_polish_ci NOT NULL,
  `data_wykonania` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Uzupełnienie danymi tabeli `zabieg`
--

INSERT INTO `zabieg` (`id_zabiegu`, `skierowanie`, `lekarz_wykonujacy`, `personel_asystujacy`, `opis_zabiegu`, `data_wykonania`) VALUES
(24399, 97999, 92999, 55999, '-', '0000-00-00'),
(24400, 98014, 93004, 56000, 'Brak komplikacji ', '2020-06-08'),
(24401, 98016, 93016, 56005, 'Prawidłowe nastawienie kości', '2020-06-01'),
(24402, 98020, 93016, 55999, 'Zabieg przeprowadzony pomyślnie, udrożnienie nosa', '2020-05-18'),
(24403, 98022, 93004, 56004, 'Przesunięcie zabiegu z powodu gorączki u pacjenta ', '2020-04-13'),
(24404, 98017, 93016, 56012, 'Brak komplikacji. Usunięcie narośli oraz zaszycie rany i opatrzenie ', '2020-06-16'),
(24405, 98021, 93000, 56006, 'Wysokie cisnienie krwi podczas zabiegu oraz obfite krwawienie. Zabieg przeprowad', '2020-03-24'),
(24406, 98018, 93016, 56012, 'Brak komplikacji ', '2020-06-01'),
(24407, 98015, 93016, 55999, 'Prawidłowe usunięcie 10 szwów ', '2020-05-12'),
(24408, 98013, 93016, 56005, 'Poprawne usunięcie znamienia, założono 7 szwów', '2020-03-08'),
(24409, 98019, 93016, 55999, 'Stłuczenie kostki, założenie opatrunku i usztywnienie kończyny ', '2020-02-16');

--
-- Dodanie kluczy podstawowych do każdej z tabel
--

--
-- Indeksy dla tabeli `badanie`
--
ALTER TABLE `badanie`
  ADD PRIMARY KEY (`id_badania`),
  ADD KEY `skierowanie` (`skierowanie`),
  ADD KEY `osoba_wykonujaca` (`osoba_wykonujaca`);

--
-- Indeksy dla tabeli `karta pacjenta`
--
ALTER TABLE `karta pacjenta`
  ADD PRIMARY KEY (`id_karty`),
  ADD KEY `pacjent` (`pacjent`),
  ADD KEY `poradnia` (`poradnia`),
  ADD KEY `leczenie` (`leczenie`);

--
-- Indeksy dla tabeli `leczenie`
--
ALTER TABLE `leczenie`
  ADD PRIMARY KEY (`id_leczenia`),
  ADD KEY `ew.badania` (`ew.badania`),
  ADD KEY `ew.recepty` (`ew.recepty`),
  ADD KEY `ew.zabiegi` (`ew.zabiegi`),
  ADD KEY `lekarz_prowadzacy` (`lekarz_prowadzacy`),
  ADD KEY `skierowanie` (`skierowanie`);

--
-- Indeksy dla tabeli `lekarz`
--
ALTER TABLE `lekarz`
  ADD PRIMARY KEY (`id_lekarza`),
  ADD KEY `specjalizacja` (`specjalizacja`);

--
-- Indeksy dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD PRIMARY KEY (`id_leku`),
  ADD KEY `stosowana_w` (`stosowana_w`);

--
-- Indeksy dla tabeli `pacjent`
--
ALTER TABLE `pacjent`
  ADD PRIMARY KEY (`id_pacjenta`);

--
-- Indeksy dla tabeli `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`id_pracownika`);

--
-- Indeksy dla tabeli `recepta`
--
ALTER TABLE `recepta`
  ADD PRIMARY KEY (`id_recepty`),
  ADD KEY `lek` (`lek`),
  ADD KEY `lekarz_wystawiajacy` (`lekarz_wystawiajacy`),
  ADD KEY `pacjent` (`pacjent`);

--
-- Indeksy dla tabeli `skierowanie`
--
ALTER TABLE `skierowanie`
  ADD PRIMARY KEY (`id_skierowania`),
  ADD KEY `lekarz_wystawiajacy` (`lekarz_wystawiajacy`),
  ADD KEY `pacjent` (`pacjent`),
  ADD KEY `skierowanie_do` (`skierowanie_do`);

--
-- Indeksy dla tabeli `specjalizacja`
--
ALTER TABLE `specjalizacja`
  ADD PRIMARY KEY (`id_specjalizacji`);

--
-- Indeksy dla tabeli `zabieg`
--
ALTER TABLE `zabieg`
  ADD PRIMARY KEY (`id_zabiegu`),
  ADD KEY `lekarz_wykonujacy` (`lekarz_wykonujacy`),
  ADD KEY `personel_asystujacy` (`personel_asystujacy`),
  ADD KEY `skierowanie` (`skierowanie`);

-- Dodanie auto inkrementacji dla każdego z kluczy podstawowych 
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `badanie`
--
ALTER TABLE `badanie`
  MODIFY `id_badania` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23012;

--
-- AUTO_INCREMENT dla tabeli `karta pacjenta`
--
ALTER TABLE `karta pacjenta`
  MODIFY `id_karty` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322210;

--
-- AUTO_INCREMENT dla tabeli `leczenie`
--
ALTER TABLE `leczenie`
  MODIFY `id_leczenia` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50011;

--
-- AUTO_INCREMENT dla tabeli `lekarz`
--
ALTER TABLE `lekarz`
  MODIFY `id_lekarza` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93018;

--
-- AUTO_INCREMENT dla tabeli `leki`
--
ALTER TABLE `leki`
  MODIFY `id_leku` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511011;

--
-- AUTO_INCREMENT dla tabeli `pacjent`
--
ALTER TABLE `pacjent`
  MODIFY `id_pacjenta` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT dla tabeli `personel`
--
ALTER TABLE `personel`
  MODIFY `id_pracownika` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56013;

--
-- AUTO_INCREMENT dla tabeli `recepta`
--
ALTER TABLE `recepta`
  MODIFY `id_recepty` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=730013;

--
-- AUTO_INCREMENT dla tabeli `skierowanie`
--
ALTER TABLE `skierowanie`
  MODIFY `id_skierowania` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98031;

--
-- AUTO_INCREMENT dla tabeli `specjalizacja`
--
ALTER TABLE `specjalizacja`
  MODIFY `id_specjalizacji` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87027;

--
-- AUTO_INCREMENT dla tabeli `zabieg`
--
ALTER TABLE `zabieg`
  MODIFY `id_zabiegu` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24410;

--
-- Dodanie kluczów obcych do odpowiednich atrybutów  
--

--
-- Ograniczenia dla tabeli `badanie`
--
ALTER TABLE `badanie`
  ADD CONSTRAINT `badanie_ibfk_1` FOREIGN KEY (`skierowanie`) REFERENCES `skierowanie` (`id_skierowania`),
  ADD CONSTRAINT `badanie_ibfk_2` FOREIGN KEY (`osoba_wykonujaca`) REFERENCES `lekarz` (`id_lekarza`);

--
-- Ograniczenia dla tabeli `karta pacjenta`
--
ALTER TABLE `karta pacjenta`
  ADD CONSTRAINT `karta pacjenta_ibfk_1` FOREIGN KEY (`pacjent`) REFERENCES `pacjent` (`id_pacjenta`),
  ADD CONSTRAINT `karta pacjenta_ibfk_2` FOREIGN KEY (`poradnia`) REFERENCES `specjalizacja` (`id_specjalizacji`),
  ADD CONSTRAINT `karta pacjenta_ibfk_3` FOREIGN KEY (`leczenie`) REFERENCES `leczenie` (`id_leczenia`);

--
-- Ograniczenia dla tabeli `leczenie`
--
ALTER TABLE `leczenie`
  ADD CONSTRAINT `leczenie_ibfk_1` FOREIGN KEY (`ew.badania`) REFERENCES `badanie` (`id_badania`),
  ADD CONSTRAINT `leczenie_ibfk_2` FOREIGN KEY (`ew.recepty`) REFERENCES `recepta` (`id_recepty`),
  ADD CONSTRAINT `leczenie_ibfk_3` FOREIGN KEY (`ew.zabiegi`) REFERENCES `zabieg` (`id_zabiegu`),
  ADD CONSTRAINT `leczenie_ibfk_4` FOREIGN KEY (`lekarz_prowadzacy`) REFERENCES `lekarz` (`id_lekarza`),
  ADD CONSTRAINT `leczenie_ibfk_5` FOREIGN KEY (`skierowanie`) REFERENCES `skierowanie` (`id_skierowania`);

--
-- Ograniczenia dla tabeli `lekarz`
--
ALTER TABLE `lekarz`
  ADD CONSTRAINT `lekarz_ibfk_1` FOREIGN KEY (`specjalizacja`) REFERENCES `specjalizacja` (`id_specjalizacji`);

--
-- Ograniczenia dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD CONSTRAINT `leki_ibfk_1` FOREIGN KEY (`stosowana_w`) REFERENCES `specjalizacja` (`id_specjalizacji`);

--
-- Ograniczenia dla tabeli `recepta`
--
ALTER TABLE `recepta`
  ADD CONSTRAINT `recepta_ibfk_1` FOREIGN KEY (`lek`) REFERENCES `leki` (`id_leku`),
  ADD CONSTRAINT `recepta_ibfk_2` FOREIGN KEY (`lekarz_wystawiajacy`) REFERENCES `lekarz` (`id_lekarza`),
  ADD CONSTRAINT `recepta_ibfk_3` FOREIGN KEY (`pacjent`) REFERENCES `pacjent` (`id_pacjenta`);

--
-- Ograniczenia dla tabeli `skierowanie`
--
ALTER TABLE `skierowanie`
  ADD CONSTRAINT `skierowanie_ibfk_1` FOREIGN KEY (`lekarz_wystawiajacy`) REFERENCES `lekarz` (`id_lekarza`),
  ADD CONSTRAINT `skierowanie_ibfk_2` FOREIGN KEY (`pacjent`) REFERENCES `pacjent` (`id_pacjenta`),
  ADD CONSTRAINT `skierowanie_ibfk_3` FOREIGN KEY (`skierowanie_do`) REFERENCES `specjalizacja` (`id_specjalizacji`);

--
-- Ograniczenia dla tabeli `zabieg`
--
ALTER TABLE `zabieg`
  ADD CONSTRAINT `zabieg_ibfk_1` FOREIGN KEY (`lekarz_wykonujacy`) REFERENCES `lekarz` (`id_lekarza`),
  ADD CONSTRAINT `zabieg_ibfk_2` FOREIGN KEY (`personel_asystujacy`) REFERENCES `personel` (`id_pracownika`),
  ADD CONSTRAINT `zabieg_ibfk_3` FOREIGN KEY (`skierowanie`) REFERENCES `skierowanie` (`id_skierowania`);
COMMIT;
