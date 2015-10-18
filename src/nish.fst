read lexc nish.txt
define Lexicon;
define DisallowIntermediateTags ~[$[ "+NAPl" | "+NIPl" ]];
define AnimatePlural [ "+Pl" -> "+NAPl" || "+NA" ?* _ .#. ];
define InanimatePlural [ "+Pl" -> "+NIPl" || "+NI" ?* _ .#. ];
define ObviativeAnimateOnly ~[$[ "+NI" ?* "+Obv" ]];
define LongDistanceDependencies [ ObviativeAnimateOnly .o. AnimatePlural .o. InanimatePlural ];
define PluralRules [ n h "^" a -> n y a , a "^" a -> a , i i "^" a -> i i , e "^" a -> e , o o "^" a -> o o , W "^" a -> o o ];
! for -gan dim. = gaans, see V p.188
define ConOrDimRules [ g a n "^" e -> g a a , a a "^" e -> a a , i i "^" e -> i i , e "^" e -> e , o o "^" e -> o o , W "^" e -> o o , k w "^" e -> k o o , g w "^" e -> g o o , i w "^" e -> i i ];
define ShortAConOrDim [ a "^" e -> e || \a _ ];  ! miikna -> miiknens e.g.
! the \a condition here avoids application of this to class I nouns like gaaway
define ClassVPlural [ y "^" a -> i i || \a _ ]; 
define ClassVConOrDim [ y "^" e -> i i || \a _ ]; 
define ClassVPejOrLoc [ y "^" i -> i i || \a _ ]; 
define PejOrLocRules [ n s "^" i s -> n z h i s , n h "^" i -> n y i , a "^" i -> a , i i "^" i -> i i , i w "^" i n g -> i i n g , e "^" i -> e , o o "^" i -> o o , W "^" i -> o , k w "^" i -> k o , g w "^" g o ];
define Cleanup "^" -> 0;
define Morph [ DisallowIntermediateTags .o. LongDistanceDependencies .o. Lexicon .o. PluralRules .o. ClassVPlural .o. ConOrDimRules .o. ClassVConOrDim .o. ShortAConOrDim .o. PejOrLocRules .o. ClassVPejOrLoc .o. Cleanup .o. @"syncopate.bin" ];
push Morph
save stack nish.bin
