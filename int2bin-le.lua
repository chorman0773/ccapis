---
--@module int2bin-le Little Endian int2bin for people that need/want LE. int2bin is BE.
--
--Provides conversions from integral values to strings of raw bytes.
local int2bin = {};

function int2bin.hword(h)
  return string.char(bit32.band(h,255))..string.char(bit32.rshift(h,8));
end

function int2bin.tohword(s)
  local a,b = s:byte(1,2);
  return a+b*256;
end

function int2bin.word(i)
  local ret = "";
  for _ in 1,4 do
    ret = ret..string.char(i%256);
    i = bit32.arshift(i,8);
  end
  return ret;
end

function int2bin.toword(s)
  local a,b,c,d = s:byte(1,4);
  return a+b*256+c*65536+d*16777216;
end

function int2bin.dword(l)
  local ret = "";
  local low = l%(4294967296);
  local hi = (l-low)/4294967296;
  return int2bin.word(low)..int2bin.word(hi);
end

return int2bin;