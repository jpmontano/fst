define ShortV [ a | i | o ];
define LongV [ e | a a | i i | o o ];
define Vowel [ ShortV | LongV ];
! no diacritics since upper language is full-vowel
define wAbleCons [ ' | b | c h | d | g | h | j | k | m | m b | n | n d | n g | n h | n j | n z | p | s | s h | s h k | s k | t | z | z h ];
define otherCons [ n s | n y | n z h | s h p | s h t | w | y ];
define dropMarker [ X | L ];
define Cons [ wAbleCons | otherCons ];
define Cluster [ Cons | wAbleCons w ];
define markWeak [ a -> X, i -> X, o -> L // .#. _ Cluster Vowel , .#. Cluster _ Cluster Vowel , LongV Cluster _ Cluster Vowel , dropMarker Cluster ShortV Cluster _ Cluster Vowel ];
define insertApost [ c dropMarker h -> c ' h, m dropMarker b -> m ' b, n dropMarker d -> n ' d, n dropMarker g -> n ' g, n dropMarker h -> n ' h, n dropMarker j -> n ' j, n dropMarker s -> n ' s, n dropMarker y -> n ' y, n dropMarker z -> n ' z, s dropMarker h -> s ' h, s dropMarker k -> s ' k ];
define insertDiacritics [ g L -> ǧ, h L -> ȟ, k L -> ǩ ];
define dropX [ X -> 0 ];
define convertGlottal [ ' -> h ];
define syncopate [ markWeak .o. convertGlottal .o. insertApost .o. insertDiacritics .o. dropX ];
push defined syncopate
save stack syncopate.bin
