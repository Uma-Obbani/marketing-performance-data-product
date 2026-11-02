# Data Quality Requirements

## Objective
Ensure marketing campaign data is accurate, complete, consistent and reliable before it is displayed in the marketing performance dashboard.

## Data Quality Rules

| ID | Quality Rule | Expected Result | Priority |
|---|---|---|---|
| DQ-001 | Campaign ID must not be empty | Every record has a campaign ID | High |
| DQ-002 | Marketing spend cannot be negative | Spend must be >= 0 | High |
| DQ-003 | Conversions cannot be negative | Conversions must be >= 0 | High |
| DQ-004 | Revenue cannot be negative | Revenue must be >= 0 | High |
| DQ-005 | Channel must be recognized | Only approved marketing channels | Medium |
| DQ-006 | Reporting week must be valid | Valid reporting date | High |
| DQ-007 | Duplicate records must be identified | One record per campaign, region and week | High |
| DQ-008 | ROAS must be calculated consistently | Revenue / spend, with zero spend handled safely | High |

## Product Behaviour

1. Display a data-quality warning when critical validation fails.
2. Do not silently display incomplete or unreliable KPI values.
3. Show the reporting period and last successful data refresh.
4. Make data-quality issues visible to authorized users.
5. Allow users to identify affected campaigns and reporting periods.

## Acceptance Criteria

- Given a campaign record has a missing campaign ID, when validation runs, then the record is flagged.
- Given marketing spend is negative, when validation runs, then the record is flagged.
- Given marketing spend is zero, when ROAS is calculated, then ROAS is shown as unavailable rather than causing a calculation error.
- Given duplicate campaign records exist for the same reporting week and region, when validation runs, then the duplicates are identified.

## Open Business Decisions

- Which marketing channels are approved?
- How should refunds and cancelled orders affect revenue?
- Which attribution model should be used?
- Who approves KPI definitions and data-quality exceptions?