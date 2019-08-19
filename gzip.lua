---
--@module gzip
--
-- A pure lua implementation of GZip (RFC 1952)

local gzip = {};

local CRC32 = require"CRC32";
local int2bin = require"int2bin-le";

local ID = string.char(0x1f,0x8b);
local CM_DEFLATE = string.char(8);

return gzip;