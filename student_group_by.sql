USE QuanLySinhVien;

-- 1. Dem so luong hoc vien theo tung dia chi
SELECT Address, COUNT(StudentId) AS StudentCount
FROM Student
GROUP BY Address;

-- 2. Tinh diem trung binh cac mon cua moi hoc vien
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS AverageMark
FROM Student AS S
JOIN Mark AS M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName;

-- 3. Hoc vien co diem trung binh lon hon 15
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS AverageMark
FROM Student AS S
JOIN Mark AS M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(M.Mark) > 15;

-- 4. Hoc vien co diem trung binh cao nhat (bao gom ca truong hop dong diem)
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS AverageMark
FROM Student AS S
JOIN Mark AS M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(M.Mark) >= ALL (
    SELECT AVG(M2.Mark)
    FROM Mark AS M2
    GROUP BY M2.StudentId
);
