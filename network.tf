# リスト7.1
resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "example"
  }
}


# リスト7.2(パブリックサブネット)
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
}

# リスト7.3
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
}

# リスト7.4
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
}

# リスト7.5
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.example.id
  destination_cidr_block = "0.0.0.0/0"
}

# リスト7.6
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}



# リスト7.7(プライベートサブネット)
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.64.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false
}

# リスト7.8 プライベートルートテーブルと関連付けの定義
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
