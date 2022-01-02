# Caravel User Project

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)


## ALU FOR RADIATION HARDENED APPLICATIONS
This repo contains the design of a radiation hardened TMR based ALY implemented in SKY130 open source PDK. This design was hardened using openlane.
Reliability and performance are two important factors to
be considered in the design of application-specific integrated
circuits (ASICs). The CMOS technology miniaturization
has significantly improved the performance parameters such
as frequency, speed, power efficiency, and area of ASICs.
However, miniaturized CMOS technologies are more prone
to radiation, which increases the probability of failure in
case of single-event upsets (SEUs).

#Summary
Space application Integrated Circuits (ICs) are prone to radiation particles, which are present in the form of electrons, protons, and heavy ions, generated from solar flares or space radiations. The circuits utilized in space applications must be able to tolerate these radiation impacts and assure reliable functionality. In this work, we have explored the impact of single-event upsets (SEUs) on the ALU architecture and proposed a fault-tolerant, 16-bit arithmetic logic unit (ALU) system, that works reliably in the presence of SEUs. The proposed architecture uses the concept of triple modular redundancy (TMR) with high fault-masking ratio (FMR) voter logic.
