//
//  AttractionProvider.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/12/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import Foundation
import MapKit

protocol AttractionProviderProtocol {
    func getAttractions() -> [Attraction]
}

final class AttractionProvider: AttractionProviderProtocol {
    func getAttractions() -> [Attraction] {
        var attractions = [Attraction]()
        
        attractions.append(Attraction(
            name: AttractionManager.Czaple,
            title: "Wioska Piasku i Kamienia",
            body: "Wieś tematyczna dostępna do zwiedzania dla każdego o każdej porze. Na jej terenie powstało kilka tematycznych miejsc: Kamienny Skwerek z autem Flinstonów, Piaskowe Miejsce Grillowe z wiatami, grillem, sceną, huśtawką itp, Skwery nektarodajne z miejscem do odpoczynku, Jasionkowa Chata a w niej Wystawa Geologiczna. Znajduje się tu również darmowa wypożyczalnia rowerów, ogólnodostępny szlak geologiczny Spacer po dnie Morza Kredowego oraz Szlak Kamiennych Krzyży a w centrum wsi Mini Ścieżka Kamiennych Krzyży. Prowadzimy warsztaty dla grup zorganizowanych więc zapraszamy do rezerwacji.",
            coordinate: CLLocationCoordinate2D(latitude: 51.131944, longitude: 15.741667)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Oczko,
            title: "Zachodni stok Kopki",
            body: "Oczko znajduje się na terenie Zakładu Obróbki Kamienia Kamieniarz Czaple. Jest to dół, z którego wydobywano piaskowiec, z którego bije krystalicznie czysta - lazurowo- tukrusowa woda, która kontrastuje z żółtymi piaskami tworząc niezapomniany - wręcz bajkowy widok. Na terenie jest zakaz kąpieli.",
            coordinate: CLLocationCoordinate2D(latitude: 51.1444904614671, longitude: 15.747978687286377)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Brama,
            title: "Nieczynny wiadukt kolejowy wykonany z piaskowca",
            body: "Dawniej służył jako wjazd do nieczynnego już kamieniołomu. Jest to wejście do piaskowo-kamiennego świata. Usytuowana w lasach, co czyni ją jeszcze bardziej tajemniczą i atrakcyjną. Doskonałe miejsce na sesje plenerowe oraz spacer.",
            coordinate: CLLocationCoordinate2D(latitude: 51.1413941771465, longitude: 15.761175155639648)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Skwerek_Nektarodajny,
            title: "Dom dla pszczół",
            body: "Ogródek znajduje się przy głównej drodze w Czaplach obok Kościoła. Zasadzone są na nim wyłącznie rośliny nektarodajne, w centrum postawiony jest stół z ławkami oraz tablica edukacyjna ukazująca życie w pszczelim ulu.",
            coordinate: CLLocationCoordinate2D(latitude: 51.13507980600798, longitude: 15.749024748802185)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Mini_Ścieżka_Kamiennych_Krzyży,
            title: "Miniatura ścieżki w Choińcu",
            body: "Znajduje się w Centrum wsi tuż przy Placu OSP. Wyłożona jest płytami z piaskowca oraz zasypana wokoło żwirem. Na ścieżce zostały zamontowane miniatury krzyży kamiennych znajdujących się na terenie naszego lasu oraz tabliczki informacyjne ze zdjęciami prawdziwych krzyży oraz ich opisem. Na ścieżce zasadzono różne rośliny od mieszkańców, w jej środku ulokowano skalniak, nasadzono wrzosy i inne rośliny nektarodajne. Teren został po części ogrodzony, postawione zostały również ławki z drewna. Ścieżka powstała dla tych turystów, którzy nie są w stanie przebyć 15to kilometrowego Szlaku Kamiennych Krzyży w Choincu/Czaplach, który łączy aż siedem kamiennych krzyży, w tym kilka pokutnych.",
            coordinate: CLLocationCoordinate2D(latitude: 51.13483744619721, longitude: 15.74840784072876)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Skalny,
            title: "Ogródek przy świetlicy",
            body: "Ogród stworzony pracą społeczną mieszkańców wsi przy pomocy lokalnych przedsiębiorców.  W samym centrum usytuowana jest pokaźna fontanna z piaskowca wykonana przez lokalnego rzeźbiarza. ",
            coordinate: CLLocationCoordinate2D(latitude: 51.13513702966654, longitude: 15.749255418777466)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Kamienny,
            title: "Mini centrum geologii lokalnej",
            body: "Jest to skwer, na który wysypano kilkadziesiąt ton żwiru, ulokowano głazy piaskowca z okolicznych, także nieczynnych już kamieniołomów – Pielgrzymka, Nowe Łąki, Czaple, Nowa Wieś Grodziska oraz Żeliszów. Na każdym kamieniu znajdują się tabliczki mówiące o jego twardości, strukturze oraz okresie, z którego pochodzi. Są tu także głazy z oryginalnymi odbiciami ślimaków kredowych. Skwerek oprócz funkcji edukacyjnych, pełni funkcje rekreacyjne. Właśnie w tym miejscu ‘garażuje’ auto rodem z epoki kamienia łupanego – napędzane siłą nóg, znajdują się także kamienne giga meble – stół, ława, sofa oraz pufy, ulokowane są też akcenty ozdobne – skalniaki oraz krzewy.",
            coordinate: CLLocationCoordinate2D(latitude: 51.135349093194634, longitude: 15.749706029891968)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Grill,
            title: "Miejsce Opdpczynku i relaksu",
            body: "Dwie wiaty z bali, stoły, ławki, huśtawka, palenisko i grill, na którym można usmażyć sobie dania grillowe.",
            coordinate: CLLocationCoordinate2D(latitude: 51.135099, longitude: 15.748790)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Chata,
            title: "Drewniana Chatka z Bali",
            body: "Znajduje się w niej stała wystawa geologiczna ze skałami, skamieniałościami i minerałami z Czapli oraz terenu Pogórza Kaczawskiego. Wyświetlana jest też animacja pn. „Spacer po dnie morza kredowego”. W celu zwiedzenia  konieczna jest wcześniejsza rezerwacja.",
            coordinate: CLLocationCoordinate2D(latitude: 51.135153, longitude: 15.748923)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Rowery,
            title: "Bezosobowa Wypożyczalnia Rowerów",
            body: "Przed budynkiem świetlicy wiejskiej znajduje się bezobsługowa wypożyczalnia rowerów, a przez wieś biegnie wytyczony szlak  rowerowy łączący gorę Kopkę z wygasłym wulkanem w Proboszczowie – Ostrzycą.",
            coordinate: CLLocationCoordinate2D(latitude: 51.135156, longitude: 15.749251)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Ścieżka,
            title: "Spacer po dnie morza kredowego",
            body: "Szlak geologiczny mający około 3,5 km. Początek znajduje się na Kamiennym Skwerku i łączy ze sobą 5 tablic z których dowiadujemy się o budowie i historii geologicznej terenów Czapli.",
            coordinate: CLLocationCoordinate2D(latitude: 51.135349093194634, longitude: 15.749706029891968)
        ))
        
        attractions.append(Attraction(
            name: AttractionManager.Szlak,
            title: "Choiniec",
            body: "Złotoryjski Las, otaczający przysiółek wsi Czaple, zwany Choińcem, to jedyne miejsce w Polsce, gdzie na stosunkowo niewielkim obszarze spotkać można aż siedem wolnostojących kamiennych krzyży. Z wielkim prawdopodobieństwem możemy twierdzić, że wszystkie znajdują się w swoich pierwotnych miejscach – inaczej niż w innych miejscowościach, gdzie istnieją równie duże skupiska kamiennych krzyży.",
            coordinate: CLLocationCoordinate2D(latitude: 51.120462, longitude: 15.721053)
        ))
        
        return attractions
    }
}
