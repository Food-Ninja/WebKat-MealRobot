# Representing Cutting Hierarchies as Hierarchical Task Networks (HTNs)

We represent the created task hierarchies for the three example foods (apple, orange & cucumber) through Hierarchical Task Networks (HTNs).
For each food we differentiate between a direct representation of the previously created task hierarchy (see [here](../img/AppleHierarchy.png) as an example for the apple) and a version that is optimised for HTN planning.
The syntax we use[^1] is not tailored towards a specific HTN planner but is kept more general for a better understanding.

## Apple Cutting

### Previous version 

```
Compound Task [Dicing]
	Method [true]
		Subtasks [Slicing(), OrientingBeforeSlicing()]
		
Compound Task [Slicing]
	Method [true]
		Subtasks [CoreCutting(), SingleSlicing()]
		
Compound Task [OrientingBeforeSlicing]
	Method [true]
		Subtasks [SingleSlicing(), OrientingRight()]
		
Compound Task [CoreCutting]
	Method [true]
		Subtasks [Quartering(), QuarterCoreRemoving()]
		
Compound Task [Quartering]
	Method [true]
		Subtasks [Halving(), OrientingBeforeHalving()]
		
Compound Task [OrientingBeforeHalving]
	Method [true]
		Subtasks [OrientingRight(), Halving()]

Primitive Task [SingleSlicing]
	Operator [SlicingOperator()]
	
Primitive Task [OrientingRight]
	Operator [OrientingOperator(Angle)]
	
Primitive Task [Halving]
	Operator [HalvingOperator()]
	
Primitive Task [Peeling]
	Operator [PeelingOperator()]
	
Primitive Task [QuarterCoreRemoving]
	Operator [QuarterCoreRemovingOperator()]
```

### Optimised for HTN Planning

```
Compound Task [Dicing]
	Method [true]
		Subtasks [Slicing(), OrientingRight(), SingleSlicing()]
		
Compound Task [Slicing]
	Method [true]
		Subtasks [CoreRemoving(), SingleSlicing()]
		
Compound Task [CoreRemoving]
	Method [true]
		Subtasks [Quartering(), QuarterCoreRemoving()]
		
Compound Task [Quartering]
	Method [NeedsPeeling == true]
		Subtasks [Peeling(), Halving(), OrientingRight(), Halving()]
	Method [true]
		Subtasks [Halving(), OrientingRight(), Halving()]

Primitive Task [Peeling]
	Operator [PeelingOperator()]

Primitive Task [SingleSlicing]
	Operator [CuttingManipulationOperator(CuttingPoint)]
		Effects [PartAmount += 1]
		
Primitive Task [Halving]
	Operator [CuttingManipulationOperator(CuttingPoint)]
		Effects [PartAmount += 1]
	
Primitive Task [OrientingRight]
	Operator [OrientingOperator(Angle)]
		Effects [PartOrientation += 90]
		
Primitive Task [QuarterCoreRemoving]
	Preconditions [PartAmount == 4]
	Operator [QuarterCoreRemovingOperator()]
```

## Orange Cutting

### Previous version (represented mainly through diagrams)

```
Compound Task [Dicing]
	Method [true]
		Subtasks [Slicing(), OrientingBeforeSlicing()]
		
Compound Task [Slicing]
	Method [true]
		Subtasks [Quartering(), SingleSlicing()]
		
Compound Task [OrientingBeforeSlicing]
	Method [true]
		Subtasks [SingleSlicing(), OrientingRight()]
		
Compound Task [Quartering]
	Method [true]
		Subtasks [PeelingBeforeHalving(), OrientingBeforeHalving()]
		
Compound Task [PeelingBeforeHalving]
	Method [true]
		Subtasks [Peeling(), Halving()]
		
Compound Task [OrientingBeforeHalving]
	Method [true]
		Subtasks [OrientingRight(), Halving()]

Primitive Task [SingleSlicing]
	Operator [SlicingOperator()]
	
Primitive Task [OrientingRight]
	Operator [OrientingOperator(Angle)]
	
Primitive Task [Halving]
	Operator [HalvingOperator()]
	
Primitive Task [Peeling]
	Operator [PeelingOperator()]
```

### Optimised for HTN Planning

```
Compound Task [Dicing]
	Method [true]
		Subtasks [Slicing(), OrientingRight(), SingleSlicing()]
		
Compound Task [Slicing]
	Method [true]
		Subtasks [Quartering(), SingleSlicing()]
		
Compound Task [Quartering]
	Method [true]
		Subtasks [Peeling(), Halving(), OrientingRight(), Halving()]

Primitive Task [Peeling]
	Operator [PeelingOperator()]

Primitive Task [SingleSlicing]
	Operator [CuttingManipulationOperator(CuttingPoint)]
		Effects [PartAmount += 1]
		
Primitive Task [Halving]
	Operator [CuttingManipulationOperator(CuttingPoint)]
		Effects [PartAmount += 1]
	
Primitive Task [OrientingRight]
	Operator [OrientingOperator(Angle)]
		Effects [PartOrientation += 90]
```
		
## Cucumber Cutting

### Previous version (represented mainly through diagrams)

```
Compound Task [Dicing]
	Method [true]
		Subtasks [DividingIntoEighths(), Slicing()]
		
Compound Task [DividingIntoEighths]
	Method [true]
		Subtasks [Quartering(), OrientingBeforeHalving()]
		
Compound Task [Quartering]
	Method [true]
		Subtasks [Halving(), OrientingBeforeHalving()]
		
Compound Task [OrientingBeforeHalving]
	Method [true]
		Subtasks [OrientingRight(), Halving()]
		
Compound Task [Slicing]
	Method [true]
		Subtasks [StemRemoving(), SingleSlicing()]

Primitive Task [SingleSlicing]
	Operator [SlicingOperator()]
	
Primitive Task [OrientingRight]
	Operator [OrientingOperator(Angle)]
	
Primitive Task [Halving]
	Operator [HalvingOperator()]
	
Primitive Task [StemRemoving]
	Operator [StemRemovingOperator()]
	
Primitive Task [Peeling]
	Operator [PeelingOperator()]
```
	
### Optimised for HTN Planning

```
Compound Task [Dicing]
	Method [true]
		Subtasks [DividingIntoEighths(), SingleSlicing()]
		
Compound Task [DividingIntoEighths]
	Method [true]
		Subtasks [Quartering(), OrientingRight(), Halving()]
		
Compound Task [Quartering]
	Method [NeedsPeeling == true && IsPeeled == false]
		Subtasks [Peeling(), StemRemoving(), Halving(), OrientingRight(), Halving()]
	Method [true]
		Subtasks [StemRemoving(), Halving(), OrientingRight(), Halving()]
		
Compound Task [Slicing]
	Method [NeedsPeeling == true && IsPeeled == false]
		Subtasks [Peeling(), StemRemoving(), SingleSlicing()]
	Method [true]
		Subtasks [StemRemoving(), SingleSlicing()]

Primitive Task [SingleSlicing]
	Operator [SlicingOperator()]
	
Primitive Task [OrientingRight]
	Operator [OrientingOperator(Angle)]
		Effects [PartOrientation += 90]

Primitive Task [Halving]
	Operator [HalvingOperator()]
	
Primitive Task [StemRemoving]
	Operator [StemRemovingOperator()]
	
Primitive Task [Peeling]
	Operator [PeelingOperator()]
		Effects [IsPeeled = true]
```

## Optimised Combination of Apple, Orange and Cucumber

```
Compound Task [Dicing]
	Method [Target.Shape == Oval]
		Subtasks [DividingIntoEighths(), SingleSlicing()]
	Method [Target.Shape == Round]
		Subtasks [Slicing(), OrientingRight(), SingleSlicing()]

Compound Task [Slicing]
	Method [Target.HasCore == true]
		Subtasks [CoreRemoving(), SingleSlicing()]
	Method [Target.HasStem == true && NeedsPeeling == true && IsPeeled == false]
		Subtasks [Peeling(), StemRemoving(), SingleSlicing()]
	Method [Target.HasStem == true]
		Subtasks [StemRemoving(), SingleSlicing()]
	Method [true]
		Subtasks [Quartering(), SingleSlicing()]
		
Compound Task [Quartering]
	Method [Target.HasStem == true && (NeedsPeeling == true && IsPeeled == false)]
		Subtasks [Peeling(), StemRemoving(), Halving(), OrientingRight(), Halving()]
	Method [Target.HasStem == false && (NeedsPeeling == true && IsPeeled == false)]
		Subtasks [Peeling(), Halving(), OrientingRight(), Halving()]
	Method [Target.HasStem == true && (NeedsPeeling == false || IsPeeled == true)]
		Subtasks [StemRemoving(), Halving(), OrientingRight(), Halving()]
	Method [Target.HasStem == false && (NeedsPeeling == false || IsPeeled == true)]
		Subtasks [Halving(), OrientingRight(), Halving()]
	
Compound Task [CoreRemoving]
	Method [true]
		Subtasks [Quartering(), QuarterCoreRemoving()]
		
Compound Task [DividingIntoEighths]
	Method [true]
		Subtasks [Quartering(), OrientingRight(), Halving()]
		
Primitive Task [Peeling]
	Operator [PeelingOperator()]
		Effects [IsPeeled = true]
		
Primitive Task [SingleSlicing]
	Operator [CuttingManipulationOperator(CuttingPoint)]
		Effects [PartAmount += 1]
		
Primitive Task [Halving]
	Operator [CuttingManipulationOperator(CuttingPoint)]
		Effects [PartAmount += 1]
	
Primitive Task [OrientingRight]
	Operator [OrientingOperator(Angle)]
		Effects [PartOrientation += 90]
		
Primitive Task [QuarterCoreRemoving]
	Preconditions [PartAmount == 4]
	Operator [QuarterCoreRemovingOperator()]
	
Primitive Task [StemRemoving]
	Operator [StemRemovingOperator()]
```

[^1]: T. Humphreys, ‘Exploring HTN Planners through Example’, in Game AI Pro: Collected Wisdom of Game AI Professionals, S. Rabin, Ed., in Game AI Pro, vol. 1. Boca Raton: CRC Press/Taylor & Francis Group, 2013, pp. 149–167. Available [here](https://www.gameaipro.com/GameAIPro/GameAIPro_Chapter12_Exploring_HTN_Planners_through_Example.pdf)