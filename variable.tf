variable "project" {
  default = "terra-run-build"
  description = "The project name"
}

variable "keyringname" {
  default = "kmstestproject"
  type = string
  description = "keyring name"
}

variable "region" {
    default = "us-central1"
    description = "the name of the region"
}

variable "keyname" {
  default =  ["kmstestkeyname"]
  description = "key names"
  type = list(string)
}