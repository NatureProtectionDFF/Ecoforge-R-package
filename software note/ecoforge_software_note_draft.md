**\[DRAFT — working title, to be revised\]**

# 'ecoforge': an R package for simulating environments, virtual species and sampling designs in ecological research

David Ferrer Ferrando¹, Pelayo Acevedo¹, Pedro Tarroso²

¹ \[affiliation to confirm\] ² \[affiliation to confirm\]

------------------------------------------------------------------------

## Abstract

*\[Draft — to be finalised once the full manuscript is written; current length ≈165 words, Ecography typically allows up to \~250–300\]*

Simulating ecological data under fully controlled and known conditions — the 'virtual ecologist' approach — is an effective way to test and compare sampling protocols and modelling tools, but currently requires combining several specialised R packages and substantial custom code. We present 'ecoforge', an R package that integrates this entire pipeline: generating spatially autocorrelated environmental layers, deriving the expected abundance or suitability of a virtual species from them, simulating the spatial distribution of individuals through an inhomogeneous Poisson point process, and sampling these individuals under different field-realistic designs (point counts, transects, random or systematic grids) to obtain abundance or presence–absence datasets. 'ecoforge' allows full control over every simulation step, making it possible to isolate the effect of specific design choices — such as species spatial pattern or sampling strategy — on the performance of ecological models. We illustrate the complete workflow with a reproducible worked example and discuss potential applications of the package in ecological research.

**Keywords:** virtual ecologist approach; spatial simulation; species distribution; sampling design; point process; R package

------------------------------------------------------------------------

## 1. Introduction

Ecologists increasingly rely on simulated, or 'virtual', data to evaluate sampling protocols, statistical models and analytical workflows under fully known and controllable conditions, an approach broadly referred to as the virtual ecologist framework (Zurell et al. 2010). Because the true state of a simulated system — e.g. the spatial structure of the environment, or the underlying abundance or occurrence of a species — is known exactly, the performance of a given method can be benchmarked against ground truth rather than against an unknown reality, which is rarely possible with empirical data. This logic has been applied across many sub-fields of ecology, from testing species distribution models (Meynard and Kaplan 2011) to assessing the robustness of monitoring designs, and its value grows as ecologists try to disentangle confounded effects — such as those of spatial scale, sampling design and species spatial pattern — on the inferences drawn from field data.

Several R packages address parts of this workflow. virtualspecies (Leroy et al. 2016) generates realistic virtual species suitability and presence–absence patterns from user-supplied environmental layers, and allows occurrence sampling with simple detection or spatial biases, but does not generate the underlying environmental layers nor implement structured field sampling designs (e.g. transects or fixed sampling grids). Packages built around geostatistical simulation, such as gstat (Pebesma 2004), can generate spatially autocorrelated environmental surfaces with a known degree of spatial structure, but were not designed with downstream species or sampling simulation in mind. Likewise, spatstat (Baddeley and Turner 2005) provides a comprehensive and flexible framework for simulating and analysing spatial point patterns, including inhomogeneous Poisson processes that can represent the spatial distribution of individuals of a species, but, as a general-purpose statistical package, it requires substantial additional code to be adapted to an ecological sampling context. In practice, researchers wanting to simulate a full 'environment-to-dataset' pipeline — generate a spatially structured environment, define species suitability or expected abundance, place individuals in space, and sample them under a chosen design — currently need to combine several of these packages and write considerable custom code, which limits reproducibility and standardisation across studies.

The R package 'ecoforge' was developed to fill this gap. It implements the whole pipeline within a single, modular framework: generation of environmental spatial layers with a user-defined degree of spatial autocorrelation (built on gstat's Gaussian random field simulation), translation of these layers into a species' expected abundance or habitat suitability, simulation of individuals in space following an inhomogeneous Poisson point process (built on spatstat), and, finally, sampling of those individuals under different field-realistic designs (e.g. random or systematic point counts, transects), with direct conversion of the resulting data into abundance or presence–absence datasets ready for statistical analysis. Because every step of the pipeline is explicit and under the user's control, 'ecoforge' allows researchers to isolate and quantify the effect of specific design choices — such as the spatial pattern of a species or the sampling strategy used to detect it — on the performance of downstream analyses. The package has already been used to generate the simulated datasets underlying a recent assessment of how spatial scale and species spatial pattern affect the relationship between estimated suitability and true abundance (Ferrer-Ferrando et al. 2025).

In this note, we describe the design and core functionality of 'ecoforge' and illustrate its use with a worked example covering the full simulation pipeline, from the generation of environmental layers to the production of a sampled dataset.

------------------------------------------------------------------------

## 2. The 'ecoforge' package

*\[to be drafted next — design, dependencies (gstat, terra, spatstat.geom/spatstat.random) and core functions grouped by pipeline stage\]*

## 3. Workflow and case study

*\[to be drafted — based on the "Package_Example" vignette: environmental layers → suitability/abundance → individual distribution → sampling → exported dataset → covariate correlation check\]*

## 4. Discussion

*\[to be drafted — strengths, limitations, future directions\]*

## Software availability

*\[to be drafted — GitHub repo, licence (GPL-3.0), version 1.0, Zenodo DOI (pending)\]*

## Acknowledgements

*\[pending\]*

## Author contributions

*\[pending\]*

## References

Baddeley, A. and Turner, R. 2005. spatstat: an R package for analyzing spatial point patterns. – J. Stat. Softw. 12: 1–42.

Ferrer-Ferrando, D., Tarroso, P., Tellería, J. L., Acevedo, P. and Fernández-López, J. 2025. Disentangling the effect of the spatial scale and species spatial pattern on the abundance–suitability relationship. – Ecography 2025: e07766.

Leroy, B., Meynard, C. N., Bellard, C. and Courchamp, F. 2016. virtualspecies, an R package to generate virtual species distributions. – Ecography 39: 599–607.

Meynard, C. N. and Kaplan, D. M. 2011. The effect of a gradual response to the environment on species distribution model performance. – Ecography 35: 499–509.

Pebesma, E. J. 2004. Multivariable geostatistics in S: the gstat package. – Comput. Geosci. 30: 683–691.

Zurell, D., Berger, U., Cabral, J. S., Jeltsch, F., Meynard, C. N., Münkemüller, T., Nehrbass, N., Pagel, J., Reineking, B., Schröder, B. and Grimm, V. 2010. The virtual ecologist approach: simulating data and observers. – Oikos 119: 622–635.

------------------------------------------------------------------------

## Supplementary material

*\[pending — if applicable\]*

------------------------------------------------------------------------

### Pending administrative items (not part of the manuscript text)

-   Confirm `Version: 1.0` in DESCRIPTION before submission.
-   Mint a Zenodo DOI for the `Ecoforge-R-package` repository itself (current DOI is for a different, related repository).
-   Add unit tests (testthat) and a CI workflow (GitHub Actions); confirm all tests pass before submission.
-   Confirm author affiliations and ORCID iDs for the title page.
-   Verify final reference formatting against Ecography's author guidelines before submission.
