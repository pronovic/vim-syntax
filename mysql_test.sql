# vim: set ft=mysql:

# Keywords
action add after aggregate all alter as asc auto_increment avg avg_row_length
both by
cascade change character check checksum column columns comment constraint create cross
current_date current_time current_timestamp
data database databases day day_hour day_minute day_second
default delayed delay_key_write delete desc describe distinct distinctrow drop
enclosed escape escaped explain
fields file first flush for foreign from full function
global grant grants group
having heap high_priority hosts hour hour_minute hour_second
identified ignore index infile inner insert insert_id into is isam
join
key keys kill last_insert_id leading left limit lines load local lock logs long 
low_priority
match max_rows middleint min_rows minute minute_second modify month myisam
natural no 
on optimize option optionally order outer outfile
pack_keys partial password primary privileges procedure process processlist
read references reload rename replace restrict returns revoke row rows right
second select show shutdown soname sql_big_result sql_big_selects sql_big_tables sql_log_off
sql_log_update sql_low_priority_updates sql_select_limit sql_small_result sql_warnings starting
status straight_join string
table tables temporary terminated to trailing type
unique unlock unsigned update usage use using
values varbinary variables varying
where with write
year_month
zerofill

# Special
false null true

# Number
1581239180
13.2
2E4
2E+4
2E-4
4.5E12
4.5E-12
4.5E+12
0x25
0x3C
e
E

# Variables
@ken
@test.one
@test3.99431
@test3.a99431
@test3a.a99431 

# Comments
#Comment (should work)
/* Comment (should work) */
/* Comment 
      (should work) */
-- comment (should work) 
--comment (should not work)

# Column types
tinyint smallint mediumint int integer bigint 
float double precision real decimal dec
dec
date datetime time timestamp bit bool 
tinytext mediumtext longtext text
tinyblob mediumblob longblob blob

# Column types with specifiers 
# Only numbers and variables should be highlighted within the parenthesis when valid.
float(1, 1.3, 2E3, 0x12, 'a', @variable, null)
test_float(1, 1.3, 2E3, 0x12, 'a', @variable, null)            # Valid, but 'test_' should not be highlighted
float_test(1, 1.3, 2E3, 0x12, 'a', @variable, null)            # Invalid
double(1, 1.3, 2E3, 0x12, 'a', @variable, null)
double precision(1, 1.3, 2E3, 0x12, 'a', @variable, null)
real(1, 1.3, 2E3, 0x12, 'a', @variable, null)
numeric(1, 1.3, 2E3, 0x12, 'a', @variable, null)
dec(1, 1.3, 2E3, 0x12, 'a', @variable, null)
decimal(1, 1.3, 2E3, 0x12, 'a', @variable, null)
timestamp(1, 1.3, 2E3, 0x12, 'a', @variable, null)
 timestamp(1, 1.3, 2E3, 0x12, 'a', @variable, null)
test timestamp(1, 1.3, 2E3, 0x12, 'a', @variable, null)        # Valid, but 'test' should not be highlighted
year(1, 1.3, 2E3, 0x12, 'a', @variable, null)
 year(1, 1.3, 2E3, 0x12, 'a', @variable, null)
test year(1, 1.3, 2E3, 0x12, 'a', @variable, null)             # Valid, but 'test' should not be highlighted
test_year(1, 1.3, 2E3, 0x12, 'a', @variable, null)             # Invalid
char(1, 1.3, 2E3, 0x12, 'a', @variable, null)
varchar(1, 1.3, 2E3, 0x12, 'a', @variable, null)
enum(1, 1.3, 2E3, 0x12, 'a', @variable, null)
set(1, 1.3, 2E3, 0x12, 'a', @variable, null)
 set(1, 1.3, 2E3, 0x12, 'a', @variable, null)
test set(1, 1.3, 2E3, 0x12, 'a', @variable, null)              # Valid, but 'test' should not be highlighted
test_set(1, 1.3, 2E3, 0x12, 'a', @variable, null)              # Invalid

# Logical, string and numeric operators
# Anything within parenthesis should be highlighted appropriately.
between not and or is in like regexp rlike binary exists
isnull(1, 1.3, 2E3, 0x12, 'a', @variable, null)
coalesce(1, 1.3, 2E3, 0x12, 'a', @variable, null)
interval(1, 1.3, 2E3, 0x12, 'a', @variable, null)

# Flow control operators
# Anything within parenthesis should be highlighted appropriately.
case when then else end
ifnull(1, 1.3, 2E3, 0x12, 'a', @variable, null)
nullif(1, 1.3, 2E3, 0x12, 'a', @variable, null)
if(1, 1.3, 2E3, 0x12, 'a', @variable, null)

# Functions
# Anything within parenthesis should be highlighted appropriately.
abs(1, 1.3, 2E3, 0x12, 'a', @variable, null)
acos(1, 1.3, 2E3, 0x12, 'a', @variable, null)
adddate(1, 1.3, 2E3, 0x12, 'a', @variable, null)
ascii(1, 1.3, 2E3, 0x12, 'a', @variable, null)
asin(1, 1.3, 2E3, 0x12, 'a', @variable, null)
atan(1, 1.3, 2E3, 0x12, 'a', @variable, null)
atan2(1, 1.3, 2E3, 0x12, 'a', @variable, null)
benchmark(1, 1.3, 2E3, 0x12, 'a', @variable, null)
bin(1, 1.3, 2E3, 0x12, 'a', @variable, null)
bit_and(1, 1.3, 2E3, 0x12, 'a', @variable, null)
bit_count(1, 1.3, 2E3, 0x12, 'a', @variable, null)
bit_or(1, 1.3, 2E3, 0x12, 'a', @variable, null)
ceiling(1, 1.3, 2E3, 0x12, 'a', @variable, null)
character_length(1, 1.3, 2E3, 0x12, 'a', @variable, null)
char_length(1, 1.3, 2E3, 0x12, 'a', @variable, null)
concat(1, 1.3, 2E3, 0x12, 'a', @variable, null)
concat_ws(1, 1.3, 2E3, 0x12, 'a', @variable, null)
connection_id(1, 1.3, 2E3, 0x12, 'a', @variable, null)
conv(1, 1.3, 2E3, 0x12, 'a', @variable, null)
cos(1, 1.3, 2E3, 0x12, 'a', @variable, null)
cot(1, 1.3, 2E3, 0x12, 'a', @variable, null)
count(1, 1.3, 2E3, 0x12, 'a', @variable, null)
curdate(1, 1.3, 2E3, 0x12, 'a', @variable, null)
curtime(1, 1.3, 2E3, 0x12, 'a', @variable, null)
date_add(1, 1.3, 2E3, 0x12, 'a', @variable, null)
date_format(1, 1.3, 2E3, 0x12, 'a', @variable, null)
date_sub(1, 1.3, 2E3, 0x12, 'a', @variable, null)
dayname(1, 1.3, 2E3, 0x12, 'a', @variable, null)
dayofmonth(1, 1.3, 2E3, 0x12, 'a', @variable, null)
dayofweek(1, 1.3, 2E3, 0x12, 'a', @variable, null)
dayofyear(1, 1.3, 2E3, 0x12, 'a', @variable, null)
decode(1, 1.3, 2E3, 0x12, 'a', @variable, null)
degrees(1, 1.3, 2E3, 0x12, 'a', @variable, null)
elt(1, 1.3, 2E3, 0x12, 'a', @variable, null)
encode(1, 1.3, 2E3, 0x12, 'a', @variable, null)
encrypt(1, 1.3, 2E3, 0x12, 'a', @variable, null)
exp(1, 1.3, 2E3, 0x12, 'a', @variable, null)
export_set(1, 1.3, 2E3, 0x12, 'a', @variable, null)
extract(1, 1.3, 2E3, 0x12, 'a', @variable, null)
field(1, 1.3, 2E3, 0x12, 'a', @variable, null)
find_in_set(1, 1.3, 2E3, 0x12, 'a', @variable, null)
floor(1, 1.3, 2E3, 0x12, 'a', @variable, null)
format(1, 1.3, 2E3, 0x12, 'a', @variable, null)
from_days(1, 1.3, 2E3, 0x12, 'a', @variable, null)
from_unixtime(1, 1.3, 2E3, 0x12, 'a', @variable, null)
get_lock(1, 1.3, 2E3, 0x12, 'a', @variable, null)
greatest(1, 1.3, 2E3, 0x12, 'a', @variable, null)
group_unique_users(1, 1.3, 2E3, 0x12, 'a', @variable, null)
hex(1, 1.3, 2E3, 0x12, 'a', @variable, null)
inet_aton(1, 1.3, 2E3, 0x12, 'a', @variable, null)
inet_ntoa(1, 1.3, 2E3, 0x12, 'a', @variable, null)
instr(1, 1.3, 2E3, 0x12, 'a', @variable, null)
lcase(1, 1.3, 2E3, 0x12, 'a', @variable, null)
least(1, 1.3, 2E3, 0x12, 'a', @variable, null)
load_file(1, 1.3, 2E3, 0x12, 'a', @variable, null)
locate(1, 1.3, 2E3, 0x12, 'a', @variable, null)
log(1, 1.3, 2E3, 0x12, 'a', @variable, null)
log10(1, 1.3, 2E3, 0x12, 'a', @variable, null)
lower(1, 1.3, 2E3, 0x12, 'a', @variable, null)
lpad(1, 1.3, 2E3, 0x12, 'a', @variable, null)
ltrim(1, 1.3, 2E3, 0x12, 'a', @variable, null)
make_set(1, 1.3, 2E3, 0x12, 'a', @variable, null)
master_pos_wait(1, 1.3, 2E3, 0x12, 'a', @variable, null)
max(1, 1.3, 2E3, 0x12, 'a', @variable, null)
md5(1, 1.3, 2E3, 0x12, 'a', @variable, null)
mid(1, 1.3, 2E3, 0x12, 'a', @variable, null)
min(1, 1.3, 2E3, 0x12, 'a', @variable, null)
mod(1, 1.3, 2E3, 0x12, 'a', @variable, null)
monthname(1, 1.3, 2E3, 0x12, 'a', @variable, null)
now(1, 1.3, 2E3, 0x12, 'a', @variable, null)
oct(1, 1.3, 2E3, 0x12, 'a', @variable, null)
octet_length(1, 1.3, 2E3, 0x12, 'a', @variable, null)
ord(1, 1.3, 2E3, 0x12, 'a', @variable, null)
period_add(1, 1.3, 2E3, 0x12, 'a', @variable, null)
period_diff(1, 1.3, 2E3, 0x12, 'a', @variable, null)
pi(1, 1.3, 2E3, 0x12, 'a', @variable, null)
position(1, 1.3, 2E3, 0x12, 'a', @variable, null)
pow(1, 1.3, 2E3, 0x12, 'a', @variable, null)
power(1, 1.3, 2E3, 0x12, 'a', @variable, null)
quarter(1, 1.3, 2E3, 0x12, 'a', @variable, null)
radians(1, 1.3, 2E3, 0x12, 'a', @variable, null)
rand(1, 1.3, 2E3, 0x12, 'a', @variable, null)
release_lock(1, 1.3, 2E3, 0x12, 'a', @variable, null)
repeat(1, 1.3, 2E3, 0x12, 'a', @variable, null)
reverse(1, 1.3, 2E3, 0x12, 'a', @variable, null)
round(1, 1.3, 2E3, 0x12, 'a', @variable, null)
rpad(1, 1.3, 2E3, 0x12, 'a', @variable, null)
rtrim(1, 1.3, 2E3, 0x12, 'a', @variable, null)
sec_to_time(1, 1.3, 2E3, 0x12, 'a', @variable, null)
session_user(1, 1.3, 2E3, 0x12, 'a', @variable, null)
sign(1, 1.3, 2E3, 0x12, 'a', @variable, null)
sin(1, 1.3, 2E3, 0x12, 'a', @variable, null)
soundex(1, 1.3, 2E3, 0x12, 'a', @variable, null)
space(1, 1.3, 2E3, 0x12, 'a', @variable, null)
sqrt(1, 1.3, 2E3, 0x12, 'a', @variable, null)
std(1, 1.3, 2E3, 0x12, 'a', @variable, null)
stddev(1, 1.3, 2E3, 0x12, 'a', @variable, null)
strcmp(1, 1.3, 2E3, 0x12, 'a', @variable, null)
subdate(1, 1.3, 2E3, 0x12, 'a', @variable, null)
substring(1, 1.3, 2E3, 0x12, 'a', @variable, null)
substring_index(1, 1.3, 2E3, 0x12, 'a', @variable, null)
sum(1, 1.3, 2E3, 0x12, 'a', @variable, null)
subtime(1, 1.3, 2E3, 0x12, 'a', @variable, null)
sysdate(1, 1.3, 2E3, 0x12, 'a', @variable, null)
system_user(1, 1.3, 2E3, 0x12, 'a', @variable, null)
tan(1, 1.3, 2E3, 0x12, 'a', @variable, null)
time_format(1, 1.3, 2E3, 0x12, 'a', @variable, null)
time_to_sec(1, 1.3, 2E3, 0x12, 'a', @variable, null)
to_days(1, 1.3, 2E3, 0x12, 'a', @variable, null)
trim(1, 1.3, 2E3, 0x12, 'a', @variable, null)
ucase(1, 1.3, 2E3, 0x12, 'a', @variable, null)
unique_users(1, 1.3, 2E3, 0x12, 'a', @variable, null)
unix_timestamp(1, 1.3, 2E3, 0x12, 'a', @variable, null)
upper(1, 1.3, 2E3, 0x12, 'a', @variable, null)
user(1, 1.3, 2E3, 0x12, 'a', @variable, null)
version(1, 1.3, 2E3, 0x12, 'a', @variable, null)
week(1, 1.3, 2E3, 0x12, 'a', @variable, null)
weekday(1, 1.3, 2E3, 0x12, 'a', @variable, null)
yearweek(1, 1.3, 2E3, 0x12, 'a', @variable, null)
