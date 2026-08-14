-- .photo-row 블록 안의 이미지에 공유 group 을 자동 부여
-- → 라이트박스에서 클릭 확대 후 좌우로 넘기기(같은 갤러리)가 group 없이도 동작
local counter = 0

function Div(el)
  if el.classes:includes("photo-row") then
    counter = counter + 1
    local gid = "photorow-" .. counter
    return pandoc.walk_block(el, {
      Image = function(img)
        if not img.attributes["group"] then
          img.attributes["group"] = gid
        end
        return img
      end
    })
  end
end
