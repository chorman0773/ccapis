---
--Pure Lua Implementation of RFC 1071.
local rfc1071 = {};

local int2bin = require"apis.int2bin";

local function add(a,b)
  local result = a+b;
  local rem = result%65536;
  local carry = (result-rem)/65536;
  if carry==0 then
    return rem
  else
    return add(rem,carry);
  end
end

function rfc1071.checksum(message)
  local sum = 0;
  local messageLen = (#message)/2;
  for a=0,messageLen do
    local val = int2bin.tohword(message:sub(2*messageLen+1,2*(messageLen+1)));
    sum = add(sum,val);
  end
  return int2bin.hword(bit32.bxor(0xFFFF,sum));
end


return rfc1071;