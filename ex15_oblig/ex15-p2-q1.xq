(: Construire une requête pour extraire les items portant une relation de dépendance syntaxique de type OBJ :)

for $item in collection("baseTrameurFromRhapsodie")//item
where $item/a[7][contains($item/a[7], 'OBJ')]
return $item/f/text()
