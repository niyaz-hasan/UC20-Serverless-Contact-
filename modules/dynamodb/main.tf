resource "aws_dynamodb_table" "contact_form" {
  name         = "ContactFormSubmissions"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
