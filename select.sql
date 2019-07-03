use student;
# 1.查询同时存在1课程和2课程的情况
SELECT s1.studentId AS STU_ID, s1.courseId as COURSE1, s1.score as SCORE1, s2.courseId as COURSE2, s2.score as SCORE2
FROM student_course s1,
     student_course s2
WHERE s1.courseId = 1
  AND s2.courseId = 2
  AND s1.studentId = s2.studentId;

# 2.查询同时存在1课程和2课程的情况

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT student.name, AVG(student_course.score)
FROM student,
     student_course
WHERE student_course.studentId = student.id
GROUP BY student_course.studentId
HAVING AVG(student_course.score) >= 60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT *
FROM student
WHERE student.id NOT IN (
    SELECT studentId
    FROM student_course
);

# 5.查询所有有成绩的SQL
SELECT *
FROM student
WHERE student.id IN (
    SELECT studentId
    FROM student_course
);

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
SELECT *
FROM student
WHERE student.id IN (
    SELECT s1.studentId
    FROM student_course s1,
         student_course s2
    WHERE s1.courseId = 1
      AND s2.courseId = 2
      AND s1.studentId = s2.studentId
);

# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT *
FROM student,
     student_course
WHERE student.id = student_course.studentId
  AND student_course.courseId = 1
  AND student_course.score < 60
ORDER BY student_course.score DESC;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT *, AVG(score)
FROM course,
     student_course
WHERE course.id = student_course.courseId
GROUP BY student_course.courseId
ORDER BY AVG(score) DESC;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT student.name, student_course.score
FROM student,
     student_course,
     course
WHERE student_course.courseId = course.id
  AND course.name LIKE '数学'
  AND student_course.score < 60;
