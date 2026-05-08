#!/bin/bash
# crypto-daily-briefing.sh
# 加密货币每日简报 - 数据采集脚本
# 用法: bash crypto-daily-briefing.sh [output_dir]

set -euo pipefail

OUTPUT_DIR="${1:-/tmp/crypto-briefing}"
mkdir -p "$OUTPUT_DIR"
DATE=$(date +%Y-%m-%d)
echo "📊 开始采集加密货币数据... ($DATE)"

# ========== 1. 行情数据 ==========
echo "  [1/7] 行情数据 (CoinGecko)..."
curl -sf "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=1h%2C24h%2C7d" \
  -o "$OUTPUT_DIR/markets.json" 2>/dev/null || echo '[]' > "$OUTPUT_DIR/markets.json"
sleep 2

# ========== 2. 全球市场概览 ==========
echo "  [2/7] 全球市场..."
curl -sf "https://api.coingecko.com/api/v3/global" \
  -o "$OUTPUT_DIR/global.json" 2>/dev/null || echo '{}' > "$OUTPUT_DIR/global.json"
sleep 2

# ========== 3. 恐惧贪婪指数 ==========
echo "  [3/7] 恐惧贪婪指数..."
curl -sf "https://api.alternative.me/fng/?limit=7&format=json" \
  -o "$OUTPUT_DIR/fear_greed.json" 2>/dev/null || echo '{}' > "$OUTPUT_DIR/fear_greed.json"

# ========== 4. DeFi TVL ==========
echo "  [4/7] DeFi TVL..."
curl -sf "https://api.llama.fi/v2/historicalChainTvl" \
  -o "$OUTPUT_DIR/defi_tvl.json" 2>/dev/null || echo '[]' > "$OUTPUT_DIR/defi_tvl.json"
sleep 1

# ========== 5. 趋势币种 ==========
echo "  [5/7] 趋势币种..."
curl -sf "https://api.coingecko.com/api/v3/search/trending" \
  -o "$OUTPUT_DIR/trending.json" 2>/dev/null || echo '{}' > "$OUTPUT_DIR/trending.json"
sleep 2

# ========== 6. BTC 链上数据 ==========
echo "  [6/7] BTC 链上数据..."
curl -sf "https://blockchain.info/stats?format=json" \
  -o "$OUTPUT_DIR/btc_onchain.json" 2>/dev/null || echo '{}' > "$OUTPUT_DIR/btc_onchain.json"

# ========== 7. ETH Gas ==========
echo "  [7/7] ETH Gas..."
curl -sf "https://api.etherscan.io/api?module=gastracker&action=gasoracle&apikey=YourApiKeyToken" \
  -o "$OUTPUT_DIR/eth_gas.json" 2>/dev/null || echo '{}' > "$OUTPUT_DIR/eth_gas.json"

# ========== 汇总 ==========
echo ""
echo "✅ 数据采集完成！文件位于: $OUTPUT_DIR/"
ls -la "$OUTPUT_DIR"/*.json 2>/dev/null | awk '{print "  " $NF " (" $5 " bytes)"}'
echo ""
echo "📝 下一步: 将数据交给 AI 生成分析报告"
