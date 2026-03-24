# Project Aegis: AI Infrastructure Orchestration
# Purpose: Provisioning H100 GPU Clusters across 1,400 Distributed Sites

module "ai_cluster_edge" {
  source  = "./modules/gpu-node-pool"
  version = "3.2.1"

  # Scaling for 1,400 Logistics Sites
  site_count       = 1400
  gpu_type         = "nvidia-h100-80gb"
  machine_type     = "a3-highgpu-8g"
  
  # Integration with NIST AI RMF Policies
  enforce_nist_compliance = true
  encryption_at_rest      = true

  # Fleet Management for 200+ Autonomous Units
  fleet_id         = "fleet-alpha-200"
  telemetry_prefix = "aegis-ai-logs"
}

output "control_plane_endpoint" {
  value       = module.ai_cluster_edge.endpoint
  description = "The centralized management endpoint for the AI Transformation layer."
}
