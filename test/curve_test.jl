@testset "curve_length" begin
    tol=1_000*eps(Float64)

    f(x) = sin(x)

    sol = 3.8201977890277120179047620821714432919099676146472747210804966567
    @test isapprox(curve_length(f,0,pi), sol; atol = tol)
end
