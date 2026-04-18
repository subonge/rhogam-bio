# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**RhoGAM Boy** — 박수영(Suyeong Park)의 개인 학술 블로그. Quarto 기반 정적 사이트로, GitHub Actions를 통해 자동 빌드되어 `rhogam.bio`에 배포됨.

## Commands

```bash
# 로컬 미리보기 (라이브 리로드)
quarto preview

# 사이트 빌드 (/_site 폴더에 생성)
quarto render
```

배포는 `main` 브랜치에 push하면 GitHub Actions가 자동으로 처리함. 직접 `quarto publish`를 실행할 필요 없음.

## Architecture

```
_quarto.yml          # 사이트 설정 (타이틀, 네비게이션, 테마)
index.qmd            # 홈 (블로그 포스트 목록 자동 표시)
about.qmd            # CV 및 소개
research.qmd         # 논문, 연구 경험, 기술 스킬
life.qmd             # UTSW 생활 기록
posts/               # 블로그 포스트 폴더 (각 포스트는 하위 폴더로)
styles.css           # 커스텀 스타일
.github/workflows/publish.yml  # GitHub Actions 배포 자동화
```

## Writing Posts

`posts/` 아래에 폴더를 만들고 `index.qmd` 파일을 추가하면 홈 화면에 자동으로 리스팅됨:

```bash
mkdir posts/2026-01-week1
# posts/2026-01-week1/index.qmd 생성 후 작성
```

각 포스트 frontmatter 형식:
```yaml
---
title: "포스트 제목"
date: "2026-01-07"
categories: [weekly, research]
---
```

## Deployment

- `main` push → GitHub Actions → `gh-pages` 브랜치 자동 빌드 → `rhogam.bio` 서빙
- `_site/`, `.quarto/` 폴더는 `.gitignore`에 포함되어 있음 (커밋하지 않음)
- 도메인: `rhogam.bio` (Namecheap에서 구매, DNS A레코드로 GitHub Pages 연결)
