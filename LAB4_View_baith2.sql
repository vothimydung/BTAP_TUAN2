--Câu2
CREATE VIEW Cau2_view AS
SELECT sp.masp, sp.tensp, hs.tenhang, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota
FROM Sanpham AS sp
INNER JOIN Hangsx AS hs
ON sp.mahangsx = hs.mahangsx

SELECT * FROM Cau2_view
ORDER BY Cau2_view.giaban DESC;
--Câu3
CREATE VIEW Cau3_view AS
SELECT sp.masp, sp.tensp, hs.tenhang, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota
FROM Sanpham AS sp
INNER JOIN Hangsx AS hs
ON sp.mahangsx = hs.mahangsx
WHERE hs.tenhang = 'samsung';

SELECT * FROM Cau3_view;
--Câu4
CREATE VIEW Cau4_view AS
SELECT *
FROM Nhanvien
WHERE gioitinh = N'Nữ' AND phong = N'Kế toán';

SELECT * FROM Cau4_view;
--Câu5
CREATE VIEW Cau5_view AS
SELECT n.sohdn, n.masp, sp.tensp, hs.tenhang, n.soluongN, n.dongiaN, n.soluongN*n.dongiaN AS tiennhap, sp.mausac, sp.donvitinh, n.ngaynhap, nv.tennv, nv.phong
FROM Nhap AS n
INNER JOIN Sanpham AS sp
ON n.masp = sp.masp
INNER JOIN Hangsx AS hs
ON sp.mahangsx = hs.mahangsx
INNER JOIN Nhanvien AS nv
ON n.manv = nv.manv

SELECT * FROM Cau5_view
ORDER BY Cau5_view.sohdn ASC;
--Câu6
CREATE VIEW Cau6_view AS
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, Nhanvien.tennv, Nhanvien.phong
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018;

SELECT * FROM Cau6_view
ORDER BY Cau6_view.sohdx ASC;
--Câu7
CREATE VIEW Cau7_view AS
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Nhap.soluongN, Nhap.dongiaN, Nhap.ngaynhap, Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE YEAR(Nhap.ngaynhap) = 2017 AND Hangsx.tenhang = 'samsung';

SELECT * FROM Cau7_view;
--Câu8
CREATE VIEW Cau8_view AS
SELECT TOP 10 Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, Nhanvien.tennv, Nhanvien.phong
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Xuat.ngayxuat)= 2018; 

SELECT * FROM Cau8_view;
--Câu9
CREATE VIEW Cau9_view AS
SELECT TOP 10 *
FROM Sanpham

SELECT * FROM Cau9_view
ORDER BY giaban DESC;
--Câu10
CREATE VIEW Cau10_view AS
SELECT Sanpham.*
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND giaban BETWEEN 100000 AND 500000;

SELECT * FROM Cau10_view;
--Câu12
CREATE VIEW Cau12_view AS
SELECT SUM(giaban*soluongX) as TongTienXuat
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp 
WHERE ngayxuat = '2018-09-02';

SELECT * FROM Cau12_view;
--Câu13
CREATE VIEW Cau13_view AS
SELECT TOP 1 sohdn, ngaynhap
FROM Nhap
WHERE YEAR(ngaynhap) = 2018
ORDER BY soluongN*dongiaN;
SELECT * FROM Cau13_view;

--Câu14
CREATE VIEW Cau14_view AS
SELECT TOP 10 masp, SUM(soluongN) as TongSoLuongN
FROM Nhap
WHERE YEAR(ngaynhap) = 2019
GROUP BY masp
ORDER BY TongSoLuongN DESC;

SELECT * FROM Cau14_view;
--Câu15
CREATE VIEW Cau15_view AS
SELECT Sanpham.masp, tensp
FROM Sanpham 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE Hangsx.tenhang = 'Samsung' AND Nhap.manv = 'NV01';

SELECT * FROM Cau15_view;
--Câu16
CREATE VIEW Cau16_view AS
SELECT sohdn, Nhap.masp, soluongN, ngaynhap
FROM Nhap
JOIN Xuat ON Nhap.sohdn = Xuat.sohdx
WHERE Nhap.masp = 'SP02' AND Xuat.manv = 'NV02';

SELECT * FROM Cau16_view;
--Câu17
CREATE VIEW Cau17_view AS
SELECT manv, tennv
FROM Nhanvien 
JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-02-03';

SELECT * FROM Cau17_view;
