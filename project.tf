resource "google_project_service" "run" {
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "cloudkms" {
  service = "cloudkms.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "firestore" {
  project = var.project
  service = "firestore.googleapis.com"
  disable_on_destroy = false

  disable_dependent_services = true
}

# create a service account
resource "google_service_account" "kmstestsa" {
  account_id = "kmstestsa"
  display_name = "kmstestsa"
  project = var.project
  depends_on = [ google_project_service.iam ]
}

#assign IAM roles to service account

resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.kmstestsa.name
  role = "rolea/Editor"

  members = [ 
    "service_account: ${google_service_account.kmstestsa.email}",
   ]
}