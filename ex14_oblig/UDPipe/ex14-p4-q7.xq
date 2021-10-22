(: Construire une requête pour extraire les items en relation de dépendance syntaxique de type SUB (on affichera les formes ou les lemmes connectés par cette relation) :)

(: pour chaque element dont la balise <data type='deprel'> contient la chaîne de caractères 'nsubj'
on récupère dans la variable la forme du dépendant,
puis la position du dépendant,
enfin la position du gouverneur,
avec toutes ces données on récupère la forme du gouverneur,
et on concatène la forme du dépendant + un espace + la forme du gouverneur :)

<corpus2020>
  {
for $item in collection("sortieUD-regex_3246")//element
where contains($item/data[8]/text(),'nsubj')
let $forme_dep := $item/data[2]/text()
let $position_dep := $item/data[1]/text()
let $position_gouv := $item/data[7]/text()
let $forme_gouv := if (number($position_gouv) < number($position_dep))
then ($item/preceding-sibling::element[number(data[1])=number($position_gouv)]/data[2]/text())
else ($item/following-sibling::element[number(data[1])=number($position_gouv)]/data[2]/text())
return <obj>{concat($forme_dep, " " ,$forme_gouv)}</obj>
  }
</corpus2020>
