# 🤖 Agent Skills CN

**中文 AI 助手技能集合** — 让你的 AI 助手更聪明、更实用、更懂中文场景。

适用于 [OpenClaw](https://github.com/openclaw/openclaw)、Claude Code、Cursor、Gemini CLI 等 AI 助手/编程工具。

---

## ✨ 这是什么？

Agent Skills 是一组规则文件（Markdown），告诉 AI 助手**在特定场景下应该怎么做**。

装上 Skills 后，你的 AI 助手会：
- 🎯 更精准地理解你的需求
- 📋 按流程做事，不再乱来
- 🇨🇳 完全适配中文工作场景
- ⚡ 提高实际产出质量

---

## 📦 Skills 列表

### 🔧 工作流

| Skill | 说明 |
|-------|------|
| [需求对齐](/skills/workflow/grill-me-cn/) | 动手前先问清楚，避免做错方向 |
| [任务拆解](/skills/workflow/task-breakdown/) | 把大任务拆成可执行的小步骤 |
| [每日总结](/skills/workflow/daily-summary/) | 自动生成当日工作/学习摘要 |

### 📝 内容创作

| Skill | 说明 |
|-------|------|
| [公众号写作](/skills/content/wechat-article/) | 按公众号风格生成文章 |
| [小红书文案](/skills/content/xiaohongshu/) | 适配小红书的种草/分享风格 |
| [技术博客](/skills/content/tech-blog/) | 结构清晰的技术文章 |

### 🔍 研究分析

| Skill | 说明 |
|-------|------|
| [技术调研](/skills/research/tech-research/) | 系统化调研某个技术方向 |
| [竞品分析](/skills/research/competitor-analysis/) | 结构化竞品对比报告 |

### 📊 加密货币

| Skill | 说明 |
|-------|------|
| [每日简报](/skills/crypto/daily-briefing/) | 每天定时生成全面加密货币市场分析报告，覆盖行情/链上/情绪/新闻/宏观，推送邮箱 |

### 🛠️ 实用工具

| Skill | 说明 |
|-------|------|
| [Git 规范](/skills/tools/git-commit-cn/) | 中文 commit message 规范 |
| [会议纪要](/skills/tools/meeting-notes/) | 从对话中提取结构化纪要 |

---

## 🚀 安装方式

### OpenClaw

将 skills 目录复制到你的 OpenClaw workspace：

```bash
git clone https://github.com/wolfwangcn/agent-skills-cn.git
cp -r agent-skills-cn/skills/ ~/.openclaw/workspace/skills/
```

### Claude Code / Cursor

```bash
# 复制需要的 SKILL.md 到你的项目
cp agent-skills-cn/skills/workflow/grill-me-cn/SKILL.md .claude/skills/grill-me-cn.md
```

### 通用方式

所有 Skills 都是标准 Markdown，可以直接粘贴到任何 AI 工具的 system prompt 或 rules 文件中。

---

## 🤝 贡献

欢迎提 PR 或 Issue！无论是：
- 新增 Skill
- 改进现有 Skill
- 报告问题
- 建议新方向

---

## 📄 License

MIT

---

> 💡 **持续更新中** — Star ⭐ 关注后续新 Skill！
