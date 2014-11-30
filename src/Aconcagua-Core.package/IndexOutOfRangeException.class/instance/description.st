accessing
description

	^index isNil 
		ifTrue: [ 'Index out of range for <1p>' expandMacrosWith: collection ]
		ifFalse: [ 'Index <1p> out of range for <2p>' expandMacrosWith: index with: collection ]