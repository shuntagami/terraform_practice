# リスト12.1 データベースのユーザ名の定義
resource "aws_ssm_parameter" "db_username" {
  name        = "/db/username"
  value       = "root"
  type        = "String"
  description = "データベースの接続ユーザ名"
}

# リスト12.3 データベースのパスワードのダミー定義
resource "aws_ssm_parameter" "db_password" {
  name        = "/db/password"
  value       = "password"
  type        = "SecureString"
  description = "データベースのパスワード"

  lifecycle {
    ignore_changes = [value]
  }
}

# RAILS_MASTER_KEYのダミー定義
resource "aws_ssm_parameter" "rails_master_key" {
  name        = "/rails/master_key"
  value       = "rails_master_key"
  type        = "SecureString"
  description = "railsマスターキー"

  lifecycle {
    ignore_changes = [value]
  }
}
