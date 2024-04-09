# The intertype modules are loaded via the `@intertype` invocations
# inside library code.
#
# This means that for any AlgebraicJulia module which uses intertypes
# the type definitions can be exported to python/java/etc. in the same
# way as this module. See for instance [1].
#
# [1]: https://github.com/AlgebraicJulia/DiagrammaticEquations.jl/blob/1e6ee70e9d8801cef0465090285bcc96067eeadd/src/acset.jl#L6
using InterTypesTemplate

using ACSets.InterTypes
using ACSets
using JSON3

# We will put the exported interfaces for other programming languages
# in subdirectories of the out/ directory.

mkpath("out/python")
generate_module(petris, PydanticTarget, "out/python")

mkpath("out/jsonschema")
generate_module(petris, JSONTarget, "out/jsonschema")

mkpath("out/java")
generate_module(petris, JacksonTarget, "out/java")

using .petris

sir = PetriNet()
S, I, R = add_parts!(sir, :Species, 3)
inf, rec = add_parts!(sir, :Transition, 2)
add_part!(sir, :Input; input_src=S, input_tgt=inf)
add_part!(sir, :Input; input_src=I, input_tgt=inf)
add_part!(sir, :Output; output_src=inf, output_tgt=I)
add_part!(sir, :Output; output_src=inf, output_tgt=I)
add_part!(sir, :Input; input_src=I, input_tgt=rec)
add_part!(sir, :Output; output_src=rec, output_tgt=R)

println("sir =>")
println(sir)
println()
println("as JSON =>")
println(JSON3.write(sir))
println()

sir_with_rates = PetriNetWithRates()
copy_parts!(sir_with_rates, sir)
set_subpart!(sir_with_rates, inf, :rate_coefficient, 2.0)
set_subpart!(sir_with_rates, rec, :rate_coefficient, 1.2)

println("sir_with_rates =>")
println(sir_with_rates)
println()
println("as JSON =>")
println(JSON3.write(sir_with_rates))
println()
