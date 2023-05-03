Posted: Fri, Jan  5, 1990   7:56 AM GMT              Msg: AGJA-4130-4809
From:   CDUNCAN
Subj:   LEO Satellite Visibility Analysis 

In discussions of the elevation response of antennas for LEO satellite 
operation, one of the arguments that I always stress is that LEO satellites 
spend surprisingly little time at relatively high elevations.  When 
tradeoffs are made, therefore, it seems that high elevation performance 
should not be taken too seriously.  I have reproduced my analysis and 
computer program that quantifies this argument (listing at the end) and 
have done runs on most of the LEO amateur satellites of interest. 

A word about the contrast between turnstile/reflector antennas and 
verticals.  In LEO mode A type operation (OSCARs 6, 7, 8, RS 5-8, 10/11) 
the aims of and rewards to the operator are fundamentally different than 
they are with pacsats in automatic or semi-automatic operation.  In the 
former case, the operator selects a pass of interest and, if he is using 
non-tracking antennas, this is usually a fairly "high" pass (i.e. more than 
30 degrees maximum elevation).  He then listens into the pass until 
downlink and through-link signals are acceptable.  For the few minutes when 
the satellite is high (and therefore close) enough for really good 
response, he makes some contacts and comes away feeling successful.  This 
whole experience might not be as long as ten minutes. 

For manual or automatic use of a pacsat, where contact is with the 
satellite itself only, or where the pass is spent copying data, best 
possible copy at all visible times is a much higher priority.  As will be 
shown below, this means that considerable emphasis must be given to low 
elevation performance.  Of course, there are many of us (WD0E and myself 
included) who have a mountainous horizon mask in several directions.  This 
simply means that our coverage to the satellite is significantly reduced.  
Still, performance at low elevations is important for those places in the 
sky that are not masked off. 

A word about the program itself.  The technique used is to brute-force 
integrate the percentage of the satellite orbit-arc visible from a 
particular latitude.  Calculations are from spherical trigonometry.  
Average coverage is, of course, independent of longitude.  Simplifying 
assumptions are perfectly circular orbits and perfectly spherical earth.  
This makes a few kilometers difference which is only a few seconds of time 
in each result.  Interestingly, the percentage of satellite orbit arc 
visible on the average is a dimensionless value and can therefore be 
directly scaled to any sort of units of time per units of time desired by 
direct multiplication.  For intuitive convenience, I've chosen minutes per 
day (multiply by 1440 minutes per day) of visibility, thinking that this 
would most closely correspond to people's way of thinking about how much 
time a satellite is up. 

Since it is a brute-force integration, a decision had to be made about 
summing step size.  Using 0.2 degrees in differential longitude as the 
"umpire," I tried 1.0, 2.0 and 10.0 degrees for identical data and found 
that at 1.0 and 2.0 the results differed by less than 0.1 minute per day in 
all cases.  The 10.0 case was, of course, much worse.  I did all of the 
tables below at 1.0 just to be safe (especially for the lower orbit cases 
where integration granularity is more significant). 

Finally, a note on how to read the table.  For a given satellite height and 
inclination, the data shows how many minutes per day the satellite spends 
above the indicated elevation at the indicated latitude.  I selected the 
elevations (which are easily varied in the program) as follows: 

 0 degrees, entire passes from horizon to horizon
 5 degrees, typical NASA horizon mask for similar work
10 degrees, typical perceived LEO hamsat minimum for "average" user
30 degrees, perceived good elevation
70 degrees, horizontal dipole goes substandard for pacsat work

The latitudes are roughly representative, they can also be changed easily, 
the problem is north-south symmetrical so the mathematical sign on latitude 
doesn't matter. 

 0 degrees, equator (0.1 to avoid numerical problems)
20 degrees, tropics
34 degrees, Los Angeles (and other places), moderate
42 degrees, vicinity of New York, Boston, etc., moderate
64 degrees, Fairbanks, Alaska, arctic
90 degrees, poles (89.9 to avoid numerical problems)

As an example, say you lived at 34 degrees north or south latitude and 
wanted to know how much UO-11 time per day you would have.  The table value 
of 56.1 minutes "seems" about right, typically there are 4 or 5 passes per 
day of an average 10 or 12 minutes apiece at this latitude.  (I also did 
similar checks with InstanTrack and got similar results.)  If you only 
listen at more than 30 degrees elevation, this only happens an average of 
6.2 minutes per day, ordinarily the peak parts of two or three different 
passes.  Note that NOBODY ANYWHERE sees UO-11 essentially straight up (more 
than 70 degrees) as much as one minute per day!  This turns out to be a 
pretty unimportant part of the sky for LEO work, even for mode A voice 
contacts. 

Now, let's see the data, first, two familiar LEO hamsats, UO-11 and 
RS-10/11: 

UO-11
leovis:  input LEO mean height above earth (Km):  679.0
leovis:  input LEO inclination:  98.0
leovis:  input granularity of scan (degrees of latitude):  1.0

AVERAGE TIME SATELLITE SPENDS ABOVE ELEVATION MINUTES PER DAY
Satellite mean height  679.0 Km
Maximum slant range (at horizon) 3020.4 Km

 elevations          0.0         5.0        10.0        30.0        70.0
latitudes
    0.1000          45.7        30.7        20.7         5.1         0.3
   20.0000          48.9        32.8        22.1         5.4         0.3
   34.0000          56.1        37.6        25.3         6.2         0.4
   42.0000          63.7        42.3        28.5         6.9         0.4
   64.0000         124.7        87.7        55.4        12.4         0.7
   89.9000         193.0       154.1       121.5        22.8         0.0


RS-10/11
leovis:  input LEO mean height above earth (Km):  992.4
leovis:  input LEO inclination:  82.9
leovis:  input granularity of scan (degrees of latitude):  1.0

AVERAGE TIME SATELLITE SPENDS ABOVE ELEVATION MINUTES PER DAY
Satellite mean height  992.4 Km
Maximum slant range (at horizon) 3693.8 Km

 elevations          0.0         5.0        10.0        30.0        70.0
latitudes
    0.1000          64.4        46.0        32.9         9.2         0.6
   20.0000          69.0        49.1        35.1         9.9         0.6
   34.0000          79.7        56.4        40.2        11.3         0.7
   42.0000          90.9        64.0        45.4        12.6         0.7
   64.0000         169.7       126.4        93.3        22.6         1.3
   89.9000         234.4       196.0       163.2        72.1         0.0


Both cases have nearly the same distribution, the difference is mostly from 
the fact that RS-10/11 is higher.  As expected, the arctic regions have 
most of the coverage.  Note that at the poles, all passes are virtually 
identical (in elevation).  Note also that at most locations, satellites 
spend only 10 or 15 percent of the time above even 30 degrees. 

Next, consider the considerable moderating influence of the lower 
inclination of FO-12.  Unfortunately, the inclination is not also sun 
synchronous, so the distribution of the available times throughout the day 
varies from week to week.  FO-1B will be in a polar orbit. 

FO-12
leovis:  input LEO mean height above earth (Km):  1488.0
leovis:  input LEO inclination:  50.0
leovis:  input granularity of scan (degrees of latitude):  1.0

AVERAGE TIME SATELLITE SPENDS ABOVE ELEVATION MINUTES PER DAY
Satellite mean height 1488.0 Km
Maximum slant range (at horizon) 4603.9 Km

 elevations          0.0         5.0        10.0        30.0        70.0
latitudes
    0.1000         124.6        92.3        68.6        21.8         1.4
   20.0000         154.6       116.6        81.1        24.6         1.6
   34.0000         156.0       126.5       102.3        35.8         2.0
   42.0000         149.8       121.5        98.6        43.8         2.9
   64.0000         111.4        81.3        57.7         4.9         0.0
   89.9000           0.0         0.0         0.0         0.0         0.0

The message gained from looking at the manned spacecraft plots is that if 
you are going to work them for more than a single contest exchange, you 
MUST be able to work all the way to the horizon if at all possible.  Time 
is short enough as it is! 


MIR
leovis:  input LEO mean height above earth (Km):  375.6
leovis:  input LEO inclination:  51.6
leovis:  input granularity of scan (degrees of latitude):  1.0

AVERAGE TIME SATELLITE SPENDS ABOVE ELEVATION MINUTES PER DAY
Satellite mean height  375.6 Km
Maximum slant range (at horizon) 2220.9 Km

 elevations          0.0         5.0        10.0        30.0        70.0
latitudes
    0.1000          33.3        19.7        12.0         2.3         0.1
   20.0000          37.6        22.0        13.4         2.6         0.1
   34.0000          56.8        30.2        17.7         3.4         0.2
   42.0000          60.9        41.5        27.8         4.6         0.2
   64.0000          25.4         8.1         0.0         0.0         0.0
   89.9000           0.0         0.0         0.0         0.0         0.0


STS - inclination 28
leovis:  input LEO mean height above earth (Km):  314.2
leovis:  input LEO inclination:  28.0
leovis:  input granularity of scan (degrees of latitude):  1.0

AVERAGE TIME SATELLITE SPENDS ABOVE ELEVATION MINUTES PER DAY
Satellite mean height  314.2 Km
Maximum slant range (at horizon) 2026.5 Km

 elevations          0.0         5.0        10.0        30.0        70.0
latitudes
    0.1000          47.2        26.2        15.2         2.8         0.1
   20.0000          61.8        40.5        25.9         4.0         0.2
   34.0000          38.9        22.4        12.4         0.0         0.0
   42.0000          16.1         0.6         0.0         0.0         0.0
   64.0000           0.0         0.0         0.0         0.0         0.0
   89.9000           0.0         0.0         0.0         0.0         0.0


STS - inclination 57
leovis:  input LEO mean height above earth (Km):  314.2
leovis:  input LEO inclination:  57.0
leovis:  input granularity of scan (degrees of latitude):  1.0

AVERAGE TIME SATELLITE SPENDS ABOVE ELEVATION MINUTES PER DAY
Satellite mean height  314.2 Km
Maximum slant range (at horizon) 2026.5 Km

 elevations          0.0         5.0        10.0        30.0        70.0
latitudes
    0.1000          26.1        14.8         8.7         1.6         0.1
   20.0000          28.8        16.3         9.5         1.7         0.1
   34.0000          36.8        20.3        11.8         2.2         0.1
   42.0000          51.9        26.8        14.9         2.6         0.1
   64.0000          35.2        18.5         8.4         0.0         0.0
   89.9000           0.0         0.0         0.0         0.0         0.0


The higher (and much rarer) STS inclination mainly helps the higher 
latitudes, at some expense to the lower.  Thirty to forty minutes per day 
is not much time, especially when it is divided among 6 to 8 passes, some 
of which virtually graze the horizon. 

And, finally, there is the OSCAR 14-19 orbit:

OSCAR 14-19
leovis:  input LEO mean height above earth (Km):  825.8
leovis:  input LEO inclination:  98.7
leovis:  input granularity of scan (degrees of latitude):  1.0

AVERAGE TIME SATELLITE SPENDS ABOVE ELEVATION MINUTES PER DAY
Satellite mean height  825.8 Km
Maximum slant range (at horizon) 3349.0 Km

 elevations          0.0         5.0        10.0        30.0        70.0
latitudes
    0.1000          54.8        37.9        26.5         7.0         0.4
   20.0000          58.7        40.6        28.2         7.4         0.4
   34.0000          67.7        46.7        32.3         8.5         0.5
   42.0000          77.1        52.8        36.6         9.5         0.5
   64.0000         144.0       106.1        76.6        17.3         0.9
   89.9000         211.2       172.0       138.5        38.5         0.0

This is essentially the same as UO-11.  It is easy to see why many did not 
invest in elevation rotators until the Phase III era.  High orbit access 
distribution is, of course, much more evenly spread through all parts of 
the sky, elevation control is essential for AO-10 or 13. 

Clearly, mail forwarding, telemetry collecting, and other long term, day to 
day sorts of applications can only succeed with stations that consistently 
work the pacsats near the horizon. 

73, Courtney, N5BF

