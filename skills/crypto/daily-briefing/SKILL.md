---
name: crypto-daily-briefing
description: "加密货币每日简报：每天定时生成全面的加密货币及 Web3 市场分析报告并推送邮箱。覆盖行情、新闻、链上数据、情绪指标、宏观经济。触发词：币圈日报、crypto briefing、每日行情、加密货币分析。"
metadata:
  openclaw:
    emoji: "📊"
    requires:
      bins: ["curl", "jq"]
    cron:
      schedule: "0 8 * * *"
      timezone: "Asia/Shanghai"
      description: "每天早上 8:00（北京时间）生成加密货币日报并推送邮箱"
---

# 加密货币每日简报 (Crypto Daily Briefing)

每天自动生成全面的加密货币及 Web3 生态市场分析报告，推送至邮箱。

## 概述

这是一个复合型 Skill，整合 20+ 数据源，覆盖：
- 💰 市场行情（价格、涨跌、市值）
- 📈 技术分析（趋势、支撑阻力、指标）
- 🔗 链上数据（Gas、活跃地址、大户动向）
- 😱 市场情绪（恐惧贪婪指数、社交热度）
- 📰 重要新闻（项目进展、监管动态）
- 🌍 宏观经济（美联储、美元指数、相关性）
- 🔥 热门板块（DeFi、NFT、Layer2、AI、Meme）
- 📅 日历事件（解锁、空投、升级）

---

## 数据源（全部免费/免 API Key）

### 一、行情数据
| 来源 | API | 用途 |
|------|-----|------|
| CoinGecko | `api.coingecko.com/api/v3/` | 价格、市值、涨跌幅、交易量 |
| CoinCap | `api.coincap.io/v2/` | 实时价格、市值排名 |
| Binance | `api.binance.com/api/v3/` | K线、深度、资金费率 |

### 二、链上数据
| 来源 | API | 用途 |
|------|-----|------|
| Etherscan | `api.etherscan.io/api` | ETH Gas、合约调用 |
| Blockchain.com | `blockchain.info/` | BTC 链上数据 |
| DefiLlama | `api.llama.fi/` | DeFi TVL、协议排名 |
| L2Beat | `l2beat.com/api/` | Layer2 TVL |

### 三、情绪指标
| 来源 | API | 用途 |
|------|-----|------|
| Alternative.me | `api.alternative.me/fng/` | 恐惧贪婪指数 |
| CoinGlass | 网页抓取 | 爆仓数据、多空比 |
| LunarCrush | `lunarcrush.com/api/` | 社交媒体情绪 |

### 四、新闻资讯
| 来源 | 方式 | 用途 |
|------|------|------|
| CoinDesk | RSS/网页 | 英文主流新闻 |
| CoinTelegraph | RSS | 英文深度报道 |
| The Block | RSS | 机构向新闻 |
| 金色财经 | 网页 | 中文新闻 |
| PANews | 网页 | 中文深度 |
| 律动 BlockBeats | 网页 | 中文快讯 |
| Foresight News | 网页 | 中文研究 |

### 五、宏观经济
| 来源 | 方式 | 用途 |
|------|------|------|
| TradingView | 网页 | 美元指数 DXY、美债收益率 |
| Investing.com | 网页 | 宏观数据日历 |
| CME FedWatch | 网页 | 加息概率 |

### 六、日历/事件
| 来源 | 方式 | 用途 |
|------|------|------|
| TokenUnlocks | 网页 | 代币解锁时间表 |
| CoinMarketCal | 网页 | 项目事件日历 |
| DeFi 项目官方 | Twitter/Discord | 升级、空投 |

---

## 指令

每天早上在指定时间执行以下完整流程，生成加密货币市场日报。

### 第一步：数据采集

按优先级依次拉取数据（某个源失败时跳过，不阻塞整体）：

```bash
# 1. 行情数据 - CoinGecko Top 20
curl -s "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=1h,24h,7d"

# 2. 全球市场概览
curl -s "https://api.coingecko.com/api/v3/global"

# 3. 恐惧贪婪指数
curl -s "https://api.alternative.me/fng/?limit=7"

# 4. DeFi TVL
curl -s "https://api.llama.fi/protocols"

# 5. ETH Gas
curl -s "https://api.etherscan.io/api?module=gastracker&action=gasoracle"

# 6. BTC 链上
curl -s "https://blockchain.info/stats?format=json"

# 7. 趋势搜索
curl -s "https://api.coingecko.com/api/v3/search/trending"
```

### 第二步：新闻聚合

从以下 RSS/网页抓取过去 24h 的重要新闻：
- 英文：CoinDesk, CoinTelegraph, The Block
- 中文：金色财经, PANews, 律动 BlockBeats, Foresight News

筛选规则：
- 按影响力排序（监管 > 大项目 > 市场动态 > 观点）
- 去重（同一事件只保留信息量最大的一条）
- 最终保留 8-12 条

### 第三步：分析生成

基于收集的数据，生成以下分析：

1. **市场概述** — 总市值变化、BTC 占比、整体涨跌格局
2. **BTC/ETH 深度分析** — 价格、趋势、关键支撑阻力位
3. **热门涨跌** — 涨幅/跌幅 Top 5 + 原因
4. **板块轮动** — DeFi/NFT/Layer2/AI/Meme/RWA 各板块表现
5. **链上信号** — Gas趋势、大户动向、交易所流入流出
6. **情绪判断** — 恐惧贪婪 + 社交热度 + 资金费率
7. **宏观关联** — DXY、美债、降息预期对 Crypto 的影响
8. **日历提醒** — 今日/本周重要事件
9. **操作建议** — 风险提示 + 关注机会（非投资建议）

### 第四步：格式化输出

---

## 报告格式

```markdown
# 🪙 加密货币每日简报

📅 日期：YYYY-MM-DD（周X）
⏰ 生成时间：HH:MM（北京时间）

---

## 📊 市场一览

| 指标 | 数值 | 24h变化 |
|------|------|---------|
| 总市值 | $X.XX T | +X.X% |
| 24h交易量 | $XXX B | +X.X% |
| BTC 占比 | XX.X% | +X.X% |
| 恐惧贪婪指数 | XX (恐惧/贪婪) | 昨日 XX |
| ETH Gas | XX Gwei | |

---

## 🏆 Top 10 行情

| # | 币种 | 价格 | 24h | 7d | 市值 |
|---|------|------|-----|-----|------|
| 1 | BTC | $XX,XXX | +X.X% | +X.X% | $X.XX T |
| 2 | ETH | $X,XXX | +X.X% | +X.X% | $XXX B |
| ... | | | | | |

---

## 🔥 今日焦点

### 涨幅榜 Top 5
1. XXX (+XX%) — [原因]
2. ...

### 跌幅榜 Top 5
1. XXX (-XX%) — [原因]
2. ...

---

## 📈 BTC 技术分析

- **当前价格**：$XX,XXX
- **24h 区间**：$XX,XXX - $XX,XXX
- **关键支撑**：$XX,XXX / $XX,XXX
- **关键阻力**：$XX,XXX / $XX,XXX
- **趋势判断**：[短期看多/看空/震荡]
- **依据**：[简要技术面理由]

---

## 📈 ETH 技术分析

[同上结构]

---

## 🔗 链上数据

- **BTC 交易所净流入**：[流入/流出] XXX BTC
- **ETH Gas 趋势**：XX Gwei（较昨日 ↑/↓）
- **大户动向**：[鲸鱼地址变动摘要]
- **稳定币发行量**：USDT $XXX B / USDC $XXX B

---

## 🏗️ 板块表现

| 板块 | 24h表现 | 代表项目 | 亮点 |
|------|---------|---------|------|
| DeFi | +X.X% | AAVE, UNI | [一句话] |
| Layer2 | +X.X% | ARB, OP | [一句话] |
| AI | +X.X% | FET, RNDR | [一句话] |
| Meme | +X.X% | DOGE, PEPE | [一句话] |
| RWA | +X.X% | ONDO, MKR | [一句话] |
| NFT | +X.X% | APE, BLUR | [一句话] |

---

## 🌍 宏观环境

- **美元指数 (DXY)**：XXX.XX（+X.X%）
- **美债10Y收益率**：X.XX%
- **降息预期**：下次会议 X月，市场定价降息概率 XX%
- **相关性判断**：[BTC 与美股/黄金的联动分析]
- **本周宏观事件**：[CPI/非农/FOMC 等]

---

## 📰 重要新闻（按影响力排序）

1. 🔴 [高影响] **标题** — 一句话摘要 + 对市场的影响
2. 🟡 [中影响] **标题** — 摘要
3. 🟡 [中影响] **标题** — 摘要
4. 🟢 [低影响] **标题** — 摘要
...

---

## 📅 近期日历

| 日期 | 事件 | 影响 |
|------|------|------|
| 今天 | [XXX 代币解锁 $XM] | ⚠️ 抛压 |
| 明天 | [XXX 主网升级] | 📈 利好 |
| 本周 | [美国 CPI 数据] | 🌍 宏观 |

---

## 💡 今日观点

**市场情绪**：[一句话总结当前市场状态]

**短期展望**：[1-3天内可能的走势]

**关注机会**：
- [具体方向1 + 逻辑]
- [具体方向2 + 逻辑]

**风险提醒**：
- [当前最大风险点]

---

> ⚠️ 本报告由 AI 自动生成，仅供参考，不构成投资建议。
> 数据来源：CoinGecko, DefiLlama, Alternative.me, Etherscan, CoinDesk, PANews 等
```

---

## 第五步：推送邮箱

将生成的报告通过邮件发送。支持以下方式：
- HTML 格式邮件（推荐，排版好看）
- Markdown 附件
- 纯文本备用

邮件主题格式：`[Crypto日报] YYYY-MM-DD | BTC $XX,XXX (±X.X%) | 恐惧贪婪 XX`

---

## 配置

使用前需要在 `config.json` 中设置：

```json
{
  "email": {
    "to": "your@email.com",
    "smtp": {
      "host": "smtp.example.com",
      "port": 465,
      "user": "your@email.com",
      "pass": "your-password"
    }
  },
  "schedule": {
    "cron": "0 8 * * *",
    "timezone": "Asia/Shanghai"
  },
  "watchlist": {
    "coins": ["bitcoin", "ethereum", "solana", "bnb", "xrp", "cardano", "avalanche", "polkadot", "chainlink", "arbitrum"],
    "sectors": ["defi", "layer2", "ai", "meme", "rwa", "nft"]
  },
  "preferences": {
    "language": "zh-CN",
    "include_technical_analysis": true,
    "include_macro": true,
    "include_onchain": true,
    "risk_tolerance": "medium",
    "detail_level": "full"
  }
}
```

---

## 自定义选项

| 选项 | 说明 | 默认值 |
|------|------|--------|
| `watchlist.coins` | 关注的币种列表 | Top 10 |
| `detail_level` | full/summary/brief | full |
| `include_technical_analysis` | 是否含技术分析 | true |
| `include_macro` | 是否含宏观分析 | true |
| `risk_tolerance` | 影响操作建议口吻 | medium |
| `schedule.cron` | 定时规则 | 每天 8:00 AM |
| `alert_threshold` | 大涨大跌阈值(%) | 10 |

---

## 特殊事件告警

当以下情况发生时，额外发送即时告警（不等每日定时）：

- 🚨 BTC 24h 涨跌超过 ±10%
- 🚨 恐惧贪婪指数跌至 <10（极度恐惧）或 >90（极度贪婪）
- 🚨 重大监管新闻（交易所被查、ETF 审批等）
- 🚨 关注列表中任何币种 24h 涨跌超过 ±20%

---

## 数据可靠性

- 每个数据源有备用方案（CoinGecko 挂了用 CoinCap）
- API 调用失败时标注 [数据暂不可用]，不影响其他部分
- 所有数据标注获取时间
- 新闻来源交叉验证（同一事件对比多个来源）

---

## 规则

- **客观为主** — 报告数据，不煽动情绪
- **标注确定性** — 确定的事实 vs 推测性判断
- **不做精确预测** — "可能测试支撑位" 而非 "明天会跌到 X"
- **风险警示必须有** — 每份报告结尾必须有免责声明
- **时效标注** — 所有价格数据标注具体时间
- **中文为主，术语保留英文** — "DeFi TVL" 不翻译为 "去中心化金融总锁仓量"
