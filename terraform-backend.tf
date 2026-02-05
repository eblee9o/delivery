resource "aws_s3_bucket" "test-s3-tf-state" {

  bucket = "test-eks-bucket02"

  tags = {
    "Name" = "test-eks-bucket02"
  }

}

resource "aws_dynamodb_table" "test-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.test-s3-tf-state]
  name         = "test-eks-ddb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "test-eks-ddb"
  }

}

