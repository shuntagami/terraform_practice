resource "aws_instance" "example" {
  ami           = "ami-0f9ae750e8274075b"
  instance_type = "t2.micro"

  user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd.service
EOF
}

output "example_instance_id" {
  value = aws_instance.example.id
}


