USE datawinter;
SELECT * FROM student;

SELECT lname
,      fname
,	   major
FROM   student;

SELECT COUNT(major) AS 'Count'
,      major
FROM   student
GROUP BY major
ORDER BY COUNT(major) DESC;
-- WHERE  major = 'Data Science';

ash22023@byui.edu,
bar23029@byui.edu,
bro21046@byui.edu,
can22015@byui.edu,
cho20001@byui.edu,
cor23016@byui.edu,
dav21044@byui.edu,
wei17002@byui.edu,
gom23015@byui.edu,
gom20016@byui.edu,
gra21014@byui.edu,
gri21014@byui.edu,
hal14014@byui.edu,
jon23074@byui.edu,
kli23009@byui.edu,
kot19001@byui.edu,
lam20014@byui.edu,
abr22002@byui.edu,
ncu22010@byui.edu,
pot19001@byui.edu,
pri20012@byui.edu,
pro23007@byui.edu,
sal23049@byui.edu,
sto23036@byui.edu,
sto23041@byui.edu,
wym22002@byui.edu,
zoh20001@byui.edu,
vas22008@byui.edu