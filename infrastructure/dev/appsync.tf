resource "aws_appsync_graphql_api" "api" {
  name = "chatty"
  authentication_type = "AMAZON_COGNITO_USER_POOLS"
  user_pool_config {
    aws_region = "${var.aws_region}"
    default_action = "DENY"
    user_pool_id = "${aws_cognito_user_pool.chatty.id}"
  }
}

resource "aws_appsync_datasource" "users" {
  api_id = "${aws_appsync_graphql_api.api.id}"
  name = "users"
  type = "AMAZON_DYNAMODB"
  dynamodb_config {
    region = "us-west-2"
    table_name = "${aws_dynamodb_table.users.name}"
  }
  service_role_arn = "${aws_iam_role.appsync.arn}"
}

resource "aws_appsync_datasource" "messages" {
  api_id = "${aws_appsync_graphql_api.api.id}"
  name = "messages"
  type = "AMAZON_DYNAMODB"
  dynamodb_config {
    region = "us-west-2"
    table_name = "${aws_dynamodb_table.messages.name}"
  }
  service_role_arn = "${aws_iam_role.appsync.arn}"
}

resource "aws_appsync_datasource" "conversations" {
  api_id = "${aws_appsync_graphql_api.api.id}"
  name = "conversations"
  type = "AMAZON_DYNAMODB"
  dynamodb_config {
    region = "us-west-2"
    table_name = "${aws_dynamodb_table.conversations.name}"
  }
  service_role_arn = "${aws_iam_role.appsync.arn}"
}

resource "aws_iam_role" "appsync" {
  name = "chatty_appsync"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "appsync.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "dynamodb" {
  name = "appsync_dynamodb"
  role = "${aws_iam_role.appsync.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_dynamodb_table.conversations.arn}",
        "${aws_dynamodb_table.messages.arn}",
        "${aws_dynamodb_table.users.arn}"
      ]
    }
  ]
}
EOF
}

