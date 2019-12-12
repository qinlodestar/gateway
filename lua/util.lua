local _M = {}

    function _M.split(s, delim)
        if type(delim) ~= "string" or string.len(delim) <= 0 then
            return
        end

        local start = 1
        local t = {}
        while true do
        local pos = string.find (s, delim, start, true) -- plain find
          if not pos then
           break
          end

          table.insert (t, string.sub (s, start, pos - 1))
          start = pos + string.len (delim)
        end
        table.insert (t, string.sub (s, start))

        return t
    end

return _M 
