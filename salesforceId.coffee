parityLookup = {
  "00000": "A",
  "00001": "B",
  "00010": "C",
  "00011": "D",
  "00100": "E",
  "00101": "F",
  "00110": "G",
  "00111": "H",
  "01000": "I",
  "01001": "J",
  "01010": "K",
  "01011": "L",
  "01100": "M",
  "01101": "N",
  "01110": "O",
  "01111": "P",
  "10000": "Q",
  "10001": "R",
  "10010": "S",
  "10011": "T",
  "10100": "U",
  "10101": "V",
  "10110": "W",
  "10111": "X",
  "11000": "Y",
  "11001": "Z",
  "11010": "0",
  "11011": "1",
  "11100": "2",
  "11101": "3",
  "11110": "4",
  "11111": "5"
}

checksum = (id, parity) ->
  idSeg = id.match /.{5}/g
  revSeg = []
  crc = []
  
  for val, i in idSeg
    revSeg.push val.split("").reverse().join("")

  for val, i in revSeg
    t = val.replace /[a-z0-9]/g, 0
    t = t.replace /[A-Z]/g, 1
    crc.push parityLookup[t]
  
  crc = crc.join ""
  #console.log "CRC: #{crc} Parity: #{parity}"
  if parity 
    if crc == parity
      alert "#{parity} is valid checksum"
    else
      alert "#{parity} is not a valid checksum"
  else
    alert "checksum for #{id} is #{crc}"


validate = (id) ->
  if not (id.length == 15 or id.length == 18)
    alert "Invalid Id."
  else
    #alert "Valid Id"
    if id.length == 18
      checksum id.substring(0,15), id.substring(15)
    else
      checksum id
  return


testId = "a04d0000003etpV"
validate testId