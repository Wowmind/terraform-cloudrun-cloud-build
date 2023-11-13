# key management service

module "kms" {
  source  = "terraform-google-modules/kms/google"
  version = "~> 2.2"

  project_id         = var.project
  location           = var.region
  keyring            = var.keyringname
  keys               = var.keyname
}

# Manually apply to kms

resource "google_kms_crypto_key_iam_binding" "binding" {
  crypto_key_id = "${var.project}/${var.region}/${var.keyringname}/${var.keyname[0]}"
  role = "roles/cloudkms.cryptokeyEncrypterDecrypter"
  
  members = [ local.kmstest_sa ]
}