resource "aws_iam_role_policy" "ecr_policy" {
  name = "EcrFullAccessPolicy"
  role = aws_iam_role.ecr_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "ecr_role" {
  name = "EcrFullAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ecr_profile" {
  name = "ecr_profile"
  role = aws_iam_role.ecr_role.name
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = var.ssh_key_name
  iam_instance_profile = aws_iam_instance_profile.ecr_profile.name

  vpc_security_group_ids = [
    aws_security_group.random_post_card_http_security_group.id,
    aws_security_group.random_post_card_ssh_security_group.id
  ]

  tags = {
    Name      = "randomPostcard"
    Project   = "RandomPostcard"
    Terraform = true
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  vpc      = true
}