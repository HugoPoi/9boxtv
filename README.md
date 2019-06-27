#  Reverse engineering Evolution SFR Sagem Box TV

## Get the setup config of the box

1. Les identifiant `stbId` et `SN` sont sur l'étiquette arrière de votre box
`ctoken` et `cnonce` sont généré par la box mais je n'ai pas cherché comment.
Cependant j'ai pu constater que `stbId`, `SN`, `ctoken`, `cnonce` peuvent être
remplacer par des valeurs arbitraire. Donc les config curl fournit
fonctionne en l'état.

1. Get a nonce `curl -v --config get_nonce.curl`

1. You will get a 401 with a `WWW-Authenticate` header containing a
   nonce.

1. Replace in `get_config.curl` with the nonce provided

1. `curl -v --config get_config.curl`

## Script conversion playlist SFR

`xsltproc generate_playlist.xslt setupResponse.xml > playlist_tv_sfr.m3u`

## firmware_request

Contient le bootloader et le firmware récupéré grâce aux requêtes
sur les serveurs de SFR

Les requetes curl manque un token supplémentaire que je n'ai pu
identifier.

## TODO list

* Décompacter le firmware, chiffré ?, le firmware est stocké sur de la
  flash samsung quel format ?
* Trouver la clé / les clés de chiffrement AES?? des flux iptv, a priori stocké dans le chipset de decodage video
* Trouver des gens qui connaissent le fonctionnement du chiffrement IPTV
* Plus d'update sur https://www.neufbox4.org/forum/viewtopic.php?pid=37650

## Message pour SFR

Si SFR veut que j'enlève les informations qui sont ici, je le
ferais à condition de nous fournir un vrai service multiposte de
télévision et pas leur merde en flash. MERCI BISOU.

