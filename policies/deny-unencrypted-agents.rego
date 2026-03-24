package terraform.policies.nist_ai_rmf

# NIST AI RMF - Data Privacy & Encryption Enforcement
# Scope: 1,400+ Distributed Logistics Sites

default allow = false

# Rule: Block any AI Cluster that lacks encryption
deny[msg] {
    input.resource_type == "google_container_cluster"
    not input.attributes.database_encryption_state == "ENCRYPTED"
    msg = "CRITICAL: AI Cluster deployment denied. NIST AI RMF requires encryption."
}

# Rule: Ensure Guardrail Tags are present for 200+ Fleets
deny[msg] {
    some i
    resource := input.resources[i]
    not resource.tags["Governance-Tier"]
    msg = "GOVERNANCE ERROR: Missing mandatory 'Governance-Tier' tag."
}
