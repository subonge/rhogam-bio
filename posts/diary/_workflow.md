<!--
이 파일은 `_` 로 시작해서 사이트에 발행되지 않음 (Quarto가 렌더에서 제외).
매주 일기 글을 만들 때 Claude에게 보낼 프롬프트와 참고 규칙을 모아둔 메모.
-->

# 주간 일기 작성 워크플로우 (rhogam.bio)

## 매주 Claude에게 붙여넣을 프롬프트

```
rhogam.bio 주간 일기 새 글 작성해줘. (메모리의 "주별 일기 연재" 참고)

- 이번 주차: 2026-08-weekN   ← N만 매주 바꾸기 (달 넘어가면 월도)
- 사진은 posts/images/diary/2026-08-weekN/ 폴더에 다 올려놨어.

워크플로우:
1. 사진 EXIF 촬영시각(mdls) 읽어 댈러스 현지시간(UTC-5)으로 변환, 날짜별로 묶기
2. HEIC/PNG를 작은 JPG로 변환해 내용을 직접 보고, 날마다 좋은 것만 선별
3. 날짜별 초안 작성 (Day 1, Day 2 … / 한글, 따뜻한 일기 톤)
4. 선별본만 dN-slug.jpg (내용 기반 짧은 이름)로 폴더에 변환 저장
5. posts/diary/2026-08-weekN.md 생성 — 프론트매터에 body-classes: diary-post,
   categories: Living in US, 대표사진 image 지정, draft: false
6. 사진 여러 장은 ::: {.photo-row} 갤러리(사이 빈 줄), 한 장이면 그냥 ![](../../images/...)
7. **영어 버전도 같이 생성**: posts/en/diary/2026-08-weekN.md로 번역본 작성
   (파일명에 .en 안 붙임 — posts/en/ 자체가 언어 구분자. living-in-us/research/
   phd-in-us 등 다른 섹션도 전부 같은 방식으로 posts/en/<섹션>/ 아래에 미러링됨).
   - posts/diary/ 폴더 자체엔 한글판만 보이게 하려는 의도
   - 구조(헤딩/photo-row/callout fence)는 100% 동일하게, 본문만 자연스러운
     영어로 번역 (직역 X, 원문의 톤/감정 유지)
   - 이미지 상대경로 주의: posts/en/diary/는 posts/diary/보다 한 단계 더 깊으므로
     ../images/...가 아니라 ../../images/...로 한 단계 더 올려야 함
     (frontmatter의 image: 필드도 동일)
   - posts/en/diary/ 폴더 안에서 다른 주차로 거는 링크는 .en 없이 그냥 weekN.html
   - 프론트매터: 맨 위에 lang: en 추가 (리스팅 페이지가 이걸로 영문판을 걸러내서
     한글판만 목록에 뜨게 함), title/description만 번역, date/categories/image/
     body-classes는 한글판과 동일 값 유지, draft는 한글판과 동일하게 맞추기
   - 인라인 "Read in English"/"한국어로 보기" 링크는 넣지 않음 — 네비바 KOR/ENG
     스위처(lang-switcher.html)가 이미 그 역할을 자동으로 함
   - 스타일 참고용 예시 쌍: posts/diary/2026-08-week3.md / posts/en/diary/2026-08-week3.md
8. quarto preview 로 localhost 확인까지 (한글/영문 페이지 둘 다)

- 사진 보고 추측한 부분은 맨 끝에 "확인 요청"으로 정리해줘.
- 발행(push)은 내가 "발행해줘" 하면 그때.
```

### 짧은 버전 (메모리 살아있을 때)

```
rhogam.bio 주간 일기 새 글. 사진은 posts/images/diary/2026-08-weekN/ 에 올렸어.
메모리 "주별 일기 연재" 워크플로우대로 초안까지 작성해줘.
```

---

## 직접 쓸 때 참고 (사진 문법)

프론트매터 맨 위 (글마다):
```
body-classes: diary-post
```

사진 한 장 (클릭하면 확대):
```
![](../images/diary/2026-08-weekN/사진.jpg)
```

여러 장 가로 스크롤 갤러리 (사진 사이 **빈 줄** 필수):
```
::: {.photo-row}
![](../images/diary/2026-08-weekN/사진1.jpg)

![](../images/diary/2026-08-weekN/사진2.jpg)
:::
```

- 경로는 Obsidian에 사진을 **드래그**하면 자동 입력됨
- `group=` / `.diary-photo` 안 붙여도 됨 (photo-row-group.lua 필터 + body-classes가 자동 처리)
- 새 글은 `posts/diary/templates/Draft.md` 복사해서 시작하면 편함

## 발행

`main` 브랜치에 push → GitHub Actions 자동 배포 → rhogam.bio. push 전 localhost 미리보기 확인.
