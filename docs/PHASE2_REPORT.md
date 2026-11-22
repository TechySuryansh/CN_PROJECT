# Phase 2 review record

Phase 1 is complete. Phase 2 extends the same LAN. The [setup guide](PHASE2.md) identifies the machines and the [topology](diagrams.md#7-phase-2-topology-lan-mode) shows the paths.

## Baseline on 22 November 2026

| Probe from mac1-suryansh | Observed result | Interpretation |
|---|---|---|
| Query the primary DNS at 10.163.184.36 for app.team1.test | Returned 10.163.184.63 | The primary published the expected edge address. |
| Query the backup DNS at 10.163.184.63 for the same name | Timed out | Backup resolution still needs verification on Pranjal’s Mac. |
| TCP connection to 10.163.184.63 on 8443 | Timed out | The primary edge was unreachable from this client during the check. The cause is unconfirmed. |
| TCP connection to 10.163.184.26 on 3001 | Succeeded | Backend A’s port was reachable before isolation. |
| TCP connection to 10.163.184.143 on 3002 | Connection refused | Check the Backend B listener on Sarvjeet’s Mac before testing failover. |

## Review evidence still needed

| Extension | Change from Phase 1 | Observation to record on the LAN |
|---|---|---|
| A | Second DNS server and dual-server client configuration | Matching app and API records, primary offline, uncached client lookup and HTTPS request succeed, primary restored. |
| B | Short TTL and a controlled address change | Old cached address, first new answer after expiry, and the result of manual cache flushing. |
| C | Backend firewall rules for Mac 2 | Both direct ports reachable from Mac 2 and blocked from Mac 1, followed by rollback on both backend Macs. |
| D | Verify nginx retry and recovery | Request results before, during and after stopping A. Identify the remaining primary edge dependency. |
| E | Standby nginx and DNS cutover | Old and new client answers, the responding edge label and application response, then restoration. |
| F | Diagnose a faculty-selected fault | Symptom, first failing layer, confirming command, repair and successful retest. |

For the final review, link each observed result to its transcript or capture and add one paragraph per extension explaining what the team learned from the run.
