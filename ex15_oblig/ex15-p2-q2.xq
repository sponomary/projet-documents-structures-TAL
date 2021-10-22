(: Construire une requête pour extraire les items en relation de dépendance syntaxique de type OBJ (on affichera les formes ou les lemmes connectés par cette relation) :)

for $item in collection("baseTrameurFromRhapsodie")//item
where $item/a[7][contains(text(), 'OBJ')]
let $forme_dep := $item/f
let $position_gouv := substring-before(substring-after($item/a[7]/text(),'OBJ('),')')
let $forme_gouv := //item[@type='forme'][@pos=$position_gouv]/f
return concat($forme_gouv, " (", //item[@pos = $position_gouv]/l/text(), ")", " --[OBJ]--> ", $forme_dep, " (", $item/l/text(), ")")