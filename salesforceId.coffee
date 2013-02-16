parityLookup = "ABCDEFGHIJKLMNOPQRSTUVWXYZ012345"


checksum = (id, parity) ->
  idSeg = id.match /.{5}/g
  revSeg = []
  crc = []
  
  for val, i in idSeg
    revSeg.push val.split("").reverse().join("")

  for val, i in revSeg
    t = val.replace /[a-z0-9]/g, 0
    t = t.replace /[A-Z]/g, 1
    index = parseInt(t, 2); #convert 00100 to 4 
    crc.push parityLookup[index]
  
  crc = crc.join ""
  #console.log "CRC: #{crc} Parity: #{parity}"
  if parity 
    if crc == parity
      console.log "#{parity} is valid checksum"
    else
      console.log "#{parity} is not a valid checksum"
  else
    console.log "checksum for #{id} is #{crc}"


validate = (id) ->
  if not (id.length == 15 or id.length == 18)
    console.log "Invalid Id."
  else
    #console.log "Valid Id"
    if id.length == 18
      checksum id.substring(0,15), id.substring(15)
    else
      checksum id
  return


testId = "a04d0000003etpV"
validate testId