# Excel

## Hyperlinks

### To Range
`=HYPERLINK("#'Fiscal (Original)'!K932:L932", "Look Here")`

### Lookup To Table Row
```
=LET(
    sh, "CBAS Duplicates",
    sin, 226889,
    r,   MATCH(sin, CBASDuplicates[SIN], 0),
    firstCell, INDEX(CBASDuplicates[#Data], r, 1),
    lastCell,  INDEX(CBASDuplicates[#Data], r, COLUMNS(CBASDuplicates[#Headers])),
    addr, "#'" & sh & "'!" &
           ADDRESS(ROW(firstCell), COLUMN(firstCell)) & ":" &
           ADDRESS(ROW(lastCell),  COLUMN(lastCell)),
    HYPERLINK(addr, "CBAS Duplicates - SIN = " & sin)
)
```

| Variable | Description                                     | Notes     |
| -------: | :---------------------------------------------- | :-------- |
|     `sh` | Name of sheet where the target table is located |           |
|    `sin` | The value to find (in this case it is a number) | `sh, N23` |
|      `r` | The row number of the match                     |           |