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

## 다국어 (한/영 동시 발행)

이 사이트는 모든 포스트를 한국어 원본 + 영어 번역본, 두 버전으로 발행한다. 네비바
"About me" 오른쪽의 KOR/ENG 스위처(`lang-switcher.html`)가 현재 페이지의 언어 짝을
자동으로 찾아 연결하고, 번역이 없는 페이지에서는 자동으로 비활성화된다. 인라인
"Read in English"/"한국어로 보기" 링크는 안 씀 — 네비바 스위처가 그 역할을 함.

**파일 위치: 영문판은 전부 `posts/en/` 아래에, 한글판과 같은 하위 구조로 미러링한다**
(파일명에 `.en`은 안 붙임 — `posts/en/` 자체가 언어 구분자):

```
posts/living-in-us/<slug>.md    # 한국어 원본
posts/en/living-in-us/<slug>.md # 영어 번역본

posts/diary/2026-08-weekN.md    # 한국어 원본
posts/en/diary/2026-08-weekN.md # 영어 번역본

posts/research/<slug>.md        # 한국어 원본
posts/en/research/<slug>.md     # 영어 번역본

posts/phd-in-us/<slug>.md       # 한국어 원본
posts/en/phd-in-us/<slug>.md    # 영어 번역본
```

`posts/<섹션>/`은 언제나 한글판만 보이고, 영문판은 전부 `posts/en/<섹션>/`에 모여있다.
`lang-switcher.html`은 URL의 `/posts/` 뒤에 `en/`가 붙어있는지만 보고 짝을 계산하므로,
새 섹션이 생겨도 이 규칙만 지키면 스위처 코드를 안 고쳐도 된다.

**이미지 경로 주의**: 영문판은 원본보다 디렉토리가 한 단계 더 깊다
(`posts/<섹션>/` → `posts/en/<섹션>/`). 그래서 상대 이미지 경로는 원본의
`../images/...`가 아니라 `../../images/...`로 한 단계 더 올려야 한다
(frontmatter의 `image:` 필드도 동일). diary만 예외 — 원래도 이미 2단계 깊이였어서
`../../images/...` 그대로 유지.

**공통 규칙:**
- 영문판 frontmatter 맨 위에 `lang: en` 추가 (리스팅 페이지들이 이 필드로
  영문판을 걸러내서 한글판만 목록에 뜨게 함 — `index.qmd`/`living-in-us.qmd`/
  `research.qmd`/`phd-in-us.qmd`의 `listing.exclude`와 `add-thumbnails.sh`
  양쪽에 이미 반영되어 있음).
- 마크다운/Quarto 구조(헤딩, `::: {.callout-*}`, `::: {.photo-row}`, 표)는
  두 버전에서 100% 동일하게 유지.
- 본문만 자연스러운 영어로 번역 (직역 금지, 원문의 톤 유지). 숫자/날짜/고유명사는 그대로.
- frontmatter: `title`/`description`만 번역, `date`/`categories`/`image`는 동일하게
  (단 위 이미지 경로 규칙 적용), `draft`는 두 버전 다 같은 값으로 (보통 `false`).
- 글 안에서 다른 포스트로 거는 내부 링크: 같은 섹션 안이면 그냥 `<slug>.html`
  (같은 `posts/en/<섹션>/` 폴더 안이라 `.en` 불필요), 다른 섹션이면
  `../<섹션>/<slug>.html` — 즉 한글판 링크에서 `.en` 안 붙이고 그대로 쓰면 됨.
- 스타일 참고용 예시 쌍: `posts/living-in-us/us-cost-of-living-month1.md` /
  `posts/en/living-in-us/us-cost-of-living-month1.md`

주간 일기 작성 워크플로우는 `posts/diary/_workflow.md`에 더 자세히 정리되어 있음
(사이트에는 발행되지 않는 내부 메모 파일).

## Deployment

- `main` push → GitHub Actions → `gh-pages` 브랜치 자동 빌드 → `rhogam.bio` 서빙
- `_site/`, `.quarto/` 폴더는 `.gitignore`에 포함되어 있음 (커밋하지 않음)
- 도메인: `rhogam.bio` (Namecheap에서 구매, DNS A레코드로 GitHub Pages 연결)
