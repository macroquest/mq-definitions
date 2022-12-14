--- @class time
--- @field public Date MQString # Date in the format MM/DD/YYYY
--- @field public Day MQInt # Day of the month
--- @field public DayOfWeek MQInt # Day of the week (1=sunday to 7=saturday)
--- @field public Hour MQInt # Hour (0-23)
--- @field public Minute MQInt # Minute (0-59)
--- @field public Month MQInt # Month of the year (1-12)
--- @field public Night MQBoolean # Gives true if the current hour is considered "night" in EQ (7:00pm-6:59am)
--- @field public Second MQInt # Second (0-59)
--- @field public SecondsSinceMidnight MQFloat # Number of seconds since midnight
--- @field public Time12 MQString # Time in 12-hour format (HH:MM:SS)
--- @field public Time24 MQString # Time in 24-hour format (HH:MM:SS)
--- @field public Year MQInt # Year
--- @field public ToString MQString # Same as Time24