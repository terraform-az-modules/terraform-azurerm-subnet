# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.3] - 2026-08-25
### :bug: Bug Fixes
- [`228b97b`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/228b97bfe4513f5725f89394cedbe31ea8918e5a) - consolidate versions.tf, remove provider_meta, upgrade to azurerm >= 4.0 *(commit by [@anmolnagpal](https://github.com/anmolnagpal))*
- [`00b0e7e`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/00b0e7ef5bfa3dd7f18f487f06c8f042823c2c0a) - align example versions.tf with root module (>= 4.0, >= 1.10.0) *(commit by [@anmolnagpal](https://github.com/anmolnagpal))*
- [`f2cbe7c`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/f2cbe7c98da8ed005c92a9e3d90400a56ea936c3) - added dynamic block for service endpoint *(PR [#50](https://github.com/terraform-az-modules/terraform-azurerm-subnet/pull/50) by [@karan-cd](https://github.com/karan-cd))*

### :wrench: Chores
- [`e89a876`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/e89a876c4e258a5e359d18f999aed99a0c010e78) - **deps**: Bump terraform-linters/setup-tflint from 4 to 6 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`d52f8f4`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/d52f8f488f665bc19ee5d997699a323517c3b911) - **deps**: Bump actions/checkout from 4 to 6 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`0e979f8`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/0e979f859f06a3db175a106a7fc19570d3a5df10) - **deps**: Bump hashicorp/setup-terraform from 3 to 4 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`4bcc07d`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/4bcc07da3df58dfcd54cdbec9ba721f65bc970da) - add provider_meta for API usage tracking *(PR [#39](https://github.com/terraform-az-modules/terraform-azurerm-subnet/pull/39) by [@clouddrove-ci](https://github.com/clouddrove-ci))*
- [`32de718`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/32de71861c945b43ba6922e4c692cdc4ba2210bd) - **deps**: Bump terraform-az-modules/resource-group/azurerm *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`acf3453`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/acf3453a68a0425898f17fcf33c5fbfa0bdc32fb) - **deps**: Bump terraform-az-modules/vnet/azurerm *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`89bc16e`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/89bc16eb87cfe4e8766db47d92cc751c860ed187) - polish module with basic example, changelog, and version fixes *(PR [#42](https://github.com/terraform-az-modules/terraform-azurerm-subnet/pull/42) by [@clouddrove-ci](https://github.com/clouddrove-ci))*
- [`0b7756f`](https://github.com/terraform-az-modules/terraform-azurerm-subnet/commit/0b7756f74f7f722f924f9c1e5cd4df7018cfd368) - **deps**: Bump actions/checkout from 6 to 7 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*


## [1.0.2] - 2026-03-20

### Changes
- Add provider_meta for API usage tracking
- Add terraform tests and pre-commit CI workflow
- Add SECURITY.md, CONTRIBUTING.md, .releaserc.json
- Standardize pre-commit to antonbabenko v1.105.0
- Set provider: none in tf-checks for validate-only CI
- Bump required_version to >= 1.10.0
[v1.0.3]: https://github.com/terraform-az-modules/terraform-azurerm-subnet/compare/v1.0.2...v1.0.3
