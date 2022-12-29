terraform {
 backend "gcs" {
   bucket  = "gcs-bucket-tfstate"
   prefix  = "terraform/state"
 }
}
