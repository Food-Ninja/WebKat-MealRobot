# DL Queries (Examples)

We employ the following DL queries in Protégé:

Which round food can be sliced?
```
Food and hasInitialShape only Round and Slicing
```

Which oval food can be sliced?
```
Food and hasInitialShape only Oval and Slicing
```

Which (oval or round) food can be cut?
```
Food and (hasDisposition only Cuttability) and (hasInitialShape only (Round or Oval))
```

For which food does the core need to be removed?
```
Food and (hasDisposition only CoreRemovability) and (hasPart some (Core and (hasEdibility some (MustBeAvoided or ShouldBeAvoided))))
```
