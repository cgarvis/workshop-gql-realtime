resource "aws_dynamodb_table" "conversations" {
  name = "chatty_conversations"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "users" {
  name = "chatty_users"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "messages" {
  name = "chatty_messages"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "conversationId"
  range_key = "createdAt"

  attribute {
    name = "conversationId"
    type = "S"
  }

  attribute {
    name = "createdAt"
    type = "S"
  }
}
