module InterTypesTemplate
export petris, sir

using ACSets
using ACSets.InterTypes

@intertypes "petris.it" module petris end

using .petris


end # module InterTypesTemplate
