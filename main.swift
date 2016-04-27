//
//  main.swift
//  Eerste app
//
//  Created by Reinier Wieringa on 25-04-16.
//  Copyright © 2016 One Support. All rights reserved.
//

/* Dit programma raadt een getal dat de gebruiker in gedachten heeft.
 Door middel van constanten, kunnen de minimale en maximale waarde waartussen de gebruiker kan kiezen,
 worden ingesteld. */

// De minimale waarde die de gebruiker kan kiezen.
let MIN_WAARDE = 1

// De maximale waarde die de gebruiker kan kiezen.
let MAX_WAARDE = 1000


// Op de inhoud van deze variabele wordt getest:
var geraden = false
// Zodra het getal is geraden, krijgt deze variabele de waarde 'true'.

// Aantal pogingen dat nodig was om het getal te raden. Dit getal laten we aan het einde zien,
// om te laten zien hoe 'slim' het programma is.
var pogingen = 0

/* Tijdens het raden houden we de volgende waarden bij: 
- De minimale waarde
- De maximale waarde
- De huidige (test)waarde */
var minwaarde = MIN_WAARDE
var maxwaarde = MAX_WAARDE
var testwaarde = 0
// Dit is de waarde waarop we testen.

/* De testwaarde wordt al volgt berekend:
 We delen de hoogst mogelijke en laagst mogelijke waarde door 2.
 Het resultaat tellen we op bij de laagst mogelijke waarde.
 Hiermee delen we de 'bandbreedte' (het gebied waarin het te raden getal zit)
 steeds door 2, zodat de bandbreedte steeds 2 keer zo klein wordt. */
print("Denk aan een getal tussen \(minwaarde) en \(maxwaarde).")

while geraden == false {
  pogingen = pogingen + 1
  // Dit is het magische gedeelte: Het berekenen van de te tonen testwaarde
  testwaarde = minwaarde + ((maxwaarde-minwaarde)/2)
  print("Is het getal (h)oger, (l)ager, of (g)elijk aan \(testwaarde)?", terminator: "")
  
  let ingevoerdetekst = readLine()
  if ingevoerdetekst != nil {
    // Tekst bevat nu door de gebruiker getypte tekst. Geldige invoer is 'g', 'l', of 'h'.
    let tekst = ingevoerdetekst!
    if tekst == "g" {
      // Bingo! Het getal is geraden.
      geraden = true
    }
    else if tekst == "l"{
      // Het te raden getal is lager dan de testwaarde. De maximale waarde is dus altijd
      // eentje lager dan testwaarde.
      maxwaarde = testwaarde - 1
    }
    else if tekst == "h"{
      // Het te raden getal is hoger dan de testwaarde. De minimale waarde is dus altijd
      // eentje hoger dan de testwaarde.
      minwaarde = testwaarde + 1
    }
    else {
      // De gebruiker heeft een verkeerd antwoord gegeven. Deze poging telt niet.
      pogingen = pogingen - 1
    }
  }
}
// Als het programma hier komt, is het getal geraden:
print("Geraden in \(pogingen) keer! Het getal was \(testwaarde).")
