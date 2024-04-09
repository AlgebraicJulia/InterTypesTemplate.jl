# InterTypes Template

This is a template meant to show how to use intertypes, a feature of
[ACSets.jl](https://github.com/AlgebraicJulia/ACSets.jl) which produces type
definitions that have compatible JSON serialization for Python, Julia, and Java,
and produce JSON schema as well.

In the `src` folder, one can find a variety of example intertype definitions,
and then in `run.jl` one can find the commands to export the definitions to
supported formats. There are also informative comments in `run.jl`; it is good
to read these to get a sense of the larger picture for intertypes.
