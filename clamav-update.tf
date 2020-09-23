//resource "aws_lambda_layer_version" "
//
//resource "aws_lambda_function" "clamav-update" {
//}

//resource "aws_iam_role" "clamav-update-role" {
//  assume_role_policy = <<EOF
//  {
//  "permissionsBoundary": {},
//  "roleName": "clamav-update-role-i1ozd4og",
//  "policies": [
//    {
//      "document": {
//        "Version": "2012-10-17",
//        "Statement": [
//          {
//            "Effect": "Allow",
//            "Action": [
//              "logs:CreateLogGroup",
//              "logs:CreateLogStream",
//              "logs:PutLogEvents",
//              "ec2:CreateNetworkInterface",
//              "ec2:DescribeNetworkInterfaces",
//              "ec2:DeleteNetworkInterface"
//            ],
//            "Resource": "*"
//          }
//        ]
//      },
//      "name": "AWSLambdaVPCAccessExecutionRole",
//      "id": "ANPAJVTME3YLVNL72YR2K",
//      "type": "managed",
//      "arn": "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
//    },
//    {
//      "document": {
//        "Version": "2012-10-17",
//        "Statement": [
//          {
//            "Sid": "VisualEditor0",
//            "Effect": "Allow",
//            "Action": [
//              "ec2:CreateNetworkInterface",
//              "ec2:DescribeNetworkInterfaces",
//              "ec2:DeleteNetworkInterface"
//            ],
//            "Resource": "*"
//          },
//          {
//            "Sid": "VisualEditor1",
//            "Effect": "Allow",
//            "Action": [
//              "logs:CreateLogStream",
//              "logs:PutLogEvents"
//            ],
//            "Resource": "arn:aws:logs:eu-central-1:026047601205:log-group:/aws/lambda/clamav-update:*"
//          },
//          {
//            "Sid": "VisualEditor2",
//            "Effect": "Allow",
//            "Action": "logs:CreateLogGroup",
//            "Resource": "arn:aws:logs:eu-central-1:026047601205:*"
//          }
//        ]
//      },
//      "name": "AWSLambdaBasicExecutionRole-cdb96d19-6066-435d-abc9-0a4d5271169d",
//      "id": "ANPAQMEEO3I22QEQX6MRP",
//      "type": "managed",
//      "arn": "arn:aws:iam::026047601205:policy/service-role/AWSLambdaBasicExecutionRole-cdb96d19-6066-435d-abc9-0a4d5271169d"
//    },
//    {
//      "document": {
//        "Version": "2012-10-17",
//        "Statement": [
//          {
//            "Effect": "Allow",
//            "Action": [
//              "elasticfilesystem:ClientMount",
//              "elasticfilesystem:ClientRootAccess",
//              "elasticfilesystem:ClientWrite",
//              "elasticfilesystem:DescribeMountTargets"
//            ],
//            "Resource": "*"
//          }
//        ]
//      },
//      "name": "AmazonElasticFileSystemClientFullAccess",
//      "id": "ANPAZKAPJZG4KAMR2MLDF",
//      "type": "managed",
//      "arn": "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientFullAccess"
//    }
//  ],
//  "trustedEntities": [
//    "lambda.amazonaws.com"
//  ]
//}
//EOF
//}
//}

//data "aws_iam_policy_do" "" {}
