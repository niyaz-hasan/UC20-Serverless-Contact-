resource "aws_lambda_function" "this" {
  function_name = var.lambda_name
  role          = aws_iam_role.lambda_exec.arn
  handler       = "handler.lambda_handler"
  runtime       = "python3.11"
  filename      = var.lambda_zip
  timeout          = 30
  memory_size      = 128
  source_code_hash = filebase64sha256(var.lambda_zip)
  depends_on       = [aws_iam_role.lambda_exec]

  environment {
    variables = {
      TABLE_NAME      = var.aws_dynamodb_table_name
      EMAIL_RECIPIENT = var.email_recipient
    }
  }
}


output "lambda_function_name" {
  value = aws_lambda_function.this.function_name
}

output "lambda_arn" {
  description = "Lambda function ARN"
  value       = aws_lambda_function.this.arn
}