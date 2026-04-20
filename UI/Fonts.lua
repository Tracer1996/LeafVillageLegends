LeafVE_Fonts = LeafVE_Fonts or {}

local THEME = LeafVE_Theme or {}
local TC = THEME.TEXT or {}
local AC = THEME.ACCENT or {}

local function ResolveFontColor(c, fb) return c or fb or {r=1, g=1, b=1} end

LeafVE_Fonts.FONTS = {
  h1          = {path="Fonts\\FRIZQT__.TTF", size=18, color=ResolveFontColor(TC.primary)},
  h2          = {path="Fonts\\FRIZQT__.TTF", size=14, color=ResolveFontColor(TC.primary)},
  h3          = {path="Fonts\\FRIZQT__.TTF", size=12, color=ResolveFontColor(TC.secondary)},
  section     = {path="Fonts\\ARIALN.TTF",   size=10, color=ResolveFontColor(TC.muted), uppercase=true},
  body_normal = {path="Fonts\\ARIALN.TTF",   size=11, color=ResolveFontColor(TC.primary)},
  body_small  = {path="Fonts\\ARIALN.TTF",   size=10, color=ResolveFontColor(TC.secondary)},
  body_dim    = {path="Fonts\\ARIALN.TTF",   size=10, color=ResolveFontColor(TC.muted)},
  button      = {path="Fonts\\ARIALN.TTF",   size=11, color=ResolveFontColor(TC.primary), uppercase=true},
  label       = {path="Fonts\\ARIALN.TTF",   size=11, color=ResolveFontColor(TC.secondary)},
  label_dim   = {path="Fonts\\ARIALN.TTF",   size=10, color=ResolveFontColor(TC.muted)},
  input       = {path="Fonts\\ARIALN.TTF",   size=11, color=ResolveFontColor(TC.primary)},
  tooltip_h   = {path="Fonts\\FRIZQT__.TTF", size=12, color=ResolveFontColor(TC.primary)},
  badge_label = {path="Fonts\\ARIALN.TTF",   size=10, color=ResolveFontColor(TC.muted)},
  card_name   = {path="Fonts\\FRIZQT__.TTF", size=17, color=ResolveFontColor(TC.primary)},
  card_sub    = {path="Fonts\\ARIALN.TTF",   size=11, color=ResolveFontColor(TC.secondary)},
  card_accent = {path="Fonts\\ARIALN.TTF",   size=11, color=ResolveFontColor(AC.primary)},
  header_large  = {path="Fonts\\FRIZQT__.TTF", size=18, color=ResolveFontColor(TC.primary)},
  header_medium = {path="Fonts\\FRIZQT__.TTF", size=14, color=ResolveFontColor(TC.primary)},
  header_small  = {path="Fonts\\FRIZQT__.TTF", size=12, color=ResolveFontColor(TC.secondary)},
  body_large    = {path="Fonts\\ARIALN.TTF",   size=11, color=ResolveFontColor(TC.primary)},
  mono          = {path="Fonts\\ARIALN.TTF",   size=10, color=ResolveFontColor(TC.primary)},
  class_name    = {path="Fonts\\FRIZQT__.TTF", size=12, color=ResolveFontColor(TC.primary)},
  stat          = {path="Fonts\\ARIALN.TTF",   size=10, color=ResolveFontColor(TC.muted)},
}

function LeafVE_Fonts:Apply(fontString, styleKey, flags)
  if not fontString or not fontString.SetFont then return end
  local style = self.FONTS[styleKey] or self.FONTS.body_normal
  fontString:SetFont(style.path, style.size, flags or "")
  if style.color and fontString.SetTextColor then
    fontString:SetTextColor(style.color.r or 1, style.color.g or 1, style.color.b or 1, 1)
  end
  if style.uppercase and fontString.GetText and fontString.SetText then
    local t = fontString:GetText()
    if t and t ~= "" then fontString:SetText(string.upper(t)) end
  end
end

function LeafVE_Fonts:SetAccent(fs)
  if not fs or not fs.SetTextColor then return end
  local c = (LeafVE_Theme and LeafVE_Theme.TEXT and LeafVE_Theme.TEXT.accent) or {r=0.24, g=0.72, b=0.54}
  fs:SetTextColor(c.r, c.g, c.b, 1)
end

function LeafVE_Fonts:SetGold(fs)
  if not fs or not fs.SetTextColor then return end
  local c = (LeafVE_Theme and LeafVE_Theme.TEXT and LeafVE_Theme.TEXT.secondary) or {r=0.62, g=0.68, b=0.76}
  fs:SetTextColor(c.r, c.g, c.b, 1)
end

function LeafVE_Fonts:SetMuted(fs)
  if not fs or not fs.SetTextColor then return end
  local c = (LeafVE_Theme and LeafVE_Theme.TEXT and LeafVE_Theme.TEXT.muted) or {r=0.42, g=0.46, b=0.54}
  fs:SetTextColor(c.r, c.g, c.b, 1)
end
