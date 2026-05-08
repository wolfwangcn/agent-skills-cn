#!/bin/bash
# send-email.sh
# 发送加密货币日报邮件
# 用法: bash send-email.sh <report.html> <config.json>

set -euo pipefail

REPORT_FILE="${1:?用法: send-email.sh <report_file> <config_file>}"
CONFIG_FILE="${2:?请提供 config.json 路径}"

# 从 config 读取邮箱配置
SMTP_HOST=$(jq -r '.email.smtp.host' "$CONFIG_FILE")
SMTP_PORT=$(jq -r '.email.smtp.port' "$CONFIG_FILE")
SMTP_USER=$(jq -r '.email.smtp.user' "$CONFIG_FILE")
SMTP_PASS=$(jq -r '.email.smtp.pass' "$CONFIG_FILE")
TO_EMAIL=$(jq -r '.email.to' "$CONFIG_FILE")

DATE=$(date +%Y-%m-%d)

# 从报告中提取 BTC 价格作为邮件主题（如果可能）
BTC_PRICE=$(grep -oP 'BTC.*?\$[\d,]+' "$REPORT_FILE" 2>/dev/null | head -1 || echo "BTC")
SUBJECT="[Crypto日报] $DATE | $BTC_PRICE"

echo "📧 发送邮件..."
echo "  收件人: $TO_EMAIL"
echo "  主题: $SUBJECT"

# 使用 curl 通过 SMTP 发送
curl -sf --url "smtps://$SMTP_HOST:$SMTP_PORT" \
  --ssl-reqd \
  --mail-from "$SMTP_USER" \
  --mail-rcpt "$TO_EMAIL" \
  --user "$SMTP_USER:$SMTP_PASS" \
  -H "From: Crypto Daily <$SMTP_USER>" \
  -H "To: $TO_EMAIL" \
  -H "Subject: $SUBJECT" \
  -H "Content-Type: text/html; charset=UTF-8" \
  --upload-file "$REPORT_FILE"

if [ $? -eq 0 ]; then
  echo "✅ 邮件发送成功！"
else
  echo "❌ 邮件发送失败，请检查 SMTP 配置"
  exit 1
fi
