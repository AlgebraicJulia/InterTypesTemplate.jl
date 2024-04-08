module InterTypesTemplate

using ACSets.InterTypes

@intertypes "wgraph.it" module wgraph end

using .wgraph

@intertypes "simpleast.it" module simpleast end

using .simpleast

end # module InterTypesTemplate
