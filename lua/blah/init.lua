-- carpalx lang map. this makes carpalx act like qwerty in insert mode 
-- vim.o.langmap=[[wg,em,rl,tw,yy,uf,iu,ob,p\;,ad,ss,dt,fn,gr,hi,ja,ke,lo,\;h,bj,nk,mp,gw,me,lr,wt,yy,fu,ui,bo,\;p,da,ss,td,nf,rg,ih,aj,ek,ol,h\;,jb,kn,pm,WG,EM,RL,TW,YY,UF,IU,OB,P\;,AD,SS,DT,FN,GR,HI,JA,KE,LO,\;H,BJ,NK,MP,GW,ME,LR,WT,YY,FU,UI,BO,\;P,DA,SS,TD,NF,RG,IH,AJ,EK,OL,H\;,JB,KN,PM]]

-- carplax lang map. this makes carplax act like dvorak in insert mode

-- vim.o.langmap=[[
-- '\,.pyfgcrl/=aoeuidhtns-\\\;qjkxbmwvzqgmlwyfub\;[]dstnriaeoh'\\zxcvjkp\,./;qgmlwyfub\;[]dstnriaeoh'\\zxcvjkp\,./'\,.pyfgcrl/=aoeuidhtns-\\\;qjkxbmwvz]]

require'blah.file_specific'
require'blah.sets'
require'blah.unmaps'
require'blah.remaps'

require'blah.init_lazy'

local M = {}
M.highligth = require'blah.highlight'

return M
