provider "google" {
    project = var.project
    region = var.region
    credentials = "credentials.json"
  
}

locals {
  kmstest_sa = "serviceAccount: ${google_service_account.kmstestsa.email}"

  service_name  = "kmstest"
}