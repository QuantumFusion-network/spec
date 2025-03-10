# Bref
Here you can find how we are working in the dev team and what dev team members
should to help other members be on the same page.

# PolkaDot SDK upstream update
- Repo: https://github.com/QuantumFusion-network/polkadot-sdk.
- Freeze version for a new milestone; update to new version once for milestone.
- Use the last stable release version during the freeze, links: https://github.com/paritytech/polkadot-sdk/releases or https://github.com/paritytech/polkadot-sdk/releases/latest.
- Ad hoc version updates allowed

# PolkaJS
- Repo: https://github.com/QuantumFusion-network/apps.
- Once per 4 weeks or fix version for new milestone.
- Freeze version for a new milestone; update to new version once for milestone.
- Stable version is version that can work with current PolkaDot SDK release.
- Ad hoc version updates allowed.

# Polka telemetry
- Repo: https://github.com/QuantumFusion-network/substrate-telemetry.
- Not updating while working well

# Qf-squid
- Repo: https://github.com/QuantumFusion-network/qf-squid.
- Not updating while working well.

# PolkaVM
- Repo: https://github.com/QuantumFusion-network/qf-solochain/blob/main/.gitmodules.
- Update version or not while checking the difference of upstream once per 3 weeks.

# Code contribution guide
Please find and read document [code_contribution_guide](code_contribution_guide.md).

# Releases
Each repository SHOULD have a release tag, and each tag should have a strong formatted text, which is: MAJOR-MINOR-PATCH. For forked repos that we are changing SHOULD be: FORKED_REPOS_MAJOR-FORKED_REPOS_MINOR-FORKED_REPOS_PATCH-MAJOR-MINOR-PATCH.

Example: let's say polkadotsdk has version 1.0.0, qf-solochain has version 0.5.0, then the full version is 1.0.0-0.5.0.

# Daily status reports
Each team member responsible for development SHOULD post a daily status report to related Zulip channel. Key ideas behind this report is reduce number of calls and keep business team in the same page with dev team. However dev team members should keep GH's tickets upated no matter on this report.

## Template Daily status report

Daily status report SHOULD posted in the related channel between 16:00 - 17:00 UTC 3.

### Case: NAME OF THE CASE (link to GH ticket)
### Experment: NAME OF THE EXPEREMENT (link to GH ticket)
### List of tickets for today:
- [NAME OF THE TICKET] (link to GH ticket), estimation to done: DATE, current status: A LINK TO LATEST GH comment (preferred) OR/AND any TEXT comment what you wish to share about status
- ...

### List of tickets for tomorrow:
- [NAME OF THE TICKET] (link to GH ticket)
- ...

### Blockers:
- [BLOCKER ... or NO BLOCKERS]
- ...
