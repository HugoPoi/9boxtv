#Reverse engineering Evolution SFR Sagem Box TV

## getConfig
`curl --config get_config.curl -o channels_list.xml`

1. Identifiant de connexion à remplacer (La dernière fois que j'ai
   testé avec de la merde et c'est passé)
stbid XXXXXXXXXX et SN YYYYYYYYYY sur l'étiquette arrière de votre box

2. Effectuer une première requête qui renvoi le `nonce` dans les headers
HTTP

3. Ensuite refaire la même requête avec le `nonce` injecté.

## firmware_request
Contient le bootloader et le firmware récupéré grâce aux requêtes
sur les serveurs de SFR

Les requetes curl manque un token supplémentaire que je n'ai pu
identifier.

## Script conversion playlist SFR

`xsltproc generate_playlist.xslt channels_list.xml > playlist_tv_sfr.m3u`


## TODO list

* Décompacter le firmware, chiffré ?, le firmware est stocké sur de la
  flash samsung quel format ?
* Trouver la clé / les clés de chiffrement AES?? des flux iptv, peut-être  stocké dans l'image firmware ?
* Trouver des gens qui connaissent le fonctionnement du chiffrement IPTV
* Plus d'update sur https://www.neufbox4.org/forum/viewtopic.php?pid=37650

## Message pour SFR

Si SFR veut que j'enlève les informations qui sont ici, je le
ferais à condition de nous fournir un vrai service multiposte de
télévision et pas leur merde en flash. MERCI BISOU.

