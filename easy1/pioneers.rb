require 'pry'

ALPHABET = ('a'..'z').to_a
ROT = ALPHABET.rotate 13

def sub(c)
  i = ALPHABET.index c.downcase
  return c unless i
  rotated = ROT[i]

  # match case
  rotated = c.ord > 96 ? rotated : rotated.upcase

  i ? rotated : c
end

def decrypt(str)
  str.chars.map { |c| sub c }.join
end

def decrypt(str)
  str.tr 'a-zA-Z', 'n-za-mN-ZA-M'
end

ecnames = "
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
".strip.split "\n"
#p ecnames

#puts
#p sub 'a'
#p sub 'z'

puts ecnames.map { |name| decrypt name }
