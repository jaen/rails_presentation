# I LIKE TRAINS
## czyli tworzenie stron internetowych w Ruby on Rails
### Prezentacja ze spotkania IPIJ, 6.12.2012 r.

W katalogu `build` można znaleźć prezentację pokazaną na rzeczonym wykładzie, oraz dla wygody kilka przykładów w osobnych plikach z shebangami w katalogu `build\examples`.
Prezentacja została wykonana w impress.js (bartaz/impress.js), bardzo polecam impress.js o ile tylko nie używasz Opery, która jest jeszcze sto lat za murzynami jeżeli chodzi o nowe standardy ; )
Dla uprzyjemnienia sobie pisania prezentacji nie wykorzystałem czystego HTMLa i CSSa tylko odpowiednio HAMLa i Stylusa.

Kod aplikacji przedstawionej na wykładzie jest dostępny w repo jaen/EpicPizzaApp.
Nie jest on czywiście przykłądem idealnego kodu Railsowego ze względu na to, że to szybko sklecona pokazówka, ale jakieś pojecia o Railsach może dawać ; )

Dodatkowo w katalogu `sources` jest zawarty kod źródłowy prezentacji jeżeli ktoś chce zobaczyć jak wyglądała ona przed "kompilacją" (szczególnie podoba mi się pętla generująca klasy CSS dla napisu I LIKE TRAINS w Stylusie).
Aby uprościć sobie wykorzystywanie HAMLa i Stylusa w zasadzie statycznym projekcie wykorzystałem gem `middleman`, aczkolwiek musiałem dokonać w nim kilku modyfikacji aby Stylus i Pygments działały bez problemowo, stąd też gitowe linki do gemów w Gemfile'u.
