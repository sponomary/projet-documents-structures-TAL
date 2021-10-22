(: Construire une requête pour extraire les items portant une relation de dépendance syntaxique de type OBJ :)

<corpus2020>
  {
    for $item in collection('sortieUD-regex_3246')//element
    where $item[data[8] = 'obj']
    return <obj>{$item/data[2]/text()}</obj>
  }
</corpus2020>