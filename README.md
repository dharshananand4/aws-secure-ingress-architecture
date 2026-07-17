# Secure Multi-Tier AWS Ingress Infrastructure via IaC

A production-grade, highly available network topology deployed completely via Infrastructure as Code (Terraform / OpenTofu). This architecture isolates application compute resources from direct public exposure while maintaining traffic balancing across multiple Availability Zones.

## Architecture Highlights
* **Zero Direct Exposure:** Application instances run inside isolated Private Subnets with structural firewalls.
* **Highly Available Design:** Subnets cross distinct Availability Zones to protect workloads against physical cloud datacenter faults.
* **Network-Level Security Gating:** Security Group rules establish a chain of trust where private app instances completely ignore traffic unless routed via the Application Load Balancer.

## Prerequisites
* AWS Account with programmatic credentials configured.
* Terraform Client v1.6.0+ or OpenTofu Client v1.6.0+.
* 
