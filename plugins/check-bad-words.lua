 ---------- Created by @AbuAliAF---------
	--Delete words contains --حذف پیامهای فحش
local function run(msg)
	if not is_mod(msg) then
local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)]["settings"]["lock_bw"] == "yes" then
			tdcli.deleteMessages(msg.to.id, {[0] = msg.id_}, dl_cb, nil)	
		end
	end
 end
return {
  patterns = {
    "(ک*س)$",
    "کیر",
	"کص",
	"کــــــــــیر",
	"کــــــــــــــــــــــــــــــیر",
	"کـیـــــــــــــــــــــــــــــــــــــــــــــــــــر",
    "ک×یر",
	"ک÷یر",
	"ک*ص",
	"کــــــــــیرر",
    "kir",
	"kos",
	"گوساله",
	"gosale",
	"gusale",
	"جاکش",
	"قرمساق",
	"دیوس",
	"دیوص",
	"dayus",
	"dayos",
	"dayu3",
	"10yus",
	"10yu3",
	"daus",
	"dau3",
	"تخمی",
	"حرومزاده",
	"حروم زاده",
	"harumzade",
	"haromzade",
	"haroomzade",
	"lashi",
	"لاشی",
	"لاشي",
	"جنده",
"^(کونی)$",
"^(کوني)$",
"^(كوني)$",
"جنده",
"جنده",
"جنده",
"جنده",
"جنده",
"جنده",
"جنده",
	"jende",
	"خایه مال",
	"خایمال",
	"jende",
	"jende",
	"jende",
	"tokhmi",
	"madarjende",
	"kharkosde",
	"خارکسده",
	"خوارکسده",
	"خارکصده",
	"خوارکصده",
	"kharko3de",
	"مادرجنده",
  },
  run = run
}
--Channel @ChRFD--
