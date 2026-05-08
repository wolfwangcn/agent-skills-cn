---
name: git-commit-cn
description: "Git 提交规范：规范化中文 commit message。执行 git commit 时自动应用，或用户提到'提交规范'、'commit 格式'时激活。"
---

# Git 提交规范 (Git Commit CN)

规范化中文 Git commit message，保持项目历史清晰。

## 指令

所有 git commit message 遵循以下格式。自动应用，无需用户每次指定。

## 格式

```
<类型>(<范围>): <简述>

[可选正文：解释为什么这么做]

[可选脚注：关联 issue 等]
```

## 类型速查

| 类型 | 用途 | 示例 |
|------|------|------|
| `feat` | 新功能 | feat(用户): 添加手机号登录 |
| `fix` | 修复 | fix(支付): 修复重复扣款问题 |
| `docs` | 文档 | docs: 更新部署说明 |
| `style` | 格式 | style: 统一缩进 |
| `refactor` | 重构 | refactor(订单): 拆分服务 |
| `perf` | 性能 | perf: 优化列表查询 |
| `test` | 测试 | test: 补充登录测试 |
| `chore` | 杂项 | chore: 升级依赖 |
| `ci` | CI/CD | ci: 添加自动部署 |

## 规则

- 简述不超过 50 字
- 类型前缀用英文，简述用中文
- 简述动词开头（"添加"、"修复"、"优化"、"移除"）
- 不加句号
- 一个 commit 只做一件事
- 正文解释"为什么"而不是"做了什么"（做了什么 diff 能看到）
- Breaking change 在脚注标注：`BREAKING CHANGE: xxx`

## 好例子

```
feat(文章): 添加 Markdown 导出功能

支持导出为 .md 文件，包含图片本地化。
用户反馈 Word 格式不方便在 GitHub 查看。

closes #42
```

```
fix(登录): 修复验证码倒计时重置问题

原因：组件卸载时未清除定时器，重新挂载后倒计时从头开始。
```

## 坏例子

```
❌ update（太模糊）
❌ 修复了一些bug（哪些？）
❌ feat: Add user login function（中英混杂）
❌ 一个commit改了3个不相关的文件（应该拆开）
```
