using Base: @kwdef
using Distributions
using StatsBase: mean

"""ModelParams contains all the variables that are constant across simulations"""
@kwdef struct ModelParams
    house::House
    years::Vector{Int}
end

"""A SOW contains all the variables that may vary from one simulation to the next"""
struct SOW{T<:Real}
    slr::DataFrame 
    surge_dist::Distributions.UnivariateDistribution 
    discount_rate::T 
end

"""
In this model, we only hvae one decision variable: how high to elevate the house.
"""
struct Action{T<:Real}
    Δh_ft::T
end
function Action(Δh::T) where {T<:Unitful.Length}
    Δh_ft = ustrip(u"ft", Δh)
    return Action(Δh_ft)
end
