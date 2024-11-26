# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2024-11-26
### :sparkles: New Features
- [`6af33f9`](https://github.com/clouddrove/terraform-azure-dns/commit/6af33f9271fe7480c42fa1d278d7733516b60188) - added dependabot.yml file *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`19a12bb`](https://github.com/clouddrove/terraform-azure-dns/commit/19a12bb8b0fa377a67cd2b38734ee0380ce75aed) - auto changelog action added *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`a693155`](https://github.com/clouddrove/terraform-azure-dns/commit/a6931554e5f1346edfe8f537a54445c9435cffb6) - Added support for private dns records *(PR [#36](https://github.com/clouddrove/terraform-azure-dns/pull/36) by [@13archit](https://github.com/13archit))*

### :bug: Bug Fixes
- [`52f9d3f`](https://github.com/clouddrove/terraform-azure-dns/commit/52f9d3f501f9d5d85e71d73464e58d2b3458717b) - add default value in variable.tf *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`7459bda`](https://github.com/clouddrove/terraform-azure-dns/commit/7459bda148ceba9b840e44486e94e9263ca8a5a3) - Fixed a record resource to use for_each *(commit by [@13archit](https://github.com/13archit))*
- [`b49764f`](https://github.com/clouddrove/terraform-azure-dns/commit/b49764f559d0843705e039ebeca650a09331e802) - Added comments and updates example folder hierarchy *(commit by [@13archit](https://github.com/13archit))*
- [`b39c75e`](https://github.com/clouddrove/terraform-azure-dns/commit/b39c75eb97fe4ae233d81313794b718343fbcbce) - Removed unwanted dependency in example *(commit by [@13archit](https://github.com/13archit))*
- [`2986018`](https://github.com/clouddrove/terraform-azure-dns/commit/29860188f160b7012475097797bc377d2e0f372c) - fixed dependabot bumps *(commit by [@cloudlovely](https://github.com/cloudlovely))*
- [`4d40f47`](https://github.com/clouddrove/terraform-azure-dns/commit/4d40f47c0dfcea9e0158e2efec869f46298f7cf0) - add attributes and latest version *(commit by [@mamrajyadav](https://github.com/mamrajyadav))*
- [`cc7ea08`](https://github.com/clouddrove/terraform-azure-dns/commit/cc7ea0896be3ac84ee5cc6e193ac7062f7cdc785) - update variables types *(commit by [@mamrajyadav](https://github.com/mamrajyadav))*
- [`53f2224`](https://github.com/clouddrove/terraform-azure-dns/commit/53f222462a6cb3dca9b95972dc896cbefc36d108) - fix tfchecks issue *(commit by [@mamrajyadav](https://github.com/mamrajyadav))*
- [`0d8c3b6`](https://github.com/clouddrove/terraform-azure-dns/commit/0d8c3b6e523415b677ff9d6ecb89fa66a9d9dedf) - change in count condition *(PR [#29](https://github.com/clouddrove/terraform-azure-dns/pull/29) by [@Rupalgw](https://github.com/Rupalgw))*

### :construction_worker: Build System
- [`75ccb34`](https://github.com/clouddrove/terraform-azure-dns/commit/75ccb34df35abb0847636d0c4291c6fae1f11dee) - Add tfsec workflow *(PR [#7](https://github.com/clouddrove/terraform-azure-dns/pull/7) by [@nileshgadgi](https://github.com/nileshgadgi))*
- [`aec0dd0`](https://github.com/clouddrove/terraform-azure-dns/commit/aec0dd0bd44200cc6bcf0356cbe107aa03fdcdaf) - **deps**: bump clouddrove/vnet/azure from 1.0.1 to 1.0.2 in /_example *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`122479f`](https://github.com/clouddrove/terraform-azure-dns/commit/122479f7af10cc54d6dacb37fb2af32d86af95d5) - **deps**: bump clouddrove/vnet/azure from 1.0.2 to 1.0.3 in /_example *(PR [#10](https://github.com/clouddrove/terraform-azure-dns/pull/10) by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`41bf90e`](https://github.com/clouddrove/terraform-azure-dns/commit/41bf90e3caf77ec420a6c4a995ae9457089fb0b5) - **deps**: bump hashicorp/setup-terraform from 1 to 2 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`d64461d`](https://github.com/clouddrove/terraform-azure-dns/commit/d64461d6530f2b3ad86fafda11c56170af1f1a90) - **deps**: bump pre-commit/action from 2.0.0 to 3.0.0 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`160fce5`](https://github.com/clouddrove/terraform-azure-dns/commit/160fce53cefec8c96facd4748f7f2093bb72723e) - **deps**: bump actions/setup-node from 1 to 3 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`ec86209`](https://github.com/clouddrove/terraform-azure-dns/commit/ec862090478f681d8783ed6cf37c21a519e72007) - **deps**: bump actions/setup-python from 2 to 4 *(PR [#16](https://github.com/clouddrove/terraform-azure-dns/pull/16) by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`a39fc97`](https://github.com/clouddrove/terraform-azure-dns/commit/a39fc9769a581ae0ef7f19bf93a108b76843ceb3) - **deps**: bump actions/checkout from 2 to 3 *(PR [#15](https://github.com/clouddrove/terraform-azure-dns/pull/15) by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`cfa31e2`](https://github.com/clouddrove/terraform-azure-dns/commit/cfa31e2b3296d39693205d42a3f67e3e241a5d3e) - **deps**: bump actions/checkout from 3 to 4 *(PR [#17](https://github.com/clouddrove/terraform-azure-dns/pull/17) by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`3b2961d`](https://github.com/clouddrove/terraform-azure-dns/commit/3b2961d261e81863343de7f3831f7e945c7032ea) - **deps**: bump clouddrove/github-shared-workflows *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`db20750`](https://github.com/clouddrove/terraform-azure-dns/commit/db207504a4d5aa609ddde220fadba22a734a957e) - **deps**: bump pre-commit/action from 3.0.0 to 3.0.1 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`89ae432`](https://github.com/clouddrove/terraform-azure-dns/commit/89ae432d8a0df0ed4368fbc1719b9f9eafab4944) - **deps**: bump clouddrove/github-shared-workflows from 1.2.1 to 1.2.2 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`1be1ef8`](https://github.com/clouddrove/terraform-azure-dns/commit/1be1ef814c33436c4f79a5642a7b8af0a288a03d) - **deps**: bump clouddrove/github-shared-workflows from 1.2.2 to 1.2.4 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`0a0981e`](https://github.com/clouddrove/terraform-azure-dns/commit/0a0981e9bd4cdc8ca23f231437b1bb5f8e30fb9c) - **deps**: bump clouddrove/github-shared-workflows from 1.2.4 to 1.2.5 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`a021087`](https://github.com/clouddrove/terraform-azure-dns/commit/a021087a3a35c3c22fbdf99a687b5410c76cd5cf) - **deps**: bump clouddrove/github-shared-workflows from 1.2.5 to 1.2.7 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`732955f`](https://github.com/clouddrove/terraform-azure-dns/commit/732955fea1edd43c03c2ba0d839a5c8ca87b24bd) - **deps**: bump clouddrove/github-shared-workflows from 1.2.7 to 1.2.8 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`7cc8697`](https://github.com/clouddrove/terraform-azure-dns/commit/7cc86972bdb74b9af62a8c2a37a0da15535b907f) - **deps**: update hashicorp/azurerm requirement from =3.86.0 to 4.10.0 in /examples/complete *(PR [#39](https://github.com/clouddrove/terraform-azure-dns/pull/39) by [@dependabot[bot]](https://github.com/apps/dependabot))*


## [1.0.0] - 2023-02-13
### :sparkles: New Features
- [`e53b8dd`](https://github.com/clouddrove/terraform-azure-dns/commit/e53b8dd67ae19d227bb67f99099f1700846f5769) - Added Terraform Azure Dns Module


[1.0.0]: https://github.com/clouddrove/terraform-azure-dns/compare/1.0.0...master
[2.0.0]: https://github.com/clouddrove/terraform-azure-dns/compare/1.0.0...2.0.0
