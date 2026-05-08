---
name: tech-research
description: "技术调研：基于 ThoughtWorks 技术雷达、Gartner Hype Cycle 和 CHAOSS 指标体系进行系统化技术评估。当用户提到'调研'、'选型'、'对比'、'分析一下'、'哪个好'时激活。"
metadata:
  openclaw:
    emoji: "🔬"
---

# 技术调研 (Tech Research)

基于 ThoughtWorks 技术雷达方法论、Gartner 成熟度曲线和开源健康度指标体系（CHAOSS），进行系统化技术调研和选型。

---

## 方法论基础

### ThoughtWorks 技术雷达

来源：https://www.thoughtworks.com/radar

由全球技术顾问委员会（TAB）基于实际项目经验评估，四象限四环级：

**四象限**：Techniques | Tools | Platforms | Languages & Frameworks

**四环级（成熟度评估）**：

| 环级 | 含义 | 建议 |
|------|------|------|
| **Adopt** | 行业已验证，强烈推荐 | 可在生产环境大规模使用 |
| **Trial** | 值得认真尝试 | 适合在非关键项目中试用 |
| **Assess** | 值得了解和探索 | 投入时间研究，暂不用于生产 |
| **Hold** | 谨慎使用 | 新项目避免选用，已有项目计划迁移 |

### Gartner Hype Cycle（技术成熟度曲线）

来源：https://www.gartner.com/en/research/methodologies/gartner-hype-cycle

**五阶段**：

```
期望值
  │    ╭──╮ Peak of Inflated Expectations
  │   ╱    ╲
  │  ╱      ╲
  │ ╱        ╲         ╭────── Plateau of Productivity
  │╱          ╲       ╱
  │            ╲     ╱  Slope of Enlightenment
  │             ╲   ╱
  │              ╰─╯  Trough of Disillusionment
  │
  └─Innovation Trigger──────────────────────→ 时间
```

**判断指标**：预计到达生产力平台期的时间（<2年 / 2-5年 / 5-10年 / >10年）

**投资时机**：
- 触发期 → 只关注不投入
- 膨胀期 → 高风险高回报，适合先行者
- 幻灭期 → **最佳入场时机**（价值被低估）
- 复苏期 → 稳健投入
- 成熟期 → 必须跟进

### CHAOSS 开源健康度指标

来源：https://chaoss.community/（Linux 基金会项目）

---

## 指令

对用户指定的技术主题进行系统化调研，覆盖以下全部维度，输出结构化报告。

### 第一步：确认调研范围

1. **调研什么？** 具体技术/框架/工具名称
2. **决策场景？** 选型/学习/投资/替换现有方案
3. **约束条件？** 团队规模、技术栈、预算、时间线
4. **对比标的？** 有没有已知的备选方案
5. **深度要求？** 快速概览(10min) / 标准对比 / 深度评估

### 第二步：数据采集

对每个备选方案采集以下维度数据：

#### A. 项目健康度（GitHub 指标）

| 指标 | 健康标准 | 危险信号 |
|------|---------|---------|
| Star 增长趋势 | 持续增长 | 停滞或下降 |
| Commit 频率 | 周均 >5 | 超过1月无提交 |
| Contributors | >20人 | <5人（bus factor 风险） |
| Bus Factor | >3人贡献50%+代码 | 1-2人集中 |
| Issue 响应时间 | <48h 首次回应 | >1周无回应 |
| Issue 关闭率 | >70% | <50% |
| Release 频率 | 每月至少1次 | >6月无发布 |
| PR 合并速度 | <1周 | 大量 stale PR |
| 依赖健康度 | 无废弃依赖 | 有已知漏洞 |
| License | MIT/Apache 2.0 | GPL（商业限制）/ 无License |

**数据工具**：
- OSS Insight：https://ossinsight.io/
- Star History：https://star-history.com/
- Snyk Advisor：https://snyk.io/advisor/
- Libraries.io：https://libraries.io/

#### B. 技术成熟度

| 维度 | 评估方法 |
|------|---------|
| 文档质量 | 有无快速开始、API文档、示例、中文文档 |
| 生态系统 | 插件数量、社区扩展、集成方案 |
| 企业采用 | 有哪些公司在生产使用 |
| 版本稳定性 | 是否已 1.0+？Breaking changes 频率？ |
| 性能基准 | 有无官方/第三方 benchmark |
| 迁移成本 | 从现有方案迁移的难度 |

#### C. 社区与生态

| 来源 | URL | 用途 |
|------|-----|------|
| GitHub Discussions | 项目仓库 | 社区活跃度 |
| Stack Overflow | https://stackoverflow.com/ | 问题覆盖率 |
| Reddit | r/programming 等 | 开发者真实评价 |
| Hacker News | https://news.ycombinator.com/ | 技术深度讨论 |
| V2EX | https://www.v2ex.com/ | 中文开发者反馈 |
| Discord/Slack | 项目官方频道 | 社区响应速度 |

#### D. 中国开发者特殊考量

| 维度 | 说明 |
|------|------|
| 中文文档 | 有无官方/社区中文文档 |
| 国内镜像 | npm/pip 镜像可用性 |
| 墙内可达性 | API/CDN 是否在中国可访问 |
| 国内社区 | 掘金/知乎上的讨论量 |
| 国内企业采用 | 阿里/字节/腾讯是否在用 |

### 第三步：对比分析

使用 **加权评分矩阵**：

```markdown
| 维度 (权重) | 方案A | 方案B | 方案C |
|------------|-------|-------|-------|
| 功能完整度 (25%) | 8/10 | 7/10 | 9/10 |
| 性能 (20%) | 9/10 | 8/10 | 7/10 |
| 学习曲线 (15%) | 6/10 | 9/10 | 7/10 |
| 生态/社区 (15%) | 9/10 | 7/10 | 6/10 |
| 维护状态 (15%) | 8/10 | 9/10 | 7/10 |
| 中国适用性 (10%) | 7/10 | 8/10 | 9/10 |
| **加权总分** | **X** | **Y** | **Z** |
```

权重可根据用户场景调整。

### 第四步：输出报告

```markdown
# [主题] 技术调研报告

> 日期：YYYY-MM-DD | 信息时效：截至本月
> 调研人：AI Agent | 决策场景：[用户场景]

## 一句话结论
[直接给推荐 + 核心理由]

## 执行摘要（30秒能看完）
- 推荐方案：[X]
- 核心优势：[1-2句]
- 主要风险：[1句]
- 成熟度判断：[Adopt/Trial/Assess/Hold]

## 候选方案概览
[对比表格]

## 深度分析
### 方案A
- 技术架构：
- 核心优势：
- 关键劣势：
- 适用场景：
- 企业案例：
- 成熟度阶段：[Hype Cycle 位置]

### 方案B
...

## 加权评分对比
[评分矩阵]

## 风险评估
| 风险 | 概率 | 影响 | 缓解策略 |
|------|------|------|---------|
| [风险1] | 高/中/低 | | [怎么应对] |

## 迁移路径
如果选择 [推荐方案]：
1. [第一步]
2. [第二步]
...

## 我的判断
[明确立场 + 完整推理链]

## 参考资料
- [来源](url) — [说明]
```

---

## 规则

- **必须给明确推荐** — 不说"各有优劣看你需求"
- **有数据说数据** — "GitHub Stars 12.3K，周均 commits 23"
- **标注信息时效** — 技术迭代快，注明截至何时
- **区分事实和观点** — 数据是事实，判断是观点，分开标注
- **考虑中国因素** — 墙、镜像、中文社区是现实约束
- **给出"如果我是你"的建议** — 人格化判断
- **调研完主动问** — "需要我深入看哪个方案？还是直接出迁移方案？"

---

## 数据源清单

| 类型 | 来源 | URL |
|------|------|-----|
| 开源健康 | CHAOSS Metrics | https://chaoss.community/ |
| Star 趋势 | Star History | https://star-history.com/ |
| 包评分 | Snyk Advisor | https://snyk.io/advisor/ |
| 依赖分析 | Libraries.io | https://libraries.io/ |
| GitHub 分析 | OSS Insight | https://ossinsight.io/ |
| 技术趋势 | ThoughtWorks Radar | https://www.thoughtworks.com/radar |
| 技术成熟度 | Gartner Hype Cycle | https://www.gartner.com/ |
| 开发者调查 | Stack Overflow Survey | https://survey.stackoverflow.co/ |
| Benchmark | TechEmpower | https://www.techempower.com/benchmarks/ |
| npm 生态 | npm trends | https://npmtrends.com/ |
| Python 生态 | PyPI Stats | https://pypistats.org/ |
