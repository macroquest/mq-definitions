--- @class timestamp
--- @field public Hours MQInt # Number of hours in the timestamp (1hr 23min 53 seconds will return 1)
--- @field public Minutes MQInt # Number of Minutes in the timestamp (1hr 23min 53 seconds will return 23)
--- @field public Seconds MQInt # Number of Seconds in the timestamp (1hr 23min 53 seconds will return 53)
--- @field public TimeHMS MQString # Time value formatted in H:M:S
--- @field public Time MQString # Time value formatted in M:S
--- @field public TotalMinutes MQInt # Total number of minutes in the timestamp (1hr 23min 53 seconds will return 83)
--- @field public TotalSeconds MQInt # Total number of minutes in the timestamp (1hr 23min 53 seconds will return 5033)
--- @field public Raw MQFloat # Time value represented in milliseconds
--- @field public Float MQFloat # Timestamp represented in seconds (1hr 23 min 53 seconds will return 5033.00)
--- @field public Ticks MQInt # Time value represented in ticks
--- @field public ToString MQString # Same as Raw