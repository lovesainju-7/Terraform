module "dev-infra-app" {
  source = "./infra-app"

  env            = "dev"
  bucket-name    = "infra-app-bucket-123"
  instance_count = 1
  instance_type  = "t3.micro"
  hash_key       = "LockID"

}

module "prd-infra-app" {
  source = "./infra-app"

  env            = "prd"
  bucket-name    = "infra-app-bucket-123"
  instance_count = 2
  instance_type  = "t3.micro"
  hash_key       = "LockID"

}


module "stg-infra-app" {
  source = "./infra-app"

  env            = "stg"
  bucket-name    = "infra-app-bucket-123"
  instance_count = 1
  instance_type  = "t3.micro"
  hash_key       = "LockID"

}
