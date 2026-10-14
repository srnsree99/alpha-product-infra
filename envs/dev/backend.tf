terraform {
  backend "s3" {
    bucket       = "alpha-product-terraform-state-sree" 
    key          = "envs/dev/terraform.tfstate"
    region       = "ap-southeast-2"
    encrypt      = true
    use_lockfile = true   # S3 native locking
  }
}
